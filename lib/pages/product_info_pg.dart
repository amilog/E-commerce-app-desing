import 'package:flutter/material.dart';

import '../theme/light_theme.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final lightColor = LightColor();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, color: lightColor.finshBoy),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 19,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: ClipOval(child: Image.asset('assets/profil_picture_cyan_aa.png')),
          )
        ],
      ),
    );
  }
}
