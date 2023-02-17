import 'dart:ui';
import "dart:math";

import 'package:flutter/material.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:provider/provider.dart';
import 'package:multi_provider/weight_provider.dart';
import 'package:multi_provider/height_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var weightProvider = Provider.of<WeightProvider>(context);
    var heightProvider = Provider.of<HeightProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Weight (Kg) :',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // menggunakan consumer
            // Consumer<HeightProvider>(
            //   builder: (context, heightProvider, _) => Slider(
            //     max: 200,
            //     min: 1,
            //     value: heightProvider.height,
            //     divisions: 100,
            //     label: heightProvider.height.round().toString(),
            //     activeColor: Colors.blue,
            //     inactiveColor: Colors.blue.withOpacity(0.2),
            //     onChanged: (newValue) {
            //       print('height: $newValue');
            //       heightProvider.height = newValue;
            //     },
            //   ),
            // ),
            Slider(
              max: 200,
              min: 1,
              value: heightProvider.height,
              divisions: 100,
              label: heightProvider.height.round().toString(),
              activeColor: Colors.blue,
              inactiveColor: Colors.blue.withOpacity(0.2),
              onChanged: (newValue) {
                print('height: $newValue');
                heightProvider.height = newValue;
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your Height (cm) :',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            // menggunakan consumer
            // Consumer<WeightProvider>(
            //   builder: (context, weightProvider, _) => Slider(
            //     max: 200,
            //     min: 1,
            //     value: weightProvider.weight,
            //     divisions: 100,
            //     label: weightProvider.weight.round().toString(),
            //     activeColor: Colors.green,
            //     inactiveColor: Colors.green.withOpacity(0.2),
            //     onChanged: (newValue) {
            //       print('height: $newValue');
            //       weightProvider.weight = newValue;
            //     },
            //   ),
            // ),
            Slider(
              max: 200,
              min: 1,
              value: weightProvider.weight,
              divisions: 100,
              label: weightProvider.weight.round().toString(),
              activeColor: Colors.green,
              inactiveColor: Colors.green.withOpacity(0.2),
              onChanged: (newValue) {
                print('height: $newValue');
                weightProvider.weight = newValue;
              },
            ),
            SizedBox(
              height: 50,
            ),
            Consumer<WeightProvider>(
              builder: (Context, weightProvider, _) => Consumer<HeightProvider>(
                builder: (context, heightProvider, _) => Text(
                  'Your BMI :\n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)} ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
