import 'package:appflix/components/custom_list_view_serie.dart';
import 'package:appflix/components/title_list.dart';
import 'package:appflix/repository/resource.dart';
import 'package:appflix/repository/serie_repository.dart';
import 'package:flutter/material.dart';

class SeriesList extends StatefulWidget {
  const SeriesList({Key? key}) : super(key: key);

  @override
  _SeriesListState createState() => _SeriesListState();
}

class _SeriesListState extends State<SeriesList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Resource resource = Resource('https://api.themoviedb.org/3', {});
    SerieRepository series = SerieRepository(resource);

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
                          'Séries',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                TitleList(width: width, text: 'Em exibição'),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(1, '/tv/on_the_air'),
                ),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(3, '/tv/on_the_air'),
                ),
                TitleList(width: width, text: 'Populares'),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(1, '/tv/popular'),
                ),
                TitleList(width: width, text: 'Mais avaliadas'),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(1, '/tv/top_rated'),
                ),
                TitleList(width: width, text: 'Em exibição'),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(1, '/tv/airing_today'),
                ),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(2, '/tv/popular'),
                ),
                TitleList(width: width, text: 'Recentes'),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(4, '/tv/popular'),
                ),
                CustomListViewSerie(
                  width: width,
                  height: height,
                  future: series.getAll(5, '/tv/popular'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
