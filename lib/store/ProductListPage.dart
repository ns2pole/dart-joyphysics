import '../../model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:joyphysics/experiment/ExperimentView.dart';
import 'package:joyphysics/dataExporter.dart';


class ProductListPage extends StatelessWidget {
  ProductListPage({super.key});

  final List<Product> products = [
    Product(
      title: 'オシロスコープ(4000円程度)',
      url: 'https://amzn.to/4gy0h9l',
      imageUrl: 'https://example.com/oscilloscope.jpg',
      price: '約4,000円',
      rating: 2,
      videos: [],
    ),
    Product(
      title: 'ネオジム磁石(1000円程度)',
      url: 'https://amzn.to/4ptwsdX',
      imageUrl: 'assets/images/magnet.jpg',
      price: '約1,000円',
      rating: 3,
      videos: [neodymiumMagnetFieldMeasurement],
    ),
    Product(
      title: '磁界測定器(13000円程度)',
      url: 'https://amzn.to/4mmRVmb',
      imageUrl: null,
      price: '約13,000円',
      rating: 2,
      videos: [],
    ),
  ];

  Future<void> _openExternalUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final can = await canLaunchUrl(uri);
    debugPrint('canLaunch: $can for $url');

    if (!can) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('リンクを開けませんでした（端末に対応アプリが見つかりません）。')),
      );
      return;
    }

    try {
      final launched = await launchUrl(uri, mode: LaunchMode.externalApplication);
      debugPrint('launchUrl returned: $launched for $url');
      if (!launched) {
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

  Widget _buildRatingStars(int rating) {
    final r = rating.clamp(0, 3).toInt();
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return Icon(i < r ? Icons.star : Icons.star_border, size: 18, color: Colors.amber);
      }),
    );
  }

  Widget _buildProductImage(String? imageUrl) {
    const double w = 120, h = 80;
    if (imageUrl == null || imageUrl.trim().isEmpty) {
      return Container(
        width: w,
        height: h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(Icons.image_not_supported, size: 36, color: Colors.grey),
      );
    }

    final trimmed = imageUrl.trim();
    final lower = trimmed.toLowerCase();
    if (lower.startsWith('http://') || lower.startsWith('https://')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          trimmed,
          width: w,
          height: h,
          fit: BoxFit.cover,
          errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
            return Container(
              width: w,
              height: h,
              color: Colors.grey.shade200,
              child: const Icon(Icons.broken_image, size: 36, color: Colors.grey),
            );
          },
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        trimmed,
        width: w,
        height: h,
        fit: BoxFit.cover,
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return Container(
            width: w,
            height: h,
            color: Colors.grey.shade200,
            child: const Icon(Icons.broken_image, size: 36, color: Colors.grey),
          );
        },
      ),
    );
  }

  void _onVideoTap(BuildContext context, dynamic item) {
    try {
      if (item == null) return;

      if (item is Video) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => VideoDetailView(video: item)));
        return;
      }
      if (item is String) {
        _openExternalUrl(context, item);
        return;
      }
      if (item is Map) {
        if (item['video'] is Video) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => VideoDetailView(video: item['video'])));
          return;
        }
        final url = item['url'] ?? item['videoURL'] ?? item['link'];
        if (url is String && url.isNotEmpty) {
          _openExternalUrl(context, url);
          return;
        }
      }
    } catch (e, st) {
      debugPrint('video tap error: $e\n$st');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('動画リンクを開けませんでした')));
    }
  }

  String _videoLabel(dynamic item) {
    if (item == null) return '動画';
    if (item is Video) return item.title ?? '動画';
    if (item is String) return item;
    if (item is Map) {
      if (item['title'] is String && (item['title'] as String).isNotEmpty) return item['title'];
      if (item['label'] is String) return item['label'];
      final url = item['url'] ?? item['videoURL'] ?? item['link'];
      if (url is String) return url;
    }
    return '動画';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('おすすめ実験グッズ')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          final videos = (p.videos is List) ? (p.videos as List).cast<dynamic>() : <dynamic>[];

          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12),
              // カード内を Column にして、画像＋情報は Row、動画リストは Row の下（カード全幅を使用）
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- 上段: 画像 + タイトル/価格/評価/Amazonボタン（従来どおり）
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductImage(p.imageUrl),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(p.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text('おすすめ度', style: TextStyle(fontSize: 14)),
                                const SizedBox(width: 8),
                                _buildRatingStars(p.rating),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                if (p.price != null) Text(p.price!, style: const TextStyle(fontSize: 14)),
                                const Spacer(),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    icon: const Icon(Icons.shopping_cart_outlined),
                                    label: const Text('Amazonで見る'),
                                    onPressed: () {
                                      if (p.url.isNotEmpty) _openExternalUrl(context, p.url);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.symmetric(vertical: 12),
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // --- 下段: 関連実験動画（ここをカード全幅に広げる）
                  if (videos.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    // 右に少し余白を付けるために Padding を追加（label の右側に余白）
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: const Text('関連実験動画', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 8),
                    // LayoutBuilder で利用可能幅を取得して各ボタン幅を調整
                    LayoutBuilder(builder: (context, constraints) {
                      final available = constraints.maxWidth;
                      // 各ボタンはカード幅の約90%をデフォルト幅とする（好みで調整）
                      final buttonWidth = available * 0.9;
                      return Wrap(
                        spacing: 8,
                        runSpacing: 6,
                        children: videos.map((videoItem) {
                          final label = _videoLabel(videoItem);
                          return SizedBox(
                            width: buttonWidth,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.play_circle_outline),
                              label: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Text(label, overflow: TextOverflow.ellipsis, maxLines: 1),
                              ),
                              onPressed: () => _onVideoTap(context, videoItem),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                alignment: Alignment.centerLeft,
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
