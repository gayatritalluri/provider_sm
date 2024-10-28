import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/provider/mealcart.dart';
// import 'package:provider_sm/providers/meal_cart_provider.dart';
import 'package:provider_sm/models/meals_model.dart';

class Favourites extends StatefulWidget {
  const Favourites({super.key});

  @override
  State<Favourites> createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        centerTitle: true,
      ),
      body: Consumer<MealCartProvider>(
        builder: (context, cartProvider, child) {
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            itemCount: cartProvider.mealCart.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final meal = cartProvider.mealCart[index];
              
              return Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: Image.network(
                        meal.imageUrl,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        meal.title,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartProvider?.addMealsToCart(meal); 
                    },
                    icon: Icon(
                      cartProvider!.isMealInCart(meal) ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
