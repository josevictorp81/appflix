import 'package:appflix/components/card_movie.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final urlImages = [
    'https://cdn.autopapo.com.br/box/uploads/2017/05/04172943/01-koenigsegg-agera-xs-monterey-1-732x488.jpg',
    'https://revistacarro.com.br/wp-content/uploads/2019/08/Buggatti-Cientodieci_2-1080x675.jpg',
    'https://img.elo7.com.br/product/original/398FD4F/adesivo-de-parede-carros-esportivos-citroen.jpg',
    'http://wishcars.xyz/wp-content/uploads/2021/04/Os-10-melhores-carros-esportivos-de-todos-os-tempos-1-1024x683.jpg',
    'https://cdn.motor1.com/images/mgl/LLrxM/s1/veja-quais-foram-os-carros-esportivos-mais-vendidos-em-dezembro-de-2012-no-brasil.jpg'
  ];

  final nameCars = ['Agera', 'Cientodiece', 'Aventador', 'Corvett', 'Camaro'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: width * .8,
          height: height * .3,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://www.10wallpaper.com/wallpaper/1366x768/1804/2018_Avengers_Infinity_War_4K_Film_1366x768.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue.withOpacity(0.3)),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: width * .8,
                height: height * .3,
                margin: EdgeInsets.only(top: width * .4, left: width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Vingadores: Guerra Infinita',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Marvel Studios',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width * .1, top: 20),
          child: Row(
            children: [
              Text(
                'Popular',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width * .06),
          height: height * .3,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                CardMovie(urlImage: urlImages[index], name: nameCars[index]),
            separatorBuilder: (context, _) => SizedBox(width: 0),
            itemCount: 5,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width * .06),
          height: height * .3,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                CardMovie(urlImage: urlImages[index], name: nameCars[index]),
            separatorBuilder: (context, _) => SizedBox(width: 0),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
