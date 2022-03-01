import 'package:appflix/models/movie.dart';
import 'package:appflix/repository/movie_repository.dart';
import 'package:appflix/repository/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final _value = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {},
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                      labelText: 'Filme',
                      labelStyle: TextStyle(
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
