import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:qummytest2/bloc/film_bloc/film_event.dart';
import 'package:qummytest2/bloc/film_bloc/film_state.dart';
import 'package:qummytest2/data/models/api_result_model.dart';
import 'package:qummytest2/data/repositories/films_repository.dart';
import 'package:meta/meta.dart';

class FilmBloc extends Bloc<FilmEvent, FilmState> {
  FilmRepository repository;
  FilmBloc({@required this.repository});
  @override
  // TODO: implement initialState
  FilmState get initialState => FilmInitialState();

  @override
  Stream<FilmState> mapEventToState(FilmEvent event) async* {
    if (event is FetchFilmsEvent) {
      yield FilmLoadingState();
      try {
        List<Results> results = await repository.getResults();
        yield FilmLoadedState(results: results);
      } catch (e) {
        yield FilmErrorState(message: e.toString());
      }
    }
  }
}
