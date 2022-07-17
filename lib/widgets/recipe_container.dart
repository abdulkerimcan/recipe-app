import 'package:flutter/material.dart';

import '../models/Recipe.dart';

class RecipeContainer extends StatelessWidget {
  final Recipe recipe;
  const RecipeContainer({
    Key? key,
    required this.recipe
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 0.7,
            child: Image.network(
              "${recipe.img}",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: _myContainer(Icons.star, "${recipe.rating}"),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: _myContainer(Icons.access_time_filled, "${recipe.time}"),
          ),
          Center(
              child: Text(
            recipe.name,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(backgroundColor: Colors.black),
          ))
        ],
      ),
    );
  }

  Container _myContainer(IconData icondata, String text) {
    return Container(
      padding: EdgeInsets.all(2),
      color: Colors.black54,
      child: Row(
        children: [
          Icon(
            icondata,
            color: Colors.amber,
          ),
          Text(text)
        ],
      ),
    );
  }
}
