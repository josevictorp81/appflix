import 'package:appflix/models/movie.dart';
import 'package:appflix/repository/movie_repository.dart';
import 'package:appflix/repository/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final _value = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    Resource resource = Resource('https://api.themoviedb.org/3', {});
    MovieRepository m = MovieRepository(resource);

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        width: width,
        height: height,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _value,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      labelText: 'Filme',
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
