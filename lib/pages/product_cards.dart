import 'package:flutter/material.dart';

import '../class/shoes_class.dart';
import '../theme/light_theme.dart';

class ProductCards extends StatefulWidget {
  const ProductCards({super.key});

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  Future<List<Shoes>> Generating() async {
    var shoesList = <Shoes>[];

    var s1 = Shoes(1, 'Jordan 4 Retro', 340, 'black_retro_jordan.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.');
    var s2 = Shoes(2, ' Air Jordan 1', 220, 'blue_jordan.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.');
    var s3 = Shoes(3, 'Air Jordan 5', 290, 'jordan_shoes.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.');
    var s4 = Shoes(4, 'Air Jordan 6', 160, 'air_jordan_6.png',
        'Air Jordan is an American brand of basketball shoes produced by American corporation Nike. The first Air Jordan shoe was produced for Hall of Fame former basketball player Michael Jordan during his time with the Chicago Bulls in late 1984 and released to the public on April 1, 1985.');

    shoesList.add(s1);
    shoesList.add(s2);
    shoesList.add(s3);
    shoesList.add(s4);

    return shoesList;
  }

  final lightColor = LightColor();
  bool _isSecure = true;
  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<List<Shoes>>(
          future: Generating(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var shoesList = snapshot.data;
              return GridView.builder(
                itemCount: shoesList!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9 / 10,
                ),
                itemBuilder: (context, indeks) {
                  var shoes = shoesList[indeks];
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:18.0),
                                child: Text(
                                  '\$',
                                  style: TextStyle(color: lightColor.finshBoy, fontWeight: FontWeight.bold, fontSize: 20),
                                ),
                              ),
                              Text(
                                '${shoes.price}',
                                style: TextStyle(
                                    color: lightColor.mediEvalBlue, fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:60.0),
                                child: IconButton(
                                  onPressed: _changeLoading,
                                  icon: AnimatedCrossFade(
                                    firstChild: Icon(Icons.heart_broken_sharp,color: Colors.grey[400],size: 26,),
                                    secondChild: Icon(Icons.heart_broken_sharp,color: Colors.red,size: 26),
                                    crossFadeState: _isSecure ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                    duration: Duration(seconds: 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: SizedBox(
                                width: 115,
                                child: Image.asset(
                                  'assets/${shoes.photo_name}',
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              '${shoes.name}',
                              style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
