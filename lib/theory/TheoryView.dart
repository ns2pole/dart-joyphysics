import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:joyphysics/theory/theoryData.dart';
import 'package:joyphysics/LatexView.dart';

/// 日本語と数式を混ぜた文字列を解析して RichText に変換
Widget parseTextWithMath(String input) {
  final regex = RegExp(r'\$(.+?)\$'); // $...$ を検出
  final spans = <InlineSpan>[];

  int lastIndex = 0;
  for (final match in regex.allMatches(input)) {
    // 数式の前のテキスト
    if (match.start > lastIndex) {
      spans.add(TextSpan(text: input.substring(lastIndex, match.start)));
    }

    // 数式部分
    spans.add(WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: Math.tex(
        match.group(1)!,
        mathStyle: MathStyle.text,
        textStyle: const TextStyle(fontSize: 16),
      ),
    ));

    lastIndex = match.end;
  }

  // 最後のテキスト
  if (lastIndex < input.length) {
    spans.add(TextSpan(text: input.substring(lastIndex)));
  }

  return RichText(
    text: TextSpan(
      style: const TextStyle(color: Colors.black),
      children: spans,
    ),
  );
}

class TheoryListView extends StatelessWidget {
  final String categoryName;

  const TheoryListView({Key? key, required this.categoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final subcategories = theoryData[categoryName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: subcategories.length,
        itemBuilder: (context, index) {
          final sub = subcategories[index];
          return ExpansionTile(
            title: Text(
              sub.name, // サブカテゴリは普通のテキスト
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            children: sub.topics.map<Widget>((topic) {
              return ListTile(
                title: parseTextWithMath(topic.title), // タイトルは RichText で数式混在OK
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(
                          title: Text(
                            topic.title.replaceAll(RegExp(r'\$.*?\$'), ""), // AppBar は文字だけ
                          ),
                        ),
                        body: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: LatexWebView(
                            latexHtml: topic.latexContent, // 本文だけ LatexWebView
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
