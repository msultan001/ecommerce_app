import 'package:flutter/material.dart';

import 'shoes.dart';

class ShoeProvider extends ChangeNotifier{
  List<Shoes> shoesList = [
    Shoes(name: 'Under Armour', description: 'Lightweight, breathable mesh upper with synthetic overlays for added durability & support', price: 2000, imagePath: 'assets/images/black.jpg'),
    Shoes(name: 'Ares', description: 'EVA sockliner provides soft, step-in comfort', price: 1800, imagePath: 'assets/images/grey.jpg'),
    Shoes(name: 'Ares', description: 'Charged Cushioning midsole uses compression molded foam for ultimate responsiveness & durability', price: 2400, imagePath: 'assets/images/orange.jpg'),
    Shoes(name: 'Under Armour', description: 'Solid rubber outsole covers high impact zones for greater durability with less weight', price: 3200, imagePath: 'assets/images/white.jpg'),
    Shoes(name: 'Khaki', description: 'Lightweight, breathable mesh upper with synthetic overlays for added durability & support', price: 2500, imagePath: 'assets/images/pink.jpg'),
    
  ];

  List<Shoes> shoeListInCart = [];
  void addToCart(Shoes shoe){
    shoeListInCart.add(shoe);
    notifyListeners();
  }
  void removeShoeFromCart(Shoes shoe){
    shoeListInCart.remove(shoe);
    notifyListeners();
  }

  List<Shoes> get shoesinCart=>shoeListInCart;
  List<Shoes> get shoeLists=>shoesList;
}