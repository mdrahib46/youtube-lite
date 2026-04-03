import 'package:flutter/material.dart';
import 'package:youtube/presentation/core/widgets/web_view_wrapper.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key, required this.title, required this.url});
  final String title, url;

  @override
  Widget build(BuildContext context) {
    return WebViewWrapper(url: url, title: title);
  }
}
