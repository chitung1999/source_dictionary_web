import 'dart:math';

import 'package:learning_english_web/core/enums/status_app.dart';
import 'package:learning_english_web/models/note_model.dart';
import 'package:learning_english_web/network/appwrite_service.dart';
import 'package:learning_english_web/presentation/states/home_page/home_page_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_view_model.g.dart';

@riverpod
class HomePageViewModel extends _$HomePageViewModel {

  @override
  HomePageState build() {
    return const HomePageState();
  }

  Future<StatusApp> loginStatus() async {
    return await server.checkLoginStatus();
  }

  Future<StatusApp> getData() async {
    final result = await server.getData();
    state = state.copyWith(words: result.words, notes: result.notes);
    randomWord();
    return result.status;
  }

  void addNewWord(String text) {
    String word = text.trim().split(RegExp(r'\s+')).join(' ');

    if (word.isEmpty || !RegExp(r'^[a-zA-Z ]+$').hasMatch(word)) {
      return;
    }
    List<String> newWords = List<String>.from(state.newWords);
    newWords.insert(0, word);
    state = state.copyWith(newWords: newWords);
  }

  void deleteNewWord(int index) {
    List<String> newWords = List<String>.from(state.newWords);
    newWords.removeAt(index);
    state = state.copyWith(newWords: newWords);
  }

  void randomWord() {
    if (state.words.isEmpty) return;

    final random = Random();
    state = state.copyWith(reviewWord: state.words[random.nextInt(state.words.length)], showReviewWord: false);
  }

  void setShowReviewWord(bool isShow) => state = state.copyWith(showReviewWord: isShow);

  Future<StatusApp> deleteWord(int index) async {
    List<String> words = List<String>.from(state.words);
    words.removeAt(index);
    final result = await server.updateWords(words);
    if (result == StatusApp.updateWordsSuccess) {
      state = state.copyWith(words: words);
    }
    return result;
  }

  Future<StatusApp> submitWords() async {
    List<String> words = List<String>.from(state.words);
    words.addAll(state.newWords);
    words.sort();
    final result = await server.updateWords(words);
    if (result == StatusApp.updateWordsSuccess) {
      state = state.copyWith(words: words, newWords: []);
    }
    return result;
  }

  Future<StatusApp> deleteNote(int index) async {
    List<NoteModel> notes = List<NoteModel>.from(state.notes);
    notes.removeAt(index);
    final result = await server.updateNotes(notes);
    if (result == StatusApp.updateNotesSuccess) {
      state = state.copyWith(notes: notes);
    }
    return result;
  }

  Future<StatusApp> addNote(NoteModel note) async {
    List<NoteModel> notes = List<NoteModel>.from(state.notes);
    notes.add(note);
    final result = await server.updateNotes(notes);
    if (result == StatusApp.updateNotesSuccess) {
      state = state.copyWith(notes: notes);
    }
    return result;
  }

  Future<StatusApp> editNote(NoteModel note, int index) async {
    List<NoteModel> notes = List<NoteModel>.from(state.notes);
    notes[index] = note;
    final result = await server.updateNotes(notes);
    if (result == StatusApp.updateNotesSuccess) {
      state = state.copyWith(notes: notes);
    }
    return result;
  }

  void changePage(bool changePage) => state = state.copyWith(changePage: changePage);
  void setCurrentPage(int index) => state = state.copyWith(pageIndex: index);
  void setCurrentWord(String word) => state = state.copyWith(currentWord: word);
}