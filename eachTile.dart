// import 'package:first/Models/meals_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/models/data.dart';
// import 'package:first/Models/categories_model.dart';
import 'package:provider_sm/models/meals_model.dart';
import 'package:provider_sm/provider/mealcart.dart';

class EachTile extends StatelessWidget {
  final Meal data;

  EachTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<MealCartProvider>(builder: (context, cartProvider, child){
          final eachMeal = meals;
          return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Container(
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 30,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.title,
                        style: const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                       InkWell(
                                      onTap: () {
                                        cartProvider.addMealsToCart(data);
                                      },
                                      child: Icon(
                                        cartProvider.isMealInCart(data) ? Icons.favorite : Icons.favorite_border,
                                        color: cartProvider.isMealInCart(data) ? Colors.red : Colors.grey,
                                      ),
                                  ),
                    ],
                  ),
                ),
              ),
          
              const Text(
                "Ingredients",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Flex(direction: Axis.horizontal,
                    children: List.generate(data.ingredients.length,(indx)=>Card(
                        color: Colors.grey,
                        child: Padding(
                          padding: EdgeInsets.all(10.0), // Adjust the padding as needed
                          child: Center(
                            child: Text(
                              data.ingredients[indx],
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      )
                    ),
                    ),
                  ),
              ),
           
              const Text(
                "Steps to Prepare",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: data.steps.map((step) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              step,
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
        })
      ),
    );
  }
}
