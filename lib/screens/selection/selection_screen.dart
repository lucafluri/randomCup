import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:randomcup/screens/home/components/cupCard.dart';
import 'package:randomcup/screens/home/home.dart';
import 'package:randomcup/services/storage_service.dart';

import '../../components/size_togglebutton.dart';
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
          title: const Text("Random Mug"),
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
                : const SizedBox(
                    height: 500,
                    width: 400,
                    child: Center(
                      child: Text("Select a cup size and press refresh"),
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ToggleButtons(
                direction: Axis.horizontal,
                isSelected: state.isSelected,
                constraints: const BoxConstraints(
                  minHeight: 60.0,
                  minWidth: 100.0,
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
                children: toggleButtons,
              ),
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
