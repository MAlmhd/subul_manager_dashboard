import 'package:flutter/material.dart';
 void showOverlay(BuildContext context, Widget overlayContent) {
  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Stack(
      children: [
        
        GestureDetector(
          onTap: () {
            overlayEntry.remove();
          },
          child: Container(
            color: Colors.transparent,
            width: double.infinity,
            height: double.infinity,
          ),
        ),

        // المحتوى الذي تريده
        Positioned(
          top: 30,
          left: 500,
          child: Material(
            color: Colors.transparent,
            child: overlayContent,
          ),
        ),
      ],
    ),
  );

  overlay.insert(overlayEntry);
}
