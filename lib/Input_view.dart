import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/home_page.dart';

import 'breadcrumbs_view.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(children: [
        Consumer<BreadCrumbProvider>(builder: (context, value, child) {
          return BreadCrumbsWidget(
            breadCrumbs: value.items,
          );
        }),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/new');
          },
          child: const Text('Add new bread crumb'),
        ),
        TextButton(
          onPressed: () {
            context.read<BreadCrumbProvider>().reset();
          },
          child: const Text('Reset'),
        ),
      ]),
    );
  }
}
