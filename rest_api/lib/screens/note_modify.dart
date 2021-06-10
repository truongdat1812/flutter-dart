import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/components/round_button.dart';
import 'package:rest_api/model/api_response.dart';
import 'package:rest_api/model/note.dart';
import 'package:rest_api/model/note_insert.dart';
import 'package:rest_api/services/note_service.dart';

class NoteModify extends StatefulWidget {
  final String noteID;
  NoteModify({required this.noteID});
  @override
  _NoteState createState() => _NoteState();
}

class _NoteState extends State<NoteModify> {
  NoteService get service => GetIt.I<NoteService>();

  APIResponse<Note>? _response;
  bool isloading = false;
  TextEditingController _titleControler = TextEditingController();
  TextEditingController _contentControler = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    if (widget.noteID != '') {
      _getNote();
    }
    super.initState();
  }

  _getNote() async {
    setState(() {
      isloading = true;
    });

    _response = await service.getNote(widget.noteID);

    _titleControler.text = _response!.data.noteTitle;
    _contentControler.text = _response!.data.noteContent;

    setState(() {
      isloading = false;
    });
  }

  void _createNewNote() async {
    NoteData item = NoteData(
        noteTitle: _titleControler.text, noteContent: _contentControler.text);
    APIResponse<bool> result = await service.createNote(item);

    if (result.data == true) {
      print('post success');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(""),
                content: Text("Your note was created!"),
                actions: <Widget>[
                  RoundRectButton(
                      text: 'OK',
                      press: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor: Colors.green,
                      textColor: Colors.white)
                ],
              )).then((_) => {Navigator.pop(context)});
    } else {
      print('post failed ' + result.errorMessage);
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text(""),
                content: Text("Failed to post"),
                actions: <Widget>[
                  RoundRectButton(
                      text: 'OK',
                      press: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor: Colors.green,
                      textColor: Colors.white)
                ],
              ));
    }
  }

  void _updateNote() async {
    NoteData item = NoteData(
        noteTitle: _titleControler.text,
        noteContent: _contentControler.text,
        noteID: widget.noteID);
    APIResponse<bool> result = await service.updateNote(item);

    if (result.data == true) {
      print('post success');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Alert"),
                content: Text("Your note was updated!"),
                actions: <Widget>[
                  RoundRectButton(
                      text: 'OK',
                      press: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor: Colors.green,
                      textColor: Colors.white)
                ],
              )).then((_) => {Navigator.pop(context)});
    } else {
      print('post failed ' + result.errorMessage);
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Alert"),
                content: Text("Failed to update note!"),
                actions: <Widget>[
                  RoundRectButton(
                      text: 'OK',
                      press: () {
                        Navigator.of(context).pop();
                      },
                      backgroundColor: Colors.green,
                      textColor: Colors.white)
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          widget.noteID == '' ? 'Create note' : 'Edit note',
        )),
        body: isloading
            ? Container(
                color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleControler,
                      decoration: InputDecoration(hintText: 'Note title'),
                    ),
                    TextField(
                      controller: _contentControler,
                      decoration: InputDecoration(hintText: 'Note content'),
                    ),
                    RoundRectButton(
                        text: 'Submit',
                        press: () {
                          if (widget.noteID == '') {
                            //Create new
                            _createNewNote();
                          } else {
                            _updateNote();
                            //editing
                          }
                        },
                        backgroundColor: Theme.of(context).primaryColor,
                        textColor: Colors.white)
                  ],
                ),
              ));
  }
}
