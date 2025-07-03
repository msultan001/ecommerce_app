import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_provider.dart';
import 'shopping_page.dart';

class CartPage extends StatefulWidget{
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>ShoppingPage()));
          },
          child: Icon(Icons.arrow_back,)),
        title: Text(
          'My Cart',
          textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: context.read<ShoeProvider>().shoeListInCart.isEmpty?Center(
        child: Text(
          'Cart is Empty',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade700
          ),
        ),):ListView.builder(
        
        itemCount:  context.watch<ShoeProvider>().shoesinCart.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset( context.read<ShoeProvider>().shoeListInCart[index].imagePath),
                    SizedBox(width: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context.read<ShoeProvider>().shoesinCart[index].name, style: TextStyle(fontSize: 16),),
                        Text('\$'+context.read<ShoeProvider>().shoesinCart[index].price.toString())
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){
                        context.read<ShoeProvider>().removeShoeFromCart(context.read<ShoeProvider>().shoeListInCart[index]);
                      },
                      child: Icon(
                        Icons.delete,
                      color: Colors.grey.shade600,),
                    )
                  ],
                ),
              ),
            ),
          );
      }),
    );
  }
}