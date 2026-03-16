import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/models/note_model.dart';
import 'package:learning_english_web/presentation/widgets/text_button.dart';
import 'package:learning_english_web/presentation/widgets/toast_message.dart';

class NoteEditPage extends StatelessWidget {
  const NoteEditPage({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleCtrl = TextEditingController(text: note.title);
    final TextEditingController contentCtrl = TextEditingController(text: note.note);


    final border = OutlineInputBorder(borderSide: BorderSide(color: ColorConstants.white));

    Widget textFieldNote(TextEditingController controller, int flex, String title) {
      return Flexible(
        flex: flex,
        child: TextField(
          controller: controller,
          expands: true,
          minLines: null,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          textAlignVertical: TextAlignVertical.top,
          style: const TextStyle(fontSize: 17, color: ColorConstants.hint),
          decoration: InputDecoration(
            labelText: title,
            labelStyle: const TextStyle(fontSize: 20, color: ColorConstants.hint),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            contentPadding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10)
          ),
        )
      );
    }

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
                    'Note',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstants.white)
                ),
              ),
            ),
            Expanded(child: SizedBox.shrink())
          ],
        ),
      ),
      body: Container(
        color: ColorConstants.bg1,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
        child: Column(
          spacing: 15,
          children: [
            textFieldNote(titleCtrl,1,  'Title'),
            textFieldNote(contentCtrl, 2, 'Content'),
            TextButtonApp.primary(
              text: 'Confirm',
              textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: ColorConstants.black),
              width: double.infinity,
              height: 50,
              radius: 5,
              bgColor: ColorConstants.hint,
              onPressed: () {
                if (titleCtrl.text.isEmpty || contentCtrl.text.isEmpty) {
                  ToastMessage.show(context, StatusApp.noteEmpty);
                  return;
                }
                Navigator.pop(context, NoteModel(title: titleCtrl.text, note: contentCtrl.text));
              }
            ),
          ],
        ),
      ),
    );
  }
}
