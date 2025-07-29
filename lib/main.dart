// main.dart
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:cached_network_image/cached_network_image.dart';

// 色コードからColor生成拡張
extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    String hex = hexString.replaceFirst('#', '');
    if (hex.length == 3) {
      // RGB (12-bit)
      hex = hex.split('').map((c) => '$c$c').join();
    }
    if (hex.length == 6) buffer.write('ff');
    buffer.write(hex);
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

// 表示モード
enum VideoViewMode { byCategory, byFormula }

// データモデル
class Video {
  final String iconName;
  final String title;
  final String videoURL;
  final List<String> equipment;
  final String costRating;
  final String? latex;

  Video({
    required this.iconName,
    required this.title,
    required this.videoURL,
    required this.equipment,
    required this.costRating,
    this.latex,
  });
}

class FormulaEntry {
  final String latex;
  final Video relatedVideo;
  final String categoryName;

  FormulaEntry(this.latex, this.relatedVideo, this.categoryName);
}

class Subcategory {
  final String name;
  final List<Video> videos;
  Subcategory({required this.name, required this.videos});
}

class Category {
  final String name;
  final String gifUrl;
  final List<Subcategory> subcategories;
  Category({required this.name, required this.gifUrl, required this.subcategories});
}

// サンプルデータ: 動作確認用
final sampleVideo = Video(
  iconName: 'assets/profile.jpg',
  title: 'サンプル動画',
  videoURL: 'UU2CRiPpxDQ',
  equipment: ['はかり', '定規'],
  costRating: '★☆☆',
  latex: r"$x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$",
);

final elasticCollision2D = Video(
  iconName: 'assets/elasticCollision2D.png',
  title: '弾性衝突(2次元)',
  videoURL: 'UU2CRiPpxDQ',
  equipment: ['10円玉'],
  costRating: '★☆☆',
  latex: """
<div class="common-box">ポイント</div>
<p>・運動量保存則:\$\\displaystyle m_1\\overrightarrow{v_1} + m_2\\overrightarrow{v_2} = m_1\\overrightarrow{v_1'} + m_2\\overrightarrow{v_2'}\$</p>
<p>・力学的エネルギー保存則:\$\\displaystyle \\frac12 m_1 |\\overrightarrow{v_1}|^2 + \\frac12 m_2 |\\overrightarrow{v_2}|^2 = \\frac12 m_1 |\\overrightarrow{v_1'}|^2 + \\frac12 m_2 |\\overrightarrow{v_2'}|^2\$</p>
<p>\$m_1\$, \$m_2\$：質量, \$\\overrightarrow{v_1}\$, \$\\overrightarrow{v_2}\$：衝突前の速度, \$\\overrightarrow{v_1'}\$, \$\\overrightarrow{v_2'}\$：衝突後の速度</p>

<div class="common-box">問題設定</div>
<p>静止している質量\$m\$の物体に対して、同じ質量\$m\$の物体が速度\$\\overrightarrow{v}\$で弾性衝突した場合、衝突後の2つの速度ベクトル\$\\overrightarrow{v_1}, \\overrightarrow{v_2}\$のなす角度を求めて下さい。</p>
<div style="text-align:center; margin:1em 0;">
  <img src="elasticCollision2D.png"
       alt="2次元弾性衝突"
       style="max-width:100%; height:auto;" />
</div>
<div class="common-box">理論計算</div>
<p>まず、2次元における運動量保存（ベクトル式）は次のように表される。</p>
\\[
\\begin{aligned}
m \\overrightarrow{v} &= m \\overrightarrow{v_1} + m \\overrightarrow{v_2} \\\\
\\Longleftrightarrow \\overrightarrow{v} &= \\overrightarrow{v_1} + \\overrightarrow{v_2}.
\\end{aligned}
\\]

<p>また、弾性衝突では力学的エネルギーも保存されるので、</p>
\\[
\\begin{aligned}
\\frac{1}{2} m |\\overrightarrow{v}|^2
&= \\frac{1}{2} m |\\overrightarrow{v_1}|^2 + \\frac{1}{2} m |\\overrightarrow{v_2}|^2 \\\\
\\Longleftrightarrow |\\overrightarrow{v}|^2 &= |\\overrightarrow{v_1}|^2 + |\\overrightarrow{v_2}|^2.
\\end{aligned}
\\]
<p>この2つの条件を同時に満たすとき、衝突後の2つの速度ベクトルは直角（90°）をなす。</p>
"""
);


