import 'package:appflix/pages/detail.dart';
import 'package:appflix/pages/home.dart';
import 'package:appflix/pages/movies_list.dart';
import 'package:appflix/pages/search.dart';
import 'package:appflix/pages/series_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      builder: EasyLoading.init(),
      routes: {
        '/': (context) => const HomePage(),
        '/moviedetail': (context) => const MovieDetail(),
        '/movielist': (context) => const MoviesList(),
        '/serieslist': (context) => const SeriesList(),
        '/searchr': (context) => const Search(),
      },
    );
  }
}
