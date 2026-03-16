import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:flutter/material.dart';
import 'package:learning_english_web/core/constants/color_constants.dart';
import 'package:learning_english_web/presentation/page/home/widgets/header/header.dart';
import 'package:learning_english_web/presentation/page/home/widgets/notes/notes_page.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderApp(onTap: (_) {}),
      body: Container(
        color: ColorConstants.bg1,
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 70.0),
        child: NotesPage(),
      ),
    );
  }
}