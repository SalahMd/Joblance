import 'package:flutter/widgets.dart';
import 'package:joblance/core/functions/alerts.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: exitAlert,
      child: const Placeholder());
  }
}