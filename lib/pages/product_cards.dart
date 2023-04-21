import 'package:ecommerce_app_demo_one/pages/product_info_pg.dart';
import 'package:flutter/material.dart';

import '../class/shoes_class.dart';
import '../theme/light_theme.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({super.key});

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  var shoesList = <Shoes>[
    Shoes(
        1,
        'Jordan 4 Retro',
        340,
        'black_retro_jordan.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.',
        false),
    Shoes(
        2,
        ' Air Jordan 1',
        220,
        'jordan_shoes.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.',
        false),
    Shoes(
        3,
        'Air Jordan 5',
        290,
        'jordan_shoes.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.',
        false),
    Shoes(
        4,
        'Air Jordan',
        120,
        'black_retro_jordan.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.',
        false),
  ];

  Future<List<Shoes>> listPull() async {
    return shoesList;
  }

  void likeButtonFunc(int id) {
    final tile = shoesList.firstWhere((item) => item.id == id);
    setState(() => tile.liked = tile.liked ? false : true);
  }

  final lightColor = LightColor();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<Shoes>>(
          future: listPull(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var shoesList = snapshot.data;
              return GridView.builder(
                itemCount: shoesList!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 29 / 30,
                ),
                itemBuilder: (context, indeks) {
                  var shoes = shoesList[indeks];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const ProductPage())));
                    },
                    child: Card(
                      child: Column(
                        children: [
                          _priceAndLikeIcon(shoes),
                          _productImage(shoes),
                          _productName(shoes),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center();
            }
          },
        ),
      ),
    );
  }

  Row _priceAndLikeIcon(Shoes shoes) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              '\$',
              style: TextStyle(
                  color: lightColor.finshBoy,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(
              '${shoes.price}',
              style: TextStyle(
                  color: lightColor.mediEvalBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              likeButtonFunc(shoes.id);
            },
            icon: AnimatedCrossFade(
              firstChild: Icon(
                Icons.heart_broken,
                color: Colors.grey[400],
                size: 26,
              ),
              secondChild: const Icon(Icons.heart_broken_rounded,
                  color: Colors.red, size: 26),
              crossFadeState: shoes.liked
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(seconds: 1),
            ),
          ),
      ],
    );
  }

  Padding _productName(Shoes shoes) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(
        shoes.name,
        style: const TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Padding _productImage(Shoes shoes) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:22.0,vertical: 5),
      child: SizedBox(
          width: 200,
          child: Image.asset(
            'assets/${shoes.photoName}',
          )),
    );
  }
}
