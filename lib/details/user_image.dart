import 'package:flutter/material.dart';
import 'package:flutter_sns/details/circle_image.dart';

class UserImage extends StatelessWidget {
  const UserImage({
    Key? key,
    required this.length,
    required this.userImageURL,
  }) : super(key: key);
  final double length;
  final String userImageURL;

  @override
  Widget build(BuildContext context) {
    return userImageURL.isEmpty?
    Container(
      width: length,
      height: length,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.person, color: Colors.grey, size: length * 2 / 3),
    )
    :CircleImage(length: length, image: NetworkImage(userImageURL));
  }
}
