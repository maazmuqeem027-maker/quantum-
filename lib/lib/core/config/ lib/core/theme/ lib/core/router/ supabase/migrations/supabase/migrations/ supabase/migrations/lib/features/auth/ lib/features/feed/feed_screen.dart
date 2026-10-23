import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (c,i) {
          return Stack(
            children: [
              Container(color: Colors.grey[900], child: Center(child: Icon(Icons.play_arrow, size: 80, color: Colors.white54))),
              Positioned(bottom: 20, left: 15, right: 80, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('@user_$i', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), Text('Quantum Video #$i #fyp', style: TextStyle(color: Colors.white))])),
              Positioned(bottom: 20, right: 10, child: Column(children: [Icon(Icons.favorite, color: Colors.white), SizedBox(height: 15), Icon(Icons.comment, color: Colors.white), SizedBox(height: 15), Icon(Icons.share, color: Colors.white)]))
            ],
          );
        },
      ),
    );
  }
}
