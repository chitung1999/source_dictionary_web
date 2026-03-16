import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_english_web/presentation/page/home/widgets/words/widgets/word_list.dart';
import 'package:learning_english_web/presentation/page/web_view/web_view.dart';
import 'package:learning_english_web/presentation/view_models/home_page/home_page_view_model.dart';

class WordsPage extends ConsumerWidget {
  const WordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        WordList(),
        if(width > 1000 && state.currentWord.isNotEmpty) Expanded(child: WebView(word: state.currentWord)),
      ],
    );
  }
}