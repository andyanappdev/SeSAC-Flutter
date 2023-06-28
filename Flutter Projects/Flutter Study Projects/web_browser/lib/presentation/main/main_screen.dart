import 'package:flutter/material.dart';
import 'package:web_browser/presentation/main/main_view_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Instantiating a View Model
  final viewModel = MainViewModel();

  @override
  Widget build(BuildContext context) {
    /// SafeArea 적용 생활화 하기
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Web Browser Test'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            PopupMenuButton<String>(
              onSelected: (value) {
                // View Model에서 가져오기
                viewModel.controller.loadRequest(Uri.parse(value));
              },
              itemBuilder: (context) {
                // View Model에서 Map 데이터를 mapping 해서 PopupMenuItem 을 설정
                return viewModel.popupMenuItems.entries.map((item) {
                  return PopupMenuItem<String>(
                    value: item.value,
                    child: Text(item.key),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            // View Model에서 가져오기
            if (await viewModel.controller.canGoBack()) {
              await viewModel.controller.goBack();
              return false;
            }
            return true;
          },
          child: WebViewWidget(
            // View Model에서 가져오기
            controller: viewModel.controller,
          ),
        ),
      ),
    );
  }
}
