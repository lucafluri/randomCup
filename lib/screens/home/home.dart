import 'package:flutter/material.dart';
import '../../services/cup_handler.dart';
import 'components/cupCard.dart';
import 'components/floating_add.dart';

/// 1. The public facing widget, configuration options live here
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/collection";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

/// 2. The state / controller / bloc / view controller
/// event handlers and helper methods can live here
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _HomeScreenView(this);
}

/// 3. The stateless UI, uses `_state` to accomplish tasks, avoiding boilerplate of param passing and callbacks
///  Big blobs of layout can live here
class _HomeScreenView extends StatelessWidget {
  const _HomeScreenView(this.state, {Key? key}) : super(key: key);
  final _HomeScreenState state;

  @override
  Widget build(BuildContext context) {
    // setState(() {});
    return Scaffold(
        appBar: AppBar(
          title: Text("All Cups - Total: ${cups.value.length}"),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       // controller.clearCups();
            //     },
            //     icon: const Icon(Icons.collections))
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: cups,
          builder: (context, value, child) {
            return GridView.count(
                crossAxisCount: 3,
                children: [for (var cup in value) CupCard(cup: cup)]);
          },
        ),
        floatingActionButton: FloatingAdd());
  }
}
