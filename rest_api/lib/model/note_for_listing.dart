import 'package:json_annotation/json_annotation.dart';

part 'note_for_listing.g.dart';

@JsonSerializable()
class NoteForListing {
  String noteID;
  String noteTitle;
  final DateTime? createDateTime;
  final DateTime? latestEditDateTime;

  NoteForListing({
    required this.noteID,
    required this.noteTitle,
    this.createDateTime,
    this.latestEditDateTime,
  });

  //manual
  // factory NoteForListing.fromJson(Map<String, dynamic> item) {
  //   return NoteForListing(
  //       noteID: item['noteID'],
  //       noteTitle: item['noteTitle'],
  //       createDateTime: DateTime.parse(item['createDateTime']),
  //       latestEditDateTime: DateTime.parse(item['createDateTime']));
  // }

  factory NoteForListing.fromJson(Map<String, dynamic> item) =>
      _$NoteForListingFromJson(item);
}
