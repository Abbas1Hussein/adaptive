import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../data/movie.dart';
import '../components/movie.dart';

class OverViewTab extends StatelessWidget {
  const OverViewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.horizontal,
        itemCount: movieData.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => MovieHomeComponents(movieData[index]),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 2,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
      ),
    );
  }
}
