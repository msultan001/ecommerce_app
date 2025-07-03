import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_provider.dart';
import '../models/shoes.dart';
import 'cart_page.dart';
import 'home_page.dart';

class ShoppingPage extends StatefulWidget{
  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  int _selectedIndex = 0;

  void changePage(int index){
    setState(() {
      _selectedIndex = index;
    });
    if(index == 1){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));

    }
    
  }
  void openDrawer(context){
    Scaffold.of(context).openDrawer();
  }
 
  @override
  Widget build(BuildContext context){
    return Scaffold(
      
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context)=>IconButton(onPressed:()=> openDrawer(context), icon: Icon(Icons.menu))),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Search', style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16
                ),),
                Icon(Icons.search)
              ],
            ),
          ),
          SizedBox(height: 12,),
          Text('everyone flies.. some fly longer than others', style: TextStyle(
            color: Colors.grey.shade600
          ),
          ),
          SizedBox(height: 8,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Hot Picks 🔥',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                Text(
                  'See all',
                  style: TextStyle(
                  color: Colors.blue
                ),)
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              
              scrollDirection: Axis.horizontal,
              itemCount: context.read<ShoeProvider>().shoeLists.length,
              itemBuilder: (context, index){
                return Container(
                  height: 30,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white
                  ),
                  width: 240,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(14),
                        child: Image.asset(
                           context.read<ShoeProvider>().shoeLists[index].imagePath,
                          scale: 1,
                          ),
                      ),
                      SizedBox(height: 28,),
                        Text(
                           context.read<ShoeProvider>().shoeLists[index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade600
                        ),
                        ),
                        SizedBox(height: 18,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Column(
                                
                                
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text( context.read<ShoeProvider>().shoeLists[index].name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                  Text('\$${ context.read<ShoeProvider>().shoeLists[index].price.toString()}')
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                context.read<ShoeProvider>().addToCart( context.read<ShoeProvider>().shoeLists[index]);
                                showDialog(
                                 
                                  context: context,
                                 builder: (context){
                                  return AlertDialog(
                                    backgroundColor: Colors.grey.shade100,
                                    title: Text('Added to cart', textAlign: TextAlign.center,),
                                    content: GestureDetector(
                                      onTap: (){
                                        Navigator.pop(context);
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: Colors.black
                                        ),
                                        child: Text(
                                          'Go to Cart',
                                          style: TextStyle(
                                            color: Colors.white
                                          ),
                                           textAlign: TextAlign.center,)),
                                    ),
                                    
                                    
                                  );
                                 });
                              },
                              child: Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(10)
                                  ),
                                  color: Colors.black
                                ),
                                child: Icon(Icons.add, color: Colors.white,)),
                            ),
                              
                          ],
                        ),
                        
                    ],
                  ),
                );
              },
            )
            ),
            Divider(height: 100,color: Colors.transparent,)

        ],
        
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        fixedColor: Colors.grey.shade800,
        currentIndex: _selectedIndex,
        onTap: changePage,
        items: [
        BottomNavigationBarItem(
          
          icon: Icon(Icons.home),
          label: 'Home'
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag,),
          label: 'Cart'
          )
      ]
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade900,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 38,
                top: 25,
                right: 38
                ),
              child: Image.asset("assets/images/nikeWhite.png",),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 28, left: 5, right: 5),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: ListTile(
                onTap: ()=>Navigator.pop(context),
                leading: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 20,
                  ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    ),
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: ListTile(
                leading: Icon(
                  Icons.info,
                  color: Colors.white,
                  size: 20,
                  ),
                title: Text(
                  'About',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    ),
                  ),
              ),
            ),
            Spacer(),
           Padding(
             padding: const EdgeInsets.only(
              bottom: 15, left: 18
              ),
             child: ListTile(
              onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())),
              leading: Icon(
                Icons.logout,
              color: Colors.white,
              size: 20,
              ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                    )
                    ,
                    ),
              ),
           ),
          
          ],

        ),
      ),
    );
  }
}