final categories = <Category>[
  Category(
    name: '力学',
    gifUrl: 'assets/dynamics.gif',
    subcategories: [Subcategory(name: 'サンプル', videos: [elasticCollision2D])],
  ),
  Category(
    name: '電磁気学',
    gifUrl: 'assets/electromag.gif',
    subcategories: [Subcategory(name: 'サンプル', videos: [sampleVideo])],
  ),
  Category(
    name: '波動',
    gifUrl: 'assets/wave.gif',
    subcategories: [Subcategory(name: 'サンプル', videos: [sampleVideo])],
  ),
  Category(
    name: '熱力学',
    gifUrl: 'assets/fire.gif',
    subcategories: [Subcategory(name: 'サンプル', videos: [sampleVideo])],
  ),
  Category(
    name: 'アプリについて',
    gifUrl: 'assets/dynamics.gif',
    subcategories: [Subcategory(name: 'サンプル', videos: [sampleVideo])],
  ),
];

final formulaList = <FormulaEntry>[
  FormulaEntry(sampleVideo.latex!, sampleVideo, '二次方程式'),
];

void main() => runApp(JoyPhysicsApp());

class JoyPhysicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: '実験で学ぶ高校物理',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ContentView(),
      );
}

class ContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/init.png', fit: BoxFit.cover)),
          Positioned.fill(child: Container(color: Colors.white.withOpacity(0.7))),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                _Header(),
                Expanded(child: _CategoryList()),
                _Footer(),
              ],
            ),
          ),
        ],
      ),
    );
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          Image.asset('assets/profile.jpg', width: 120, height: 80),
          SizedBox(height: 4),
          Text('実験で学ぶ高校物理',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      );
}

class _CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categories.length + 1,
        itemBuilder: (context, index) {
          if (index == categories.length) return ListTile(
            title: Text('アプリについて'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AboutView())),
          );
          final cat = categories[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => VideoListView(category: cat))),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: HexColor.fromHex('#A52A2A').withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black26)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(cat.gifUrl, width: 35, height: 35), // ← ここを修正！
                    SizedBox(width: 8),
                    Text(cat.name,
                        style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          );
        },
      );
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: Text('Updated 2025/07/22', style: TextStyle(fontSize: 12, color: Colors.white70)),
      );
}

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('アプリについて')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Text('''
コンテンツはこれからも随時追加していく予定です。
...''', style: TextStyle(fontSize: 16)),
        ),
      );
}

class VideoListView extends StatefulWidget {
  final Category category;
  VideoListView({required this.category});
  @override
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  VideoViewMode viewMode = VideoViewMode.byCategory;

  List<Video> get videosInCategory => widget.category.subcategories.expand((s) => s.videos).toList();
  List<FormulaEntry> get formulasInCategory => formulaList.where((f) => videosInCategory.contains(f.relatedVideo)).toList();

  @override
  Widget build(BuildContext context) {
    final groupMap = <String, List<FormulaEntry>>{};
    for (var f in formulasInCategory) {
      groupMap.putIfAbsent(f.categoryName, () => []).add(f);
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.category.name)),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ToggleButtons(
              isSelected: [viewMode == VideoViewMode.byCategory, viewMode == VideoViewMode.byFormula],
              onPressed: (i) => setState(() => viewMode = i == 0 ? VideoViewMode.byCategory : VideoViewMode.byFormula),
              children: [Text('単元一覧'), Text('公式一覧')],
            ),
          ),
          Expanded(
            child: viewMode == VideoViewMode.byCategory
                ? _VideoCategoryList(subcategories: widget.category.subcategories)
                : _FormulaList(groupedFormulas: groupMap),
          ),
        ],
      ),
    );
  }
}

class _VideoCategoryList extends StatelessWidget {
  final List<Subcategory> subcategories;
  _VideoCategoryList({required this.subcategories});

  @override
  Widget build(BuildContext context) => ListView(
        children: subcategories.expand((sub) {
          return [
            ListTile(title: Text(sub.name, style: TextStyle(fontWeight: FontWeight.bold))),
            ...sub.videos.map((v) => ListTile(
                  leading: Image.asset(v.iconName, width: 48, height: 27),
                  title: Text(v.title),
                  trailing: Text(v.costRating, style: TextStyle(color: HexColor.fromHex('#FF9900'))),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VideoDetailView(video: v)),
                  ),
                )),
          ];
        }).toList(),
      );
}

