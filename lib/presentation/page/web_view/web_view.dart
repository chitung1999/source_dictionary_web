import 'package:flutter/cupertino.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

class WebView extends StatelessWidget {
  const WebView({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    final controller = PlatformWebViewController(const PlatformWebViewControllerCreationParams())
      ..loadRequest(
        LoadRequestParams(
          uri: Uri.parse('https://vi.wiktionary.org/w/rest.php/v1/page/$word/html'),
        ),
      );

    return Container(
      color: ColorConstants.white,
      child: PlatformWebViewWidget(
        PlatformWebViewWidgetCreationParams(controller: controller),
      ).build(context),
    );
  }

}