import 'package:appflix/components/card_movie.dart';
import 'package:appflix/components/stack.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;

  final urlImages = [
    'https://disneyplusbrasil.com.br/wp-content/uploads/2021/05/Vingadores-Originais-1024x576.jpg',
    'https://p2.trrsf.com/image/fget/cf/648/0/images.terra.com/2021/11/11/5584929.jpeg',
    'https://rollingstone.uol.com.br/media/uploads/poster_duna_reproducao.jpg',
    'https://cdn.pocket-lint.com/r/s/1200x/assets/images/147767-tv-feature-what-order-should-you-watch-all-the-star-wars-films-image1-1wdfjceytb.jpg',
    'https://www.justwatch.com/images/backdrop/8952016/s640/transformers-3-o-lado-oculto-da-lua',
    'https://assets.vogue.in/photos/5d7224d50ce95e0008696c55/master/pass/Joker.jpg',
    'https://www.10wallpaper.com/wallpaper/1366x768/1804/2018_Avengers_Infinity_War_4K_Film_1366x768.jpg',
  ];

  final nameMovies = [
    'vingadores',
    'fast and furious 9',
    'Duna',
    'star wars',
    'transformers',
    'Joker',
    'Guerra Infinita',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        Container(
          child: Column(
            children: [
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: height * .3,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  // onPageChanged: (index, reason) {
                  //   setState(() {
                  //     activeIndex = index;
                  //   });
                  // },
                ),
                itemCount: urlImages.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = urlImages[index];
                  final name = nameMovies[index];
                  return GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(
                      '/moviedetail',
                      arguments: Movies(urlImage, name),
                    ),
                    child: CustomStack(
                      urlImage: urlImage,
                      name: name,
                      width: width,
                      height: height,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width * .1, top: 50, bottom: 10),
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
            itemBuilder: (context, index) => GestureDetector(
              child: CardMovie(
                  urlImage: urlImages[index], name: nameMovies[index]),
              onTap: () => Navigator.of(context).pushNamed(
                '/moviedetail',
                arguments: Movies(urlImages[index], nameMovies[index]),
              ),
            ),
            separatorBuilder: (context, _) => SizedBox(width: 0),
            itemCount: 6,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: width * .1, bottom: 10),
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
                CardMovie(urlImage: urlImages[index], name: nameMovies[index]),
            separatorBuilder: (context, _) => SizedBox(width: 0),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}

class Movies {
  final String image;
  final String name;

  Movies(this.image, this.name);
}
