import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/core/enums/page_app.dart';
import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/network/appwrite_service.dart';
import 'package:learning_english_web/presentation/page/home/widgets/header/header.dart';
import 'package:learning_english_web/presentation/page/home/widgets/new_word/new_word_page.dart';
import 'package:learning_english_web/presentation/page/home/widgets/notes/notes_page.dart';
import 'package:learning_english_web/presentation/page/home/widgets/review/review_page.dart';
import 'package:learning_english_web/presentation/page/home/widgets/words/words_page.dart';
import 'package:learning_english_web/presentation/page/login/login_page.dart';
import 'package:learning_english_web/presentation/view_models/home_page/home_page_view_model.dart';
import 'package:learning_english_web/presentation/widgets/toast_message.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final getDataStatus = await ref.read(homePageViewModelProvider.notifier).getData();
      if (getDataStatus != StatusApp.getDataSuccess) {
        if (!mounted) return;
        ToastMessage.show(context, StatusApp.error);
      }
    });
    super.initState();
  }

  Future<void> onChangePage(PageApp option) async {
    if (option == PageApp.logout) {
      await server.logout();

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } else {
      ref.read(homePageViewModelProvider.notifier).setCurrentPage(option.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderApp(onTap: onChangePage),
      body: Container(
        color: ColorConstants.bg1,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
        child: IndexedStack(
          index: ref.watch(homePageViewModelProvider).pageIndex,
          children: [
            NewWordPage(),
            WordsPage(),
            NotesPage(),
            ReviewPage()
          ],
        ),
      ),
    );
  }
}