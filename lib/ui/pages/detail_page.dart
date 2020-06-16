import 'package:flutter/material.dart';
import 'package:qummytest2/data/models/api_result_model.dart';

class DetailPage extends StatelessWidget {
  Results results;
  DetailPage({this.results});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(results.title),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(results.overview),
              ),
              Divider(
                color: Colors.blue,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Image.network(
                    'https://image.tmdb.org/t/p/w220_and_h330_face/${results.posterPath}',
                  ),
                  Image.network(
                    'https://image.tmdb.org/t/p/w220_and_h330_face/${results.backdropPath}',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.blue,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 30,
                  ),
                  Text(
                    'Rating ${results.popularity.toString()}',
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
              Text(
                'Release date ${results.releaseDate.toString()}',
                style: TextStyle(fontSize: 30, color: Colors.blue),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
