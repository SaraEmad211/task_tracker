import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

Widget customText(String text, double size, {Color color = Colors.black,bool isBold = false}) {
  return AutoSizeText(
    text,
    
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      
      
    ),
      maxLines: 2,
    minFontSize: 10,
    overflow: TextOverflow.ellipsis,
    wrapWords: true,
     
  );
}
