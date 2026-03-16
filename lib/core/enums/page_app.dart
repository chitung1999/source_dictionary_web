import 'package:flutter/material.dart';

enum PageApp {
  newWord,
  words,
  notes,
  review,
  logout;

  String title() {
    switch (this) {
      case PageApp.newWord:
        return 'New Word';
      case PageApp.words:
        return 'Words';
      case PageApp.notes:
        return 'Notes';
      case PageApp.review:
        return 'Review';
      case PageApp.logout:
        return 'Logout';
    }
  }

  IconData icon() {
    switch (this) {
      case PageApp.newWord:
        return Icons.add;
      case PageApp.words:
        return Icons.sort_by_alpha;
      case PageApp.notes:
        return Icons.note_alt_outlined;
      case PageApp.review:
        return Icons.play_arrow_outlined;
      case PageApp.logout:
        return Icons.logout;
    }
  }
}