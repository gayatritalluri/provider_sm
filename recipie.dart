// import 'package:first/Models/data.dart';
import 'package:flutter/material.dart';
// import 'package:first/Screens/ListTile.dart';
// import 'package:first/Models/categories_model.dart';
import 'package:provider_sm/models/data.dart';
import 'package:provider_sm/screens/favouritescreen.dart';
import 'package:provider_sm/screens/listTile.dart';

class Recipie extends StatelessWidget {
  const Recipie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourites()));
        },
          child: Icon(Icons.favorite_border)),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(category.color),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeListScreen(topic: category.name),
                  ),
                );
              },
              child: Text(
                category.name,
                style: const TextStyle(fontSize: 21, color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
