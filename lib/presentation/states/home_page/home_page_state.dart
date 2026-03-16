import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_english_web/models/note_model.dart';

part 'home_page_state.freezed.dart';

@freezed
abstract class HomePageState with _$HomePageState {
  const HomePageState._();

  const factory HomePageState({
    @Default(0) int pageIndex,
    @Default(false) bool changePage,
    @Default(false) bool showReviewWord,
    @Default('') String currentWord,
    @Default('') String reviewWord,
    @Default([]) List<String> words,
    @Default([]) List<String> newWords,
    @Default([]) List<NoteModel> notes,
  }) = _HomePageState;
}
