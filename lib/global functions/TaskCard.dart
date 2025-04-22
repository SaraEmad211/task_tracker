import 'package:flutter/material.dart';
import 'customText.dart';
// ignore: non_constant_identifier_names
SizedBox TaskCard({
  required String title,
  required String description,
  required String time,
  required double progress,
  required Color color,
  required double screenWidth
}) {
  return 
    SizedBox(
width:  screenWidth*0.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(child: customText(title, 20, color: Colors.white,isBold: true)),
              const SizedBox(height: 5), 
              Flexible(child: customText(description,20,color: Colors.white)),
              const SizedBox(height: 5),
              Flexible(child: customText(time, 20, color: Colors.white,isBold: true)),
            ],
          ),
        ),
      
        ),
    );
}