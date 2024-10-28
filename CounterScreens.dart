import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';
import 'package:provider_sm/provider/CounterProvider.dart';
import 'package:provider_sm/widgets/Button.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Consumer<CounterProvider>(
          builder: (BuildContext context, value, Widget? child) {
            return Text(
              value.counter.toString(),
              style: Theme.of(context).textTheme.headlineLarge,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleButton(
            onTap: () {
              context.read<CounterProvider>().increment();
            },
            icon: Icon(Icons.add),
          ),
          CircleButton(
            onTap: () {
              context.read<CounterProvider>().decrement();
            },
            icon: Icon(Icons.remove),
          ),
          CircleButton(
            onTap: () {
              context.read<CounterProvider>().reset();
            },
            icon: Icon(Icons.exposure_zero),
          ),
        ],
      ),
    );
  }
}