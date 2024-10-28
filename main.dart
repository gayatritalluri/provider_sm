import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_sm/provider/CounterProvider.dart';
import 'package:provider_sm/provider/ElementProvider.dart';
import 'package:provider_sm/provider/Theme_Provider.dart';
import 'package:provider_sm/provider/colorcartProvider.dart';
import 'package:provider_sm/provider/mealcart.dart';
import 'package:provider_sm/screens/CounterScreens.dart';
import 'package:provider_sm/screens/ElementScreen.dart';
import 'package:provider_sm/screens/colors.dart';
// import 'package:provider_sm/screens/food.dart';
import 'package:provider_sm/screens/recipie.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(

     MultiProvider(providers: [
       ChangeNotifierProvider(create: (_)=>Elementprovider()),
        ChangeNotifierProvider(create: (_)=>CounterProvider(),),
        ChangeNotifierProvider(create: (_)=>ThemeProvider(),),
         ChangeNotifierProvider(create: (_)=>Colorcartprovider(),),
         ChangeNotifierProvider(create: (_)=>MealCartProvider()),
     ],child: DevicePreview(builder: (context)=>MyApp()))

  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      themeMode: themeMode.theme,
      theme: ThemeData(brightness: Brightness.light,
      appBarTheme: AppBarTheme(color: Colors.green)
      ),
      darkTheme: ThemeData(brightness: Brightness.dark,
      appBarTheme: AppBarTheme(color: Colors.yellow)),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
        );
    }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Elementscreen()));
        }, child: Text('ElementScreen')),
        ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ColorsScreen()));
        }, child: Text('ColorsScreen')),
         ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CounterScreen()));
        }, child: Text('CounterScreen')),
        Consumer<ThemeProvider>(builder: (context,value,child)=>
            CupertinoSwitch(value: value.theme == ThemeMode.dark ? true : false, onChanged: (val){
                  value.changeTheme(val ? ThemeMode.dark : ThemeMode.light);
        })
        ),

         ElevatedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Recipie()));
        }, child: Text('FoodScreen')),
        

        
            ],),
      ),);
  }
}

