import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class LatexWebView extends StatefulWidget {
  final String latexHtml;
  const LatexWebView({super.key, required this.latexHtml});

  @override
  State<LatexWebView> createState() => _LatexWebViewState();
}

class _LatexWebViewState extends State<LatexWebView> {
  late final WebViewController _controller;
  double webViewHeight = 100;
  final Map<String, String> _base64Cache = {};

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..addJavaScriptChannel(
        'SizeChannel',
        onMessageReceived: (JavaScriptMessage message) {
          final height = double.tryParse(message.message);
          if (height != null && (height - webViewHeight).abs() > 1) {
            setState(() {
              webViewHeight = height + 24;
            });
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (videoURL) async {
            await _controller.runJavaScript('''
              MathJax.typesetPromise().then(() => {
                setTimeout(() => {
                  SizeChannel.postMessage(document.body.scrollHeight.toString());
                }, 100);
              });
            ''');
          },
        ),
      );

    _prepareAndLoad();
  }

  Future<void> _prepareAndLoad() async {
    final processedHtml = await _embedBase64Images(widget.latexHtml);
    final fullHtml = await _wrapHtmlWithFont(processedHtml);
    _controller.loadHtmlString(fullHtml);
  }

  Future<String> _embedBase64Images(String html) async {
    final regex = RegExp(r'<img\s+[^>]*src="([^"]+)"[^>]*>', caseSensitive: false);
    var newHtml = html;
    for (final match in regex.allMatches(html)) {
      final src = match.group(1);
      if (src != null && src.startsWith('assets/')) {
        if (!_base64Cache.containsKey(src)) {
          try {
            final bytes = await rootBundle.load(src);
            final b64 = base64Encode(bytes.buffer.asUint8List());
            _base64Cache[src] = b64;
          } catch (_) {
            _base64Cache[src] = '';
          }
        }
        final b64 = _base64Cache[src];
        if (b64 != null && b64.isNotEmpty) {
          newHtml = newHtml.replaceAll(src, 'data:image/png;base64,$b64');
        }
      }
    }
    return newHtml;
  }

  Future<String> _wrapHtmlWithFont(String bodyHtml) async {
    final fontData = await rootBundle.load('assets/fonts/keifont.ttf');
    final fontBase64 = base64Encode(fontData.buffer.asUint8List());

    return '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    @font-face {
      font-family: 'KeiFont';
      src: videoURL(data:font/ttf;base64,$fontBase64) format('truetype');
    }
    html, body {
      margin: 0;
      padding: 0;
      font-family: 'KeiFont', sans-serif;
      font-size: 17px;
      background-color: transparent;
      line-height: 1.75;  /* ← 行間を少し広く */
    }
    .common-box {
      background: #eee;
      padding: 8px 16px;
      margin: 0px 0;
      border-radius: 4px;
    }
    .math-box {
      width: 100%;
      padding: 0px 0px;
      box-sizing: border-box;
      white-space: normal;
      overflow-wrap: break-word;
      word-break: break-word;
      overflow-x: hidden;
      -webkit-overflow-scrolling: touch;
    }
    .math-box img,
    .math-box table {
      max-width: 90%;
      height: auto;
      display: block;
      margin-left: auto;
      margin-right: auto;
    }
    .math-box table td,
    .math-box table th {
      word-wrap: break-word;
      white-space: normal;
    }
  </style>
  <script>
    window.MathJax = {
      options: {localStorage: false},
      tex: {inlineMath: [['\$','\$'], ['\\\\(','\\\\)']]},
      svg: {fontCache: 'global'}
    };
  </script>
  <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
</head>
<body>
  <div class="math-box">
    $bodyHtml
  </div>
</body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: webViewHeight,
      child: WebViewWidget(controller: _controller),
    );
  }
}