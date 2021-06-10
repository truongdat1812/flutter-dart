// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_insert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoteData _$NoteDataFromJson(Map<String, dynamic> json) {
  return NoteData(
    noteTitle: json['noteTitle'] as String,
    noteContent: json['noteContent'] as String,
    noteID: json['noteID'] as String,
  );
}

Map<String, dynamic> _$NoteDataToJson(NoteData instance) => <String, dynamic>{
      'noteID': instance.noteID,
      'noteTitle': instance.noteTitle,
      'noteContent': instance.noteContent,
    };
