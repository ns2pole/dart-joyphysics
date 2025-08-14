

import 'package:flutter/material.dart';
import 'package:joyphysics/LatexView.dart';
import 'package:joyphysics/theory/theoryData.dart';

// 理論ページ
class TheoryListView extends StatelessWidget {
  final String categoryName;
// サンプルデータ（後で実際のデータに置き換え可）
  TheoryListView({Key? key, required this.categoryName}) : super(key: key);

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
              sub.name,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            children: sub.topics.map((topic) {
              return ListTile(
                title: Text(topic.title),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Scaffold(
                        appBar: AppBar(title: Text(topic.title)),
                        body: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: LatexWebView(latexHtml: topic.latexContent),
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
