// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NoteModel _$NoteModelFromJson(Map<String, dynamic> json) => _NoteModel(
  title: json['title'] as String? ?? '',
  note: json['note'] as String? ?? '',
);

Map<String, dynamic> _$NoteModelToJson(_NoteModel instance) =>
    <String, dynamic>{'title': instance.title, 'note': instance.note};
