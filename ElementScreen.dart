import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/provider/ElementProvider.dart';

class Elementscreen extends StatelessWidget {
  const Elementscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: 
      Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        SizedBox(height: 20,),
          Consumer<Elementprovider>(
            builder: ( context, provider,  child) { return  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [ Text('Dark Mode', style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
                    CupertinoSwitch(value: provider.isDark, onChanged: (val){
                    provider.toggleThem();
                    })],);
                      },
         
          ),
          SizedBox(height: 10,),
         Consumer<Elementprovider>(builder: (context,provider,child){
          return  Container(height: 200,width: 200,
           decoration: BoxDecoration(color: const Color.fromARGB(255, 42, 162, 186).withOpacity(provider.isSlider),
           borderRadius: BorderRadius.circular(100*provider.isSlider)
           ),
          );
         }),

         Consumer<Elementprovider>(builder: (context,provider,child){
          return Slider(value: provider.isSlider, onChanged: (val){
                provider.changeOpacity(val);
          });
         })
       
      ],),
    );
  }
}