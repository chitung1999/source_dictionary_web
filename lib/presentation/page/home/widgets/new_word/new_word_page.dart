import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/presentation/view_models/home_page/home_page_view_model.dart';
import 'package:learning_english_web/presentation/widgets/listview.dart';
import 'package:learning_english_web/presentation/widgets/text_button.dart';
import 'package:learning_english_web/presentation/widgets/toast_message.dart';

class NewWordPage extends ConsumerStatefulWidget {
  const NewWordPage({super.key});

  @override
  ConsumerState<NewWordPage> createState() => _NewWordPageState();
}

class _NewWordPageState extends ConsumerState<NewWordPage> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.read(homePageViewModelProvider.notifier);
    final state = ref.watch(homePageViewModelProvider);
    final border = OutlineInputBorder(borderSide: BorderSide(color: ColorConstants.white));
    return Center(
      child: SizedBox(
        width: 300,
        height: double.infinity,
        child: Column(
          spacing: 20,
          children: [
            TextField(
              controller: _controller,
              focusNode: _focusNode,
              style: const TextStyle(fontSize: 17, color: ColorConstants.white),
              decoration: InputDecoration(
                border: border,
                enabledBorder: border,
                focusedBorder: border,
                errorBorder: border,
                contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10)
              ),
              onSubmitted: (_) {
                notifier.addNewWord(_controller.text);
                _controller.text = '';
                if (!mounted) return;
                _focusNode.requestFocus();
              },
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: ColorConstants.white
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: ListviewApp(
                  itemCount: state.newWords.length,
                  thickness: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onLongPress: () async {
                        final result = await ToastMessage.showConfirm(context, 'Delete this new word?', 'Delete');
                        if (result) {
                          notifier.deleteNewWord(index);
                        }
                      },
                      title: Center(child: Text(
                          state.newWords[index],
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
                ),
              ),
            ),
            TextButtonApp.primary(
              text: 'Submit',
              textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: ColorConstants.black),
              width: double.infinity,
              height: 50,
              radius: 5,
              bgColor: ColorConstants.white,
              onPressed: () async {
                final result = await notifier.submitWords();
                if (result == StatusApp.updateDataError) {
                  if (!context.mounted) return;
                  ToastMessage.show(context, StatusApp.updateDataError);
                }
              }
            ),
          ],
        ),
      ),
    );
  }
}