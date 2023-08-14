import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../model/movie.dart';

class MovieHomeComponents extends StatelessWidget {
  final MovieModel movie;

  const MovieHomeComponents(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Center(child: Text('${movie.rating}'))),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(movie.url, fit: BoxFit.cover),
            ),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text(movie.director), Text('${movie.year}')],
          ),
        ),
      ],
    );
  }
}
