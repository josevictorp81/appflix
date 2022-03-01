import 'package:appflix/components/custom_list_view_movie.dart';
import 'package:appflix/components/custom_list_view_serie.dart';
import 'package:appflix/components/nav_bar.dart';
import 'package:appflix/components/title_list.dart';
import 'package:appflix/repository/movie_repository.dart';
import 'package:appflix/repository/resource.dart';
import 'package:appflix/repository/serie_repository.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Resource resource = Resource('https://api.themoviedb.org/3', {});
    MovieRepository movies = MovieRepository(resource);
    SerieRepository series = SerieRepository(resource);

    return Column(
      children: [
        SizedBox(
          width: width,
          height: height * .1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              NavBar(pathName: '/movielist', text: 'Filmes'),
              NavBar(pathName: '/serieslist', text: 'Séries'),
              Text(
                'My List',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          ),
        ),
        TitleList(width: width, text: 'Filmes em exibição'),
        CustomListViewMovie(
          width: width,
          height: height,
          future: movies.getAll(1, '/movie/now_playing'),
        ),
        TitleList(width: width, text: 'Séries em exibição'),
        CustomListViewSerie(
          width: width,
          height: height,
          future: series.getAll(3, '/tv/on_the_air'),
        ),
        TitleList(width: width, text: 'Filmes Populares'),
        CustomListViewMovie(
          width: width,
          height: height,
          future: movies.getAll(1, '/movie/popular'),
        ),
        TitleList(width: width, text: 'Séries Populares'),
        CustomListViewSerie(
          width: width,
          height: height,
          future: series.getAll(4, '/tv/popular'),
        ),
        TitleList(width: width, text: 'Séries mais avaliadas'),
        CustomListViewSerie(
          width: width,
          height: height,
          future: series.getAll(1, '/tv/top_rated'),
        ),
        TitleList(width: width, text: 'Filmes mais avaliados'),
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
        TitleList(width: width, text: 'Filmes lançados recentemente'),
        CustomListViewMovie(
          width: width,
          height: height,
          future: movies.getAll(2, '/movie/popular'),
        ),
        TitleList(width: width, text: 'Popular 3'),
        CustomListViewMovie(
          width: width,
          height: height,
          future: movies.getAll(3, '/movie/popular'),
        ),
      ],
    );
  }
}
