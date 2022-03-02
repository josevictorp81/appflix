import 'package:appflix/components/custom_list_view_movie.dart';
import 'package:appflix/components/title_list.dart';
import 'package:appflix/repository/movie_repository.dart';
import 'package:appflix/repository/resource.dart';
import 'package:flutter/material.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({Key? key}) : super(key: key);

  @override
  _MoviesListState createState() => _MoviesListState();
}

class _MoviesListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Resource resource = Resource('https://api.themoviedb.org/3', {});
    MovieRepository movies = MovieRepository(resource);

    return Scaffold(
      backgroundColor: const Color(0xff111820),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                Container(
                  width: width,
                  height: height * .1,
                  margin: EdgeInsets.only(left: height * .04),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * .25),
                        child: const Text(
                          'Movies',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                TitleList(width: width, text: 'Em exibição'),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(1, '/movie/now_playing'),
                ),
                TitleList(width: width, text: 'Populares'),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(1, '/movie/popular'),
                ),
                TitleList(width: width, text: 'Mais avaliados'),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(1, '/movie/top_rated'),
                ),
                TitleList(width: width, text: 'Em breve'),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(1, '/movie/upcoming'),
                ),
                TitleList(width: width, text: 'Recentes'),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(2, '/movie/popular'),
                ),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(3, '/movie/popular'),
                ),
                TitleList(width: width, text: 'Populares'),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(4, '/movie/popular'),
                ),
                CustomListViewMovie(
                  width: width,
                  height: height,
                  future: movies.getAll(5, '/movie/popular'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
