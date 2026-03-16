import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/presentation/page/web_view/web_view.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.word});
  final String word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.bg3,
        toolbarHeight: 50,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Expanded(child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back_ios_new, color: ColorConstants.white,))
            )),
            Expanded(
              child: Center(
                child: Text(
                  word,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstants.white)
                ),
              ),
            ),
            Expanded(child: SizedBox.shrink())
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
        child: WebView(word: word),
      ),
    );
  }

}