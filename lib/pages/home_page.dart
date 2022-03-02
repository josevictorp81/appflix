import 'package:appflix/components/custom_list_view_movie.dart';
import 'package:appflix/components/custom_list_view_serie.dart';
import 'package:appflix/components/nav_bar.dart';
import 'package:appflix/components/title_list.dart';
import 'package:appflix/repository/movie_repository.dart';
import 'package:appflix/repository/resource.dart';
import 'package:appflix/repository/serie_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

    Resource resource = Resource(dotenv.env['BASE_URL'] as String, {});
    MovieRepository movies = MovieRepository(resource);
    SerieRepository series = SerieRepository(resource);

    return Column(
      children: [
        SizedBox(
          width: width,
          height: height * .1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).pushNamed('/searchr'),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              const NavBar(pathName: '/movielist', text: 'Filmes'),
              const NavBar(pathName: '/serieslist', text: 'Séries'),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'My List',
                  style: TextStyle(fontSize: 18, color: Colors.white),
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
        CustomListViewSerie(
          width: width,
          height: height,
          future: series.getAll(3, '/tv/on_the_air'),
        ),
        TitleList(width: width, text: 'Populares'),
        CustomListViewMovie(
          width: width,
          height: height,
          future: movies.getAll(1, '/movie/popular'),
        ),
        CustomListViewSerie(
          width: width,
          height: height,
          future: series.getAll(4, '/tv/popular'),
        ),
        TitleList(width: width, text: 'Mais avaliados'),
        CustomListViewSerie(
          width: width,
          height: height,
          future: series.getAll(1, '/tv/top_rated'),
        ),
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
      ],
    );
  }
}
