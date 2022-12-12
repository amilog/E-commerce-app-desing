import 'package:ecommerce_app_demo_one/pages/product_cards.dart';
import 'package:ecommerce_app_demo_one/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final lightColor = LightColor();
  var selectedPage = 0;
  final List<Widget> _pages = [
    Column(
      children: [
        _SearchBar(),
        HeadTitle(),
        const _CategoriesBar(),
        const ProductCards(),
      ],
    ),
    Container(),
    Container(),
    const Settings(),
    Container(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: GNav(
          selectedIndex: selectedPage,
          activeColor: lightColor.finshBoy,
          color: Colors.black38,
          onTabChange: (index) {
            _navigateBottomBar(index);
          },
          tabs: [
            GButton(
              icon: Icons.home,
            ),
            GButton(
              icon: Icons.messenger_outline,
            ),
            GButton(
              icon: Icons.favorite_border,
            ),
            GButton(
              icon: Icons.shopping_bag_outlined,
            ),
            GButton(
              icon: Icons.person_outline_rounded,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: appBarLeadingIcon(),
        actions: [
          hmAppBarActions(),
        ],
      ),
      body: _pages[selectedPage],
    );
  }

  //-------------------------------------

  Padding hmAppBarActions() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: ClipOval(child: Image.asset('assets/profil_picture_cyan_aa.png')),
    );
  }

  Widget appBarLeadingIcon() { // Burda Icon yerine Widget isletmey daha yaxsidi.
    return SizedBox(
      child: const Icon(
        Icons.dehaze_rounded,
        color: Colors.black,
      ),
    );
  }
}

class _CategoriesBar extends StatelessWidget {
  const _CategoriesBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0, top: 8),
      child: Expanded(
        child: SizedBox(
          width: 400,
          child: Row(
            children: [
              CategoriesButton(
                buttonName: 'Nike',
              ),
              CategoriesButton(
                buttonName: 'Adidas',
              ),
              CategoriesButton(
                buttonName: 'Puma',
              ),
              CategoriesButton(
                buttonName: 'Balenciaga',
              ),
              CategoriesButton(
                buttonName: 'Converse',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesButton extends StatelessWidget {
  CategoriesButton({
    Key? key,
    required String buttonName,
  })  : _buttonName = buttonName,
        super(key: key);

  final String _buttonName;
  final lightColor = LightColor();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text(
          _buttonName,
          style: TextStyle(color: lightColor.mediEvalBlue, fontSize: 17, fontWeight: FontWeight.w500),
        ),
        onPressed: () {});
  }
}

class HeadTitle extends StatelessWidget {
  HeadTitle({
    Key? key,
  }) : super(key: key);

  final lightColor = LightColor();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 23),
      child: Row(
        children: [
          Text(
            'Categories',
            style: TextStyle(color: lightColor.mediEvalBlue, fontSize: 43, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  _SearchBar({
    Key? key,
  }) : super(key: key);

  final lightColor = LightColor();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 30),
      child: SizedBox(
        height: 56,
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
            ),
            suffixIcon: Container(
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightColor.finshBoy,
                ),
                child: const Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 31,
                )),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Find shose',
            hintStyle: TextStyle(color: Colors.grey[400], fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

