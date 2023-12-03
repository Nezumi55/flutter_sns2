// flutter
import 'package:flutter/material.dart';
import 'package:flutter_sns/constants/strings.dart';

final List<BottomNavigationBarItem> BottomNavigationBarElements = [
  const BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: homeText,
    ),
const BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: searchText,
    ),
    const BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: profileText,
    ),
];
