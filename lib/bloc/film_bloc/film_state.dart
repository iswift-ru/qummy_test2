import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:qummytest2/data/models/api_result_model.dart';
import 'package:meta/meta.dart';

abstract class FilmState extends Equatable {}

class FilmInitialState extends FilmState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FilmLoadingState extends FilmState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

// ignore: must_be_immutable
class FilmLoadedState extends FilmState {
  List<Results> results;
  FilmLoadedState({@required this.results});

  @override
  // TODO: implement props
  List<Object> get props => null;
}

// ignore: must_be_immutable
class FilmErrorState extends FilmState {
  String message;
  FilmErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => null;
}
