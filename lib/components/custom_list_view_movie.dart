import 'package:appflix/components/card_movie.dart';
import 'package:appflix/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CustomListViewMovie extends StatelessWidget {
  const CustomListViewMovie(
      {Key? key,
      required this.width,
      required this.height,
      required this.future})
      : super(key: key);

  final double width;
  final double height;
  final Future<List<Movie>> future;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: width * .06),
      height: height * .3,
      child: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              EasyLoading.dismiss();
              return ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ...snapshot.data!.map(
                    (map) => GestureDetector(
                      child:
                          CardMovie(urlImage: map.posterPath, name: map.title),
                      onTap: () => Navigator.of(context).pushNamed(
                        '/moviedetail',
                        arguments: Movie(map.posterPath, map.overview,
                            map.title, map.genreIds, map.voteAverage),
                      ),
                    ),
                  ),
                ],
              );
            }
          }
          EasyLoading.show();
          return const SizedBox();
        },
      ),
    );
  }
}
