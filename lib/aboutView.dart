import 'package:flutter/material.dart';
class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('アプリについて')),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Text('''
コンテンツはこれからも随時追加していく予定です。
扱ってほしいテーマがあれば、YouTubeやTikTokのコメント欄、またはアプリの評価欄にぜひご記入ください。できる限り、リクエストにお応えしていきます。
このアプリのテーマは、「実験を通して物理を楽しんで学んでもらう」こと。
「物理がわからない」「楽しくない」「もっとちゃんと学びたい」——そんな悩みや思いを持つ方の力になれたら嬉しいです。
AIの発展によって、多くの情報が無料で手に入るようになりました。だからこそ今、体験を通じて学ぶことの価値がより大きくなっていると感じています。
物理を、もっと身近に。もっと楽しく。あなたの学びの一歩になれば幸いです。
''', style: TextStyle(fontSize: 17)),
        ),
      );
}