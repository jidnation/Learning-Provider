import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_manager/home_page.dart';

class NewBreadCrumbWidget extends StatefulWidget {
  const NewBreadCrumbWidget({Key? key}) : super(key: key);

  @override
  State<NewBreadCrumbWidget> createState() => _NewBreadCrumbWidgetState();
}

class _NewBreadCrumbWidgetState extends State<NewBreadCrumbWidget> {
  late final TextEditingController textController;
  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new bread crumbs'),
      ),
      body: Column(children: [
        Expanded(
            child: TextField(
          controller: textController,
          decoration: const InputDecoration(
              hintText: 'Enter a new bread crumb here...'),
        )),
        TextButton(
            onPressed: () {
              context.read<BreadCrumbProvider>().add(
                    BreadCrumb(
                      name: textController.text,
                      isActive: false,
                    ),
                  );
              Navigator.pop(context);
            },
            child: const Text('Add')),
        const Spacer(flex: 6)
      ]),
    );
  }
}
