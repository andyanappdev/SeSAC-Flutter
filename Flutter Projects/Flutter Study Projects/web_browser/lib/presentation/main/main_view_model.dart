import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainViewModel {
  /// Instantiating a WebViewController
  final WebViewController _webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://flutter.dev'));

  /// WebViewController getter
  WebViewController get controller => _webViewController;

  /// PopupMenuItemSource Map
  final Map<String, String> _popupMenuButtonSource = {
    'Google': 'https://www.google.com',
    'Naver': 'https://www.naver.com',
    'KaKao': 'https://www.kakao.com'
  };

  /// PopupMenuItemSource getter
  Map<String, String> get popupMenuItems => _popupMenuButtonSource;
}
