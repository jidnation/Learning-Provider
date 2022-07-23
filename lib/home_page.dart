import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class BreadCrumb {
  final String uuid;
  bool isActive;
  final String name;

  BreadCrumb({
    required this.name,
    required this.isActive,
  }) : uuid = const Uuid().v4();

  //activating the particular class
  void activate() {
    isActive = true;
  }

  //This is to check for equality since we are adding it
  //to a list
  @override
  bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  String get title => name + (isActive ? " > " : "");
}

class BreadCrumbProvider extends ChangeNotifier {
  final List<BreadCrumb> _items = [];
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  void add(BreadCrumb breadCrumb) {
    for (final item in _items) {
      item.activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}
