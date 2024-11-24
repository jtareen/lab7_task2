import 'package:flutter/material.dart';
import 'package:lab7_task2/models/pic_class.dart';

class PageBody extends StatelessWidget {
  const PageBody({super.key, required this.picture});

  final Pic picture;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(picture.title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
        const SizedBox(height: 20,),
        Container(
          width: MediaQuery.of(context).size.width - 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(picture.imagePath, fit: BoxFit.cover,),
          ),
        ),
        const SizedBox(height: 20,),
      ],
    );
  }
}