class _FormulaList extends StatelessWidget {
  final Map<String, List<FormulaEntry>> groupedFormulas;
  _FormulaList({required this.groupedFormulas});

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.all(8),
        children: groupedFormulas.entries.expand((entry) {
          return [
            Container(
              width: double.infinity,
              color: Colors.grey[200],
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text(entry.key, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...entry.value.map((f) => ListTile(
                  title: Math.tex(f.latex!, textStyle: TextStyle(fontSize: 16)),
                  trailing: Text(f.relatedVideo.costRating, style: TextStyle(color: HexColor.fromHex('#FF9900'))),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => VideoDetailView(video: f.relatedVideo)),
                  ),
                )),
          ];
        }).toList(),
      );
}
class VideoDetailView extends StatelessWidget {
  final Video video;
  VideoDetailView({required this.video});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(video.videoURL.isEmpty ? '' : video.title)),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (video.videoURL.isNotEmpty) YouTubeWebView(videoURL: video.videoURL),
              if (video.latex != null) Padding(
                padding: EdgeInsets.only(top: 16),
                child: LatexWebView(latexHtml: video.latex!),  // ← ここをMath.texから変更
              ),
              if (video.equipment.isNotEmpty) EquipmentListView(equipment: video.equipment),
            ],
          ),
        ),
      );
}

class EquipmentListView extends StatelessWidget {
  final List<String> equipment;
  EquipmentListView({required this.equipment});

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(color: HexColor.fromHex('#E5E5E5'), borderRadius: BorderRadius.circular(5)),
              child: Text('実験道具', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            ...equipment.map((e) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: Text('・$e'),
                )),
          ],
        ),
      );
}
class YouTubeWebView extends StatefulWidget {
  final String videoURL;
  const YouTubeWebView({super.key, required this.videoURL});

  @override
  State<YouTubeWebView> createState() => _YouTubeWebViewState();
}

class _YouTubeWebViewState extends State<YouTubeWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://www.youtube.com/embed/${widget.videoURL}'));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: WebViewWidget(controller: _controller),
    );
  }
}
class LatexHtmlView extends StatefulWidget {
  final String htmlContent;

  const LatexHtmlView({Key? key, required this.htmlContent}) : super(key: key);

  @override
  _LatexHtmlViewState createState() => _LatexHtmlViewState();
}

class _LatexHtmlViewState extends State<LatexHtmlView> {
  late final WebViewController _controller;

  String get htmlTemplate => '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
  <style>
    body { font-family: sans-serif; padding: 12px; }
    .common-box { background:#eee; padding:6px; margin:10px 0; border-radius:4px; }
  </style>
</head>
<body>
${widget.htmlContent}
</body>
</html>
''';

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadHtmlString(htmlTemplate);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // 必要に応じて調整してください
      child: WebViewWidget(controller: _controller),
    );
  }
}
class LatexWebView extends StatefulWidget {
  final String latexHtml; // HTML + LaTeX混在テキスト

  const LatexWebView({Key? key, required this.latexHtml}) : super(key: key);

  @override
  _LatexWebViewState createState() => _LatexWebViewState();
}

class _LatexWebViewState extends State<LatexWebView> {
  late final WebViewController _controller;
  double webViewHeight = 100; // 初期高さ

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
          if (height != null && height != webViewHeight) {
            setState(() {
              webViewHeight = height + 24; // 少し余裕をもたせる
            });
          }
        },
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) async {
            await _controller.runJavaScript('''
              MathJax.typesetPromise().then(() => {
                SizeChannel.postMessage(document.body.scrollHeight.toString());
              });
            ''');
          },
        ),
      );
  }

  String get htmlContent => '''
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script>
  window.MathJax = {
    tex: {
      inlineMath: [['\$', '\$'], ['\\\\(', '\\\\)']]
    },
    svg: { fontCache: 'global' }
  };
  </script>
  <script src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
  <style>
    html, body {
      margin: 0; padding: 0;
      font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", sans-serif;
      font-size: 17px;
      background-color: transparent;
    }
    .common-box {
      width: 100%;
      background-color: #e5e5e5;
      padding: 8px 16px;
      font-weight: 600;
      font-size: 17px;
      border-radius: 5px;
      box-sizing: border-box;
    }
    p {
      margin: 0 0 1em;
    }
    .math-box {
      overflow-x: auto;
      overflow-y: hidden;
      -webkit-overflow-scrolling: touch;
      padding: 6px 0;
    }
  </style>
</head>
<body>
  <div class="math-box">
  ${widget.latexHtml}
  </div>
</body>
</html>
''';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: webViewHeight,
      child: WebViewWidget(controller: _controller..loadHtmlString(htmlContent)),
    );
  }
}
