import 'package:appflix/components/card_movie.dart';
import 'package:appflix/components/custom_list_view.dart';
import 'package:appflix/components/stack.dart';
import 'package:appflix/components/title_list.dart';
import 'package:appflix/models/movie.dart';
import 'package:appflix/repository/movie_repository.dart';
import 'package:appflix/repository/resource.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

    return Column(
      children: [
        Container(
          width: width,
          height: height * .1,
          child: Center(
            child: Text(
              'Movies',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
        TitleList(width: width, text: 'Now playing'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(1, '/movie/now_playing'),
        ),
        TitleList(width: width, text: 'Popular'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(1, '/movie/popular'),
        ),
        TitleList(width: width, text: 'Top Rated'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(1, '/movie/top_rated'),
        ),
        TitleList(width: width, text: 'Em breve'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(1, '/movie/upcoming'),
        ),
        TitleList(width: width, text: 'Popular 2'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(2, '/movie/popular'),
        ),
        TitleList(width: width, text: 'Popular 3'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(3, '/movie/popular'),
        ),
        TitleList(width: width, text: 'Popular 4'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(4, '/movie/popular'),
        ),
        TitleList(width: width, text: 'Popular 5'),
        CustomListView(
          width: width,
          height: height,
          future: movies.getAll(5, '/movie/popular'),
        ),
      ],
    );
  }
}

// Column(
//             children: [
//               CarouselSlider.builder(
//                 options: CarouselOptions(
//                   height: height * .3,
//                   autoPlay: true,
//                   autoPlayInterval: Duration(seconds: 5),
//                   autoPlayAnimationDuration: Duration(seconds: 2),
//                   enlargeCenterPage: true,
//                 ),
//                 itemCount: urlImages.length,
//                 itemBuilder: (context, index, realIndex) {
//                   final urlImage = urlImages[index];
//                   final name = nameMovies[index];
//                   return GestureDetector(
//                     onTap: () => Navigator.of(context).pushNamed(
//                       '/moviedetail',
//                       arguments: movies,
//                     ),
//                     child: CustomStack(
//                       urlImage: urlImage,
//                       name: name,
//                       width: width,
//                       height: height,
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
// ...snapshot.data!.map(
//                         (map) => GestureDetector(
//                           child: CardMovie(
//                               urlImage: map.posterPath, name: map.title),
//                           onTap: () => Navigator.of(context).pushNamed(
//                             '/moviedetail',
//                             arguments: Movie(map.posterPath, map.overview,
//                                 map.title, map.genreIds, map.voteAverage),
//                           ),
//                         ),
//                       ),