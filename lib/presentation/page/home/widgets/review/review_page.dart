import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/presentation/page/web_view/web_view.dart';
import 'package:learning_english_web/presentation/view_models/home_page/home_page_view_model.dart';
import 'package:learning_english_web/presentation/widgets/text_button.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    final notifier = ref.read(homePageViewModelProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        Expanded(
          child: state.showReviewWord ?
          WebView(word: state.reviewWord) :
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => notifier.setShowReviewWord(true),
              behavior: HitTestBehavior.opaque,
              child: Center(
                child: Text(
                  state.reviewWord,
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: ColorConstants.hint),
                ),
              ),
            ),
          )
        ),
        TextButtonApp.primary(
          text: 'Next',
          textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: ColorConstants.black),
          width: double.infinity,
          height: 50,
          radius: 5,
          bgColor: ColorConstants.hint,
          onPressed: () => notifier.randomWord()
        ),
      ],
    );
  }
}