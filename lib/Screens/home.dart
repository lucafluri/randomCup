import 'dart:io';

import 'package:flutter/material.dart';
import 'package:randomcup/Widgets/cupCard.dart';
import 'package:randomcup/Widgets/floating_add.dart';

import '../controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Controller controller = Controller();

  // Widget getCupWidgets() {
  //   return GridView.count(crossAxisCount: 3, children: [
  //     for (var cup in controller.cups)
  //       Container(
  //         margin: const EdgeInsets.all(10),
  //         child: Image.file(
  //           File(cup.image!.path),
  //           fit: BoxFit.cover,
  //         ),
  //       )
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
        appBar: AppBar(
          title: const Text("Random Cup"),
          actions: [
            IconButton(
                onPressed: () {
                  // controller.clearCups();
                },
                icon: const Icon(Icons.collections))
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: controller.cups,
          builder: (context, value, child) {
            return GridView.count(crossAxisCount: 3, children: [
              for (var cup in value)
                CupCard(
                  imagePath: cup.image!.path,
                  size: cup.size,
                )
            ]);
          },
        ),
        floatingActionButton: FloatingAdd());
  }
}
