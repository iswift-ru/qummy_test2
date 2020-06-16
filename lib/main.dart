import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qummytest2/bloc/film_bloc/film_bloc.dart';
import 'package:qummytest2/data/repositories/films_repository.dart';
import 'package:qummytest2/ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => FilmBloc(repository: FilmsRepositoryImpl()),
        child: HomePage(),
      ),
    );
  }
}
