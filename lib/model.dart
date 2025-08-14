import 'package:flutter/material.dart';

// データモデル
class Video {
  final bool? isNew;
  final String category;
  final String iconName;
  final String title;
  final String videoURL;
  final List<String> equipment;
  final String costRating;
  final bool? isSmartPhoneOnly;
  final String? latex;
  final Widget? experimentWidget;

  Video({
    this.isNew,
    required this.category,
    required this.iconName,
    required this.title,
    required this.videoURL,
    required this.equipment,
    required this.costRating,
    this.isSmartPhoneOnly,
    this.latex,
    this.experimentWidget,  // ← named, optional, default null
  });

  String get assetPath => 'assets/$category/$iconName.png';

  Image getImage() => Image.asset(assetPath);
}


