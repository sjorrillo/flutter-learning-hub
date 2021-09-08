import 'package:flutter/material.dart';

enum ActionType {
  Number,
  Multiply,
  Divide,
  Plus,
  Minus,
  Equal,
  DecimalSeparator,
  ToggleNumberKind,
  ClearAll,
  Clear,
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final ActionType action;
  final void Function(ActionType action, [String? character]) onAction;
  final int? colSpan;
  final double? padding;

  const CalculatorButton({Key? key, required this.label, required this.action, required this.onAction,  this.colSpan, this.padding = 20 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(padding!),
      child: SizedBox(
        width: (65 + (colSpan != null ? padding! : 0)) * (colSpan ?? 1).toDouble(),
        height: 65,
        child: TextButton(
          onPressed: handlePress,
          child: Text(label),
          style: TextButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(65/2)))
          ),
        ),
      ),
    );
  }

  void handlePress() {
    switch (action) {
      case ActionType.Number:
      case ActionType.DecimalSeparator:
        onAction(action, label);
        break;
      default:
        onAction(action, label);
    }
    
  }
}
