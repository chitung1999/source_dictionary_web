import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/presentation/page/web_view/web_view_page.dart';
import 'package:learning_english_web/presentation/view_models/home_page/home_page_view_model.dart';
import 'package:learning_english_web/presentation/widgets/listview.dart';
import 'package:learning_english_web/presentation/widgets/toast_message.dart';

class WordList extends ConsumerWidget {
  const WordList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homePageViewModelProvider.notifier);
    final state = ref.watch(homePageViewModelProvider);

    return Container(
      width: 300,
      height: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorConstants.white
        ),
        borderRadius: BorderRadius.circular(3),
      ),
      child: ListviewApp(
        itemCount: state.words.length,
        thickness: 10,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              notifier.setCurrentWord(state.words[index]);

              if (MediaQuery.of(context).size.width <= 1000) {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => WebViewPage(word: state.words[index]))
                );
              }
            },
            onLongPress: () async {
              final result = await ToastMessage.showConfirm(context, 'Delete this word?', 'Delete');
              if (result) {
                final result = await notifier.deleteWord(index);
                if (result == StatusApp.updateDataError) {
                  if (!context.mounted) return;
                  ToastMessage.show(context, StatusApp.updateDataError);
                }
              }
            },
            title: Center(child: Text(
              state.words[index],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: ColorConstants.hint)
            )),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: ColorConstants.white,
            height: 1,
            thickness: 1,
          );
        },
      )
    );
  }
}
