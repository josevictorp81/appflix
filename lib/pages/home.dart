import 'package:appflix/components/card_movie.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final urlImages = [
    'https://disneyplusbrasil.com.br/wp-content/uploads/2021/05/Vingadores-Originais-1024x576.jpg',
    'https://p2.trrsf.com/image/fget/cf/648/0/images.terra.com/2021/11/11/5584929.jpeg',
    'https://rollingstone.uol.com.br/media/uploads/poster_duna_reproducao.jpg',
    'https://cdn.pocket-lint.com/r/s/1200x/assets/images/147767-tv-feature-what-order-should-you-watch-all-the-star-wars-films-image1-1wdfjceytb.jpg',
    'https://www.justwatch.com/images/backdrop/8952016/s640/transformers-3-o-lado-oculto-da-lua'
  ];

  final nameMovies = [
    'vingadores',
    'fast and furious 9',
    'Duna',
    'star wars',
    'transformers'
  ];

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
            itemBuilder: (context, index) => GestureDetector(
              child: CardMovie(
                  urlImage: urlImages[index], name: nameMovies[index]),
              onTap: () => Navigator.of(context).pushNamed('/moviedetail',
                  arguments: Movies(urlImages[index], nameMovies[index])),
            ),
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
                CardMovie(urlImage: urlImages[index], name: nameMovies[index]),
            separatorBuilder: (context, _) => SizedBox(width: 0),
            itemCount: 5,
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
