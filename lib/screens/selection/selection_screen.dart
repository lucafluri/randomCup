import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:randomcup/screens/home/components/cupCard.dart';
import 'package:randomcup/screens/home/home.dart';
import 'package:randomcup/services/storage_service.dart';

import '../../models/cup.dart';
import '../../services/cup_handler.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  static const routeName = '/';

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  double _currentSliderValue = 2;
  Cup? randomCup;

  final List<Widget> toggleButtons = [
    Icon(Icons.coffee, size: 20),
    Icon(Icons.coffee, size: 30),
    Icon(Icons.coffee, size: 40),
  ];

  final List<bool> isSelected = [true, true, true];

  // String getLabel() {
  //   switch (_currentSliderValue.toInt()) {
  //     case 1:
  //       return "small";
  //     case 2:
  //       return "medium";
  //     case 3:
  //       return "large";
  //     case 4:
  //       return "all";
  //     default:
  //       return "all";
  //   }
  // }

  @override
  Widget build(BuildContext context) => _SelectionScreenView(this);
}

class _SelectionScreenView extends StatelessWidget {
  const _SelectionScreenView(this.state, {Key? key}) : super(key: key);
  final _SelectionScreenState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Random Cup"),
          actions: [
            IconButton(
                onPressed: () {
                  // controller.clearCups();
                  Navigator.pushNamed(context, HomeScreen.routeName);
                },
                icon: const Icon(Icons.collections))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            state.randomCup != null
                ? CupCard(cup: state.randomCup!)
                : const Placeholder(),
            // Slider(
            //     value: state._currentSliderValue,
            //     min: 1,
            //     max: 4,
            //     divisions: 3,
            //     // label: state.getLabel(),
            //     onChanged: (double value) {
            //       if (cups.value.isNotEmpty) {
            //         state.setState(() {
            //           state._currentSliderValue = value;
            //         });
            //       }
            //     }),
            ToggleButtons(
              direction: Axis.horizontal,
              isSelected: state.isSelected,
              constraints: const BoxConstraints(
                minHeight: 40.0,
                minWidth: 80.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              onPressed: (int idx) {
                state.setState(() {
                  // Check that at least one button is selected
                  state.isSelected[idx] = !state.isSelected[idx];
                  if (state.isSelected.where((element) => element).isEmpty) {
                    state.isSelected[idx] = true;
                  }
                });
              },
              children: state.toggleButtons,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            state.setState(() {
              // print(cups.value.length);
              if (state._currentSliderValue < 4) {
                // state.randomCup = getRandomCupWithSize(
                //     getSizeFromInt(state._currentSliderValue.toInt() - 1));

                final listOfTrueSizes = [
                  for (int i = 0; i < state.isSelected.length; i++)
                    if (state.isSelected[i]) getSizeFromInt(i)
                ];

                state.randomCup = getRandomCupWithSizes(listOfTrueSizes);
              } else {
                state.randomCup = getRandomCup();
              }

              // TESTING
              printFiles("");
            });
          },
          child: const Icon(Icons.refresh),
        ));
  }
}
