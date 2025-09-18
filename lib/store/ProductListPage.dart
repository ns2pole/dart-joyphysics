import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  // 仮の商品リスト（タイトルとアソシエイトリンクのみ）
  final List<Map<String, String>> products = [
    {
      'title': 'オシロスコープ(4000円程度)',
      'url': 'https://amzn.to/4gy0h9l',
    },
    {
      'title': 'ネオジム磁石(1000円程度)',
      'url': 'https://amzn.to/4ptwsdX',
    },
    {
      'title': '磁界測定器(13000円程度)',
      'url': 'https://amzn.to/4mmRVmb',
    },
  ];

  // 外部リンクを開く関数（ログ付き・フォールバックにSnackBar）
  Future<void> _openExternalUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final can = await canLaunchUrl(uri);
    debugPrint('canLaunch: $can for $url');

    if (!can) {
      debugPrint('canLaunch returned false. Showing fallback message.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('リンクを開けませんでした（端末に対応アプリが見つかりません）。')),
      );
      return;
    }

    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      debugPrint('launchUrl returned: $launched for $url');
      if (!launched) {
        // 外部起動が失敗した場合のフォールバック処理（ここでは通知のみ）
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('外部アプリで開けませんでした。端末設定を確認してください。')),
        );
      }
    } catch (e, st) {
      debugPrint('launch error: $e\n$st');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('リンクを開く際にエラーが発生しました')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('おすすめ実験グッズ'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // タイトル
                  Text(
                    product['title']!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  // Amazonリンクボタン
                  ElevatedButton.icon(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    label: const Text('Amazonで見る'),
                    onPressed: () => _openExternalUrl(context, product['url']!),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
