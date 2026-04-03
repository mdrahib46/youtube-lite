import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:youtube/core/constants/app_colors.dart';
import 'package:youtube/presentation/core/widgets/full_screen_loading.dart';

class WebViewWrapper extends StatefulWidget {
  const WebViewWrapper({
    super.key,
    required this.url,
    required this.title,
  });

  final String url, title;

  @override
  State<WebViewWrapper> createState() => _WebViewWrapperState();
}

class _WebViewWrapperState extends State<WebViewWrapper> {
  late final WebViewController _controller;

  final ValueNotifier<bool> _isLoading = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            _isLoading.value = progress < 100;
          },
          onPageFinished: (String url) {
            _isLoading.value = false;


            _controller.runJavaScript("""
setInterval(() => {
  document.querySelectorAll('ytm-mobile-topbar-renderer').forEach(el => {
    el.style.display = 'none';
  });
}, 1000);
""");

            _controller.runJavaScript("""
setInterval(() => {
  document.querySelectorAll('ytm-pivot-bar-renderer').forEach(el => {
    el.style.display = 'none';
  });
}, 1000);
""");
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isLoading,
      builder: (context, isLoading, child) {
        return FullScreenLoadingOverlay(
          isLoading: isLoading,
          child: SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: WebViewWidget(controller: _controller),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      color: AppColors.backgroundDark,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 48),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}