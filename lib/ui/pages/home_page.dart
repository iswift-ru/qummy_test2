import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qummytest2/bloc/film_bloc/film_bloc.dart';
import 'package:qummytest2/bloc/film_bloc/film_event.dart';
import 'package:qummytest2/bloc/film_bloc/film_state.dart';
import 'package:qummytest2/data/models/api_result_model.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FilmBloc filmBloc;

  @override
  // ignore: must_call_super
  void initState() {
    super.initState();
    filmBloc = BlocProvider.of<FilmBloc>(context);
    filmBloc.add(FetchFilmsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(title: Text('Qummy test')),
              body: Container(
                child: BlocBuilder<FilmBloc, FilmState>(
                  // ignore: missing_return
                  builder: (context, state) {
                    if (state is FilmInitialState) {
                      return buildLoading();
                    } else if (state is FilmLoadingState) {
                      return buildLoading();
                    } else if (state is FilmLoadedState) {
                      return buildFilmList(state.results);
                    } else if (state is FilmErrorState) {
                      return buildErrorUi(state.message);
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildFilmList(List<Results> results) {
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (ctx, pos) {
          return ListTile(
            title: Text(results[pos].title),
            trailing: Icon(
              Icons.play_circle_outline,
              size: 36,
            ),
            subtitle: Text(results[pos].overview),
            isThreeLine: true,
            leading: Image.network(
                'https://image.tmdb.org/t/p/w220_and_h330_face/${results[pos].posterPath}'),
            onTap: () {
              navigateToDetailPage(context, results[pos]);
            },
          );
        });
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Text(
        message,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  void navigateToDetailPage(BuildContext context, Results results) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailPage(results: results);
    }));
  }
}
