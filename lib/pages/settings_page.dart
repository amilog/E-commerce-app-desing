import 'package:flutter/material.dart';
import 'package:ecommerce_app_demo_one/theme/light_theme.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text("Setting name"),
            subtitle: Text("Setting subtitle"),
            leading: Icon(Icons.settings),
            trailing: Switch(
              onChanged: (value) {},
              value: false,
            ),
          );
        },
      ),
    );
  }
}

