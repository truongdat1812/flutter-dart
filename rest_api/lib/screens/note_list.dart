import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/components/round_button.dart';
import 'package:rest_api/model/api_response.dart';
import 'package:rest_api/model/note_for_listing.dart';
import 'package:rest_api/model/note_insert.dart';
import 'package:rest_api/screens/note_delete.dart';
import 'package:rest_api/screens/note_modify.dart';
import 'package:rest_api/services/note_service.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NoteService get service => GetIt.I<NoteService>();

  APIResponse<List<NoteForListing>>? _response;

  bool isloading = false;
  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchNote();
    super.initState();
  }

  _fetchNote() async {
    setState(() {
      isloading = true;
    });
    _response = await service.fetchNote();
    setState(() {
      isloading = false;
    });
  }

  void _deleteNote(String noteID) async {
    APIResponse<bool> result = await service.deleteNote(noteID);

    if (result.data == true) {
      print('post success');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Your note was deleted!'),
        duration: const Duration(seconds: 1),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            _fetchNote();
          },
        ),
      ));
    } else {
      print('post failed ' + result.errorMessage);
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: Text("Alert"),
                content: Text("Failed to delete note!"),
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
        title: Text('List of note'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NoteModify(
                        noteID: '',
                      ))).then((_) => {_fetchNote()});
        },
        child: Icon(Icons.add),
      ),
      body: isloading
          ? Container(
              color: Theme.of(context).secondaryHeaderColor.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.separated(
              itemBuilder: (_, index) {
                return Dismissible(
                  key: ValueKey(_response!.data[index].noteID),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => NoteDelete());
                    print(result);
                    if (result) {
                      _deleteNote(_response!.data[index].noteID);
                    }
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      _response!.data[index].noteTitle,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                        'Last edited on ${formatDateTime(_response!.data[index].latestEditDateTime ?? DateTime.now())}'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteModify(
                                    noteID: '${_response!.data[index].noteID}',
                                  ))).then((_) => {_fetchNote()});
                    },
                  ),
                );
              },
              separatorBuilder: (_, __) => Divider(
                    height: 1,
                    color: Theme.of(context).primaryColor,
                  ),
              itemCount: _response!.data.length),
    );
  }
}
