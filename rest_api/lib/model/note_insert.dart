import 'package:json_annotation/json_annotation.dart';

part 'note_insert.g.dart';

@JsonSerializable()
class NoteData {
  final String noteID;
  final String noteTitle;
  final String noteContent;
  NoteData(
      {required this.noteTitle, required this.noteContent, this.noteID = ''});

  // Map<String, dynamic> toJson() {
  //   return {'noteTitle': noteTitle, 'noteContent': noteContent};
  // }

  Map<String, dynamic> toJson() => _$NoteDataToJson(this);
}
