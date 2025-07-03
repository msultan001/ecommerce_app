import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/cart_provider.dart';
import 'pages/home_page.dart';

import 'package:google_fonts/google_fonts.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
  ChangeNotifierProvider(
    create: (context)=>ShoeProvider(),
    child: MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.robotoFlexTextTheme()
        
      ),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
    ),
  ));
}