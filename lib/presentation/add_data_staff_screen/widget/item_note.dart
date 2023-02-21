
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemNote extends StatelessWidget {
  const ItemNote({
    Key? key,
    required this.description,
    required this.pathImage}) : super(key: key);

  final String description;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              pathImage,

            )
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              description,
            )
          )
        ],
      ),
    );
  }
}
