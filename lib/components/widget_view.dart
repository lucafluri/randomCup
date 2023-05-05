import 'package:flutter/widgets.dart';

abstract class StatefulWidgetView<W extends StatefulWidget, S extends State>
    extends StatelessWidget {
  @protected
  final S controller;
  @protected
  W get widget => controller.widget as W;
  const StatefulWidgetView(
    this.controller, {
    Key? key,
  }) : super(key: key);
}

/// A widget view of a [StatelessWidget] as a stateless controller.
// ignore: prefer-single-widget-per-file
abstract class StatelessWidgetView<W extends StatelessWidget>
    extends StatelessWidget {
  @protected
  final W controller;
  const StatelessWidgetView(
    this.controller, {
    Key? key,
  }) : super(key: key);
}
