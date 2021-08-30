import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_drink_game/controller/drink_controller.dart';
import 'package:get/get.dart';

import 'palette_box.dart';

void main() => runApp(GetMaterialApp(home: DrinkPage()));

class DrinkPage extends StatelessWidget {
  DrinkPage({Key? key}) : super(key: key);
  final double paletteBoxHeight = Get.width/5;

  @override
  Widget build(BuildContext context) {
    final DrinkController c = Get.put(DrinkController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Что же выпить"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                flex: 2,
                child: TextButton(
                  child: Image.asset('images/${c.drinkImage}'),
                  onPressed: () => c.updateImage(),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    PaletteBox(color: c.paletteColors[0].color, height: paletteBoxHeight),
                    PaletteBox(color: c.paletteColors[1].color, height: paletteBoxHeight),
                    PaletteBox(color: c.paletteColors[2].color, height: paletteBoxHeight),
                    PaletteBox(color: c.paletteColors[3].color, height: paletteBoxHeight),
                    PaletteBox(color: c.paletteColors[4].color, height: paletteBoxHeight),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


