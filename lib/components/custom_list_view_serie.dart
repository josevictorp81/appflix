import 'package:appflix/components/card_movie.dart';
import 'package:appflix/models/series.dart';
import 'package:flutter/material.dart';

class CustomListViewSerie extends StatelessWidget {
  const CustomListViewSerie(
      {Key? key,
      required this.width,
      required this.height,
      required this.future})
      : super(key: key);

  final double width;
  final double height;
  final Future<List<Serie>> future;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * .06),
      height: height * .3,
      child: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<List<Serie>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...snapshot.data!.map(
                    (map) => GestureDetector(
                      child:
                          CardMovie(urlImage: map.posterPath, name: map.title),
                      onTap: () => Navigator.of(context).pushNamed(
                        '/moviedetail',
                        arguments: Serie(map.posterPath, map.overview,
                            map.title, map.genreIds, map.voteAverage),
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
