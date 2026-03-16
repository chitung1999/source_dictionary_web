// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageState {

 int get pageIndex; bool get changePage; bool get showReviewWord; String get currentWord; String get reviewWord; List<String> get words; List<String> get newWords; List<NoteModel> get notes;
/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePageStateCopyWith<HomePageState> get copyWith => _$HomePageStateCopyWithImpl<HomePageState>(this as HomePageState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageState&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&(identical(other.changePage, changePage) || other.changePage == changePage)&&(identical(other.showReviewWord, showReviewWord) || other.showReviewWord == showReviewWord)&&(identical(other.currentWord, currentWord) || other.currentWord == currentWord)&&(identical(other.reviewWord, reviewWord) || other.reviewWord == reviewWord)&&const DeepCollectionEquality().equals(other.words, words)&&const DeepCollectionEquality().equals(other.newWords, newWords)&&const DeepCollectionEquality().equals(other.notes, notes));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex,changePage,showReviewWord,currentWord,reviewWord,const DeepCollectionEquality().hash(words),const DeepCollectionEquality().hash(newWords),const DeepCollectionEquality().hash(notes));

@override
String toString() {
  return 'HomePageState(pageIndex: $pageIndex, changePage: $changePage, showReviewWord: $showReviewWord, currentWord: $currentWord, reviewWord: $reviewWord, words: $words, newWords: $newWords, notes: $notes)';
}


}

/// @nodoc
abstract mixin class $HomePageStateCopyWith<$Res>  {
  factory $HomePageStateCopyWith(HomePageState value, $Res Function(HomePageState) _then) = _$HomePageStateCopyWithImpl;
@useResult
$Res call({
 int pageIndex, bool changePage, bool showReviewWord, String currentWord, String reviewWord, List<String> words, List<String> newWords, List<NoteModel> notes
});




}
/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._self, this._then);

  final HomePageState _self;
  final $Res Function(HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pageIndex = null,Object? changePage = null,Object? showReviewWord = null,Object? currentWord = null,Object? reviewWord = null,Object? words = null,Object? newWords = null,Object? notes = null,}) {
  return _then(_self.copyWith(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,changePage: null == changePage ? _self.changePage : changePage // ignore: cast_nullable_to_non_nullable
as bool,showReviewWord: null == showReviewWord ? _self.showReviewWord : showReviewWord // ignore: cast_nullable_to_non_nullable
as bool,currentWord: null == currentWord ? _self.currentWord : currentWord // ignore: cast_nullable_to_non_nullable
as String,reviewWord: null == reviewWord ? _self.reviewWord : reviewWord // ignore: cast_nullable_to_non_nullable
as String,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<String>,newWords: null == newWords ? _self.newWords : newWords // ignore: cast_nullable_to_non_nullable
as List<String>,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteModel>,
  ));
}

}


/// @nodoc


class _HomePageState extends HomePageState {
  const _HomePageState({this.pageIndex = 0, this.changePage = false, this.showReviewWord = false, this.currentWord = '', this.reviewWord = '', final  List<String> words = const [], final  List<String> newWords = const [], final  List<NoteModel> notes = const []}): _words = words,_newWords = newWords,_notes = notes,super._();
  

@override@JsonKey() final  int pageIndex;
@override@JsonKey() final  bool changePage;
@override@JsonKey() final  bool showReviewWord;
@override@JsonKey() final  String currentWord;
@override@JsonKey() final  String reviewWord;
 final  List<String> _words;
@override@JsonKey() List<String> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}

 final  List<String> _newWords;
@override@JsonKey() List<String> get newWords {
  if (_newWords is EqualUnmodifiableListView) return _newWords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_newWords);
}

 final  List<NoteModel> _notes;
@override@JsonKey() List<NoteModel> get notes {
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notes);
}


/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomePageStateCopyWith<_HomePageState> get copyWith => __$HomePageStateCopyWithImpl<_HomePageState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomePageState&&(identical(other.pageIndex, pageIndex) || other.pageIndex == pageIndex)&&(identical(other.changePage, changePage) || other.changePage == changePage)&&(identical(other.showReviewWord, showReviewWord) || other.showReviewWord == showReviewWord)&&(identical(other.currentWord, currentWord) || other.currentWord == currentWord)&&(identical(other.reviewWord, reviewWord) || other.reviewWord == reviewWord)&&const DeepCollectionEquality().equals(other._words, _words)&&const DeepCollectionEquality().equals(other._newWords, _newWords)&&const DeepCollectionEquality().equals(other._notes, _notes));
}


@override
int get hashCode => Object.hash(runtimeType,pageIndex,changePage,showReviewWord,currentWord,reviewWord,const DeepCollectionEquality().hash(_words),const DeepCollectionEquality().hash(_newWords),const DeepCollectionEquality().hash(_notes));

@override
String toString() {
  return 'HomePageState(pageIndex: $pageIndex, changePage: $changePage, showReviewWord: $showReviewWord, currentWord: $currentWord, reviewWord: $reviewWord, words: $words, newWords: $newWords, notes: $notes)';
}


}

/// @nodoc
abstract mixin class _$HomePageStateCopyWith<$Res> implements $HomePageStateCopyWith<$Res> {
  factory _$HomePageStateCopyWith(_HomePageState value, $Res Function(_HomePageState) _then) = __$HomePageStateCopyWithImpl;
@override @useResult
$Res call({
 int pageIndex, bool changePage, bool showReviewWord, String currentWord, String reviewWord, List<String> words, List<String> newWords, List<NoteModel> notes
});




}
/// @nodoc
class __$HomePageStateCopyWithImpl<$Res>
    implements _$HomePageStateCopyWith<$Res> {
  __$HomePageStateCopyWithImpl(this._self, this._then);

  final _HomePageState _self;
  final $Res Function(_HomePageState) _then;

/// Create a copy of HomePageState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pageIndex = null,Object? changePage = null,Object? showReviewWord = null,Object? currentWord = null,Object? reviewWord = null,Object? words = null,Object? newWords = null,Object? notes = null,}) {
  return _then(_HomePageState(
pageIndex: null == pageIndex ? _self.pageIndex : pageIndex // ignore: cast_nullable_to_non_nullable
as int,changePage: null == changePage ? _self.changePage : changePage // ignore: cast_nullable_to_non_nullable
as bool,showReviewWord: null == showReviewWord ? _self.showReviewWord : showReviewWord // ignore: cast_nullable_to_non_nullable
as bool,currentWord: null == currentWord ? _self.currentWord : currentWord // ignore: cast_nullable_to_non_nullable
as String,reviewWord: null == reviewWord ? _self.reviewWord : reviewWord // ignore: cast_nullable_to_non_nullable
as String,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<String>,newWords: null == newWords ? _self._newWords : newWords // ignore: cast_nullable_to_non_nullable
as List<String>,notes: null == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<NoteModel>,
  ));
}


}

// dart format on
