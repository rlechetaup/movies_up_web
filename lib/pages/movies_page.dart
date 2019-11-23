
import 'package:firebase/firestore.dart';
import 'package:flutter/material.dart';

import '../alerts.dart';
import '../firebase.dart';
import '../movie.dart';

class MoviesPage extends StatefulWidget {
  MoviesPage();

  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Web"),
      ),
      body: _body(),
    );
  }

  _body() {
    return StreamBuilder(
        stream: streamMovies,
        initialData: false,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Não foi possível buscar os usuários");
          }

          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          List<DocumentSnapshot> docs = snapshot.data;

          List<Movie> movies = docs
              .map<Movie>((document) => Movie.fromJson(document.data()))
              .toList();

          return _listView(movies);
        });
  }

  _listView(List<Movie> movies) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          Movie m = movies[index];

          return Container(
            height: 400,
            width: 400,
            child: Material(
              child: InkWell(
                child: Column(
                  children: <Widget>[
                    Text(m.title),
                    Image.network(
                      m.urlFoto,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
                onTap: () {
                  _onClickMovie(m);
                },
              ),
            ),
          );
        });
  }

  void _onClickMovie(Movie m) {
    alert(context, "UP", "Filme ${m.title}");
  }
}