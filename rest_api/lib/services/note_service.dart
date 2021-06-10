import 'dart:convert';

import 'package:rest_api/model/note.dart';
import 'package:rest_api/model/note_for_listing.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/model/note_insert.dart';
import '../model/api_response.dart';

class NoteService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const APIKey = '42c2de97-74d4-47f0-b0f4-ac3197d970cd';
  static const headers = {'apiKey': APIKey, 'Content-Type': 'application/json'};

  Future<APIResponse<List<NoteForListing>>> fetchNote() async {
    var response = await http.get(Uri.parse(API + '/notes'), headers: headers);
    if (response.statusCode == 200) {
      print('object');
      var jsonData = jsonDecode(response.body);
      final List<NoteForListing> notes = [];
      for (var item in jsonData) {
        notes.add(NoteForListing.fromJson(item));
      }
      print("get note ${notes.length}");

      return APIResponse<List<NoteForListing>>(notes, false, '');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to load album');
    }
  }

  Future<APIResponse<Note>> getNote(String noteID) async {
    var response =
        await http.get(Uri.parse(API + '/notes/' + noteID), headers: headers);
    if (response.statusCode == 200) {
      print('object');
      var jsonData = jsonDecode(response.body);
      return APIResponse<Note>(Note.fromJson(jsonData), false, '');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      throw Exception('Failed to load album');
    }
  }

  Future<APIResponse<bool>> createNote(NoteData item) async {
    var response = await http.post(Uri.parse(API + '/notes'),
        headers: headers, body: jsonEncode(item.toJson()));
    if (response.statusCode == 201) {
      return APIResponse<bool>(true, false, '');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      return APIResponse<bool>(false, false, response.statusCode.toString());
    }
  }

  Future<APIResponse<bool>> updateNote(NoteData item) async {
    var response = await http.put(Uri.parse(API + '/notes/' + item.noteID),
        headers: headers, body: jsonEncode(item.toJson()));
    if (response.statusCode == 204) {
      return APIResponse<bool>(true, false, '');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      return APIResponse<bool>(false, false, response.statusCode.toString());
    }
  }

  Future<APIResponse<bool>> deleteNote(String noteID) async {
    var response = await http.delete(Uri.parse(API + '/notes/' + noteID),
        headers: headers);
    if (response.statusCode == 204) {
      return APIResponse<bool>(true, false, '');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      print(response.statusCode);
      return APIResponse<bool>(false, false, response.statusCode.toString());
    }
  }
}
