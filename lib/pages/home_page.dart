import 'package:ecommerce_app/pages/shopping_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/nike.png', scale: 4,),
              SizedBox(height: 125,),
              Text('Just Do it',
              style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 14,),
              Text('Brand new sneakers and custom kicks made with premium quality',
              textAlign: TextAlign.center,
               style: TextStyle(
                color: Colors.grey.shade500
              ),),
              SizedBox(height: 55,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ShoppingPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Container(
                    
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.black
                    ),
                    child: Center(
                      child: Text(
                        'Shop Now',
                       style: TextStyle(color: Colors.white,
                       fontWeight:FontWeight.bold,
                       fontSize: 16
                       ),
                       )
                      ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}