import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';

class DrinkController extends GetxController {
  final Map<String, String> drinks = {
    "как всегда пиво": "glass.png",
    "стаканчик Колы": "soda.png",
    "бокал шампанского": "champagne.png",
    "лимонад, ведь мы за ЗОЖ": "lemonade.png",
    "рюмку вермута": "vermut.png",
    "шот водки": "vodka.png",
    "бокал вина": "wine.png",
  };

  var drink = "".obs;
  var drinkImage = "bar.png".obs;

  RxList<PaletteColor> paletteColors = [
    PaletteColor(Color(0x00000000), 0),
    PaletteColor(Color(0x00000000), 0),
    PaletteColor(Color(0x00000000), 0),
    PaletteColor(Color(0x00000000), 0),
    PaletteColor(Color(0x00000000), 0)
  ].obs;

  void updateImage() async {
    drink(drinks.keys.elementAt(Random().nextInt(drinks.length)));
    drinkImage('drinks/' + drinks[drink]!);

    Image image = Image.asset('images/' + drinkImage());
    PaletteGenerator paletteGenerator =
      await PaletteGenerator.fromImageProvider(image.image);
    paletteColors.assignAll(paletteGenerator.paletteColors);

    Get.snackbar("Намешал всякого", drink(),
        snackPosition: SnackPosition.BOTTOM);
  }
}