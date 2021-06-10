import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rest_api/screens/note_list.dart';
import 'package:rest_api/services/note_service.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

void setupLocator() {
  GetIt.instance.registerLazySingleton(() => NoteService());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteList(),
    );
  }
}
