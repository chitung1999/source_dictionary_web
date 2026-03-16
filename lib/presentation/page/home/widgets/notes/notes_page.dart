import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/models/note_model.dart';
import 'package:learning_english_web/presentation/page/home/widgets/notes/note_edit_page.dart';
import 'package:learning_english_web/presentation/page/home/widgets/notes/widgets/note_item.dart';
import 'package:learning_english_web/presentation/view_models/home_page/home_page_view_model.dart';
import 'package:learning_english_web/presentation/widgets/listview.dart';
import 'package:learning_english_web/presentation/widgets/text_button.dart';
import 'package:learning_english_web/presentation/widgets/toast_message.dart';

class NotesPage extends ConsumerWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homePageViewModelProvider);
    final notifier = ref.read(homePageViewModelProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        Expanded(
          child: ListviewApp(
            itemCount: state.notes.length,
            thickness: 15,
            padding: 25,
            itemBuilder: (context, index) {
              return NoteItem(
                title: state.notes[index].title,
                note: state.notes[index].note,
                onEdit: () async {
                  final NoteModel? result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NoteEditPage(note: state.notes[index]))
                  );

                  if (result != null)
                  {
                    final addResult = await notifier.editNote(result, index);
                    if (addResult == StatusApp.updateDataError) {
                      if (!context.mounted) return;
                      ToastMessage.show(context, StatusApp.updateDataError);
                    }
                  }
                },
                onDelete: () async {
                  final result = await ToastMessage.showConfirm(context, 'Delete this note?', 'Delete');
                  if (result) {
                    final result = await notifier.deleteNote(index);
                    if (result == StatusApp.updateDataError) {
                      if (!context.mounted) return;
                      ToastMessage.show(context, StatusApp.updateDataError);
                    }
                  }
                },
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10.0);
            }
          )
        ),
        TextButtonApp.primary(
          text: 'Add Note',
          textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: ColorConstants.black),
          width: double.infinity,
          height: 50,
          radius: 5,
          bgColor: ColorConstants.hint,
          onPressed: () async {
            final NoteModel? result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NoteEditPage(note: NoteModel()))
            );

            if (result != null)
            {
              final addResult = await notifier.addNote(result);
              if (addResult == StatusApp.updateDataError) {
                if (!context.mounted) return;
                ToastMessage.show(context, StatusApp.updateDataError);
              }
            }
          }
        ),
      ],
    );
  }
}