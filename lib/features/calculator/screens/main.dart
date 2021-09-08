import 'package:flutter/material.dart';
import 'package:flutter_learning_hub/features/calculator/screens/widgets/calculator-button.dart';

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double? prevResult;
  double? inputResult;
  String? input;
  ActionType? actionType;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text(
                  prevResult == null ? "" : prevResult.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  prevResult != null && actionType != null
                      ? getOperatorByAction(actionType!)
                      : "",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    backgroundColor: Colors.green,
                  ),
                ),
                Text(
                  input ?? "0",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
            height: 200,
          ),
          Row(
            children: [
              CalculatorButton(
                label: "AC",
                action: ActionType.ClearAll,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "C",
                action: ActionType.Clear,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "+/-",
                action: ActionType.ToggleNumberKind,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "/",
                action: ActionType.Divide,
                onAction: handleAction,
              )
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                label: "7",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "8",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "9",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "x",
                action: ActionType.Multiply,
                onAction: handleAction,
              )
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                label: "4",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "5",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "6",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "-",
                action: ActionType.Minus,
                onAction: handleAction,
              )
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                label: "1",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "2",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "3",
                action: ActionType.Number,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "+",
                action: ActionType.Plus,
                onAction: handleAction,
              )
            ],
          ),
          Row(
            children: [
              CalculatorButton(
                label: "0",
                action: ActionType.Number,
                onAction: handleAction,
                colSpan: 2,
              ),
              CalculatorButton(
                label: ".",
                action: ActionType.DecimalSeparator,
                onAction: handleAction,
              ),
              CalculatorButton(
                label: "=",
                action: ActionType.Equal,
                onAction: handleAction,
              )
            ],
          ),
        ],
      ),
    ));
  }

  void handleAction(ActionType action, [String? character]) {
    print("action $action - $character");
    switch (action) {
      case ActionType.ClearAll:
        setState(() {
          inputResult = null;
          input = null;
          prevResult = null;
          actionType = null;
        });
        break;
      case ActionType.Clear:
        setState(() {
          inputResult = null;
          input = null;
        });
        break;
      case ActionType.ToggleNumberKind:
        setState(() {
          inputResult = inputResult != null ? inputResult! * -1 : null;
          input = inputResult.toString();
        });
        break;
      case ActionType.DecimalSeparator:
        if (input == null|| input?.indexOf(".") == -1) {
          setState(() {
            input = "${input ?? '0'}$character";
            inputResult = input == null ? 0 : double.parse(input!);
          });
        }
        break;
      case ActionType.Number:
        bool prevActionWasEqual = actionType == ActionType.Equal;
        if (actionType != null && !prevActionWasEqual && prevResult == null) {
          setState(() {
            prevResult = inputResult;
            inputResult = double.parse(character!);
            input = character;
          });
        } else {
          String newInput = prevActionWasEqual || input == null ? character! : "$input$character";
          setState(() {
            input = newInput;
            inputResult = double.parse(newInput);
            if (prevActionWasEqual) {
              actionType = null;
            }
          });
        }
        break;
      case ActionType.Multiply:
      case ActionType.Divide:
      case ActionType.Minus:
      case ActionType.Plus:
        {
          if (actionType != null) {
            doOperation(actionType!, newAction: action);
          } else {
            setState(() {
              actionType = action;
              prevResult = inputResult;
              inputResult = null;
              input = null;
            });
          }
          break;
        }
      case ActionType.Equal:
        doOperation(actionType != null ? actionType! : action, isEqual: true);
        break;
      default:
    }
  }

  void doOperation(ActionType action,
      {bool isEqual = false, ActionType? newAction}) {
    setState(() {
      inputResult = performOperation(action);
      input = inputResult.toString();
      prevResult = null;
      if (isEqual) {
        actionType = ActionType.Equal;
      } else {
        actionType = newAction ?? action;
      }
    });
  }

  double performOperation(ActionType action) {
    if (prevResult == null) {
      return inputResult!;
    }

    switch (action) {
      case ActionType.Multiply:
        return prevResult! * inputResult!;
      case ActionType.Divide:
        return prevResult! / inputResult!;
      case ActionType.Plus:
        return prevResult! + inputResult!;
      case ActionType.Minus:
        return prevResult! - inputResult!;
      case ActionType.Equal:
      default:
        return inputResult!;
    }
  }

  String getOperatorByAction(ActionType action) {
    switch (action) {
      case ActionType.Multiply:
        return "x";
      case ActionType.Divide:
        return "/";
      case ActionType.Plus:
        return "+";
      case ActionType.Minus:
        return "-";
      default:
        return "";
    }
  }
}
