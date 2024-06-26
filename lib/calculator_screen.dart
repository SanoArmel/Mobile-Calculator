import 'package:flutter/material.dart';
import 'button_values.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    if (buttonText == Btn.clr) {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == Btn.del) {
      _output = _output.length > 1 ? _output.substring(0, _output.length - 1) : "0";
    } else if (buttonText == Btn.add ||
        buttonText == Btn.substract ||
        buttonText == Btn.multiply ||
        buttonText == Btn.divide) {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == Btn.calculate) {
      num2 = double.parse(output);

      if (operand == Btn.add) {
        _output = (num1 + num2).toString();
      }
      if (operand == Btn.substract) {
        _output = (num1 - num2).toString();
      }
      if (operand == Btn.multiply) {
        _output = (num1 * num2).toString();
      }
      if (operand == Btn.divide) {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    output,
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),
            // Buttons
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(
                      width: value == Btn.n0 ? screenSize.width / 2 : screenSize.width / 4,
                      height: screenSize.width / 5,
                      child: buildButton(value),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColor(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.white24,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        child: InkWell(
          onTap: () => buttonPressed(value),
          child: Center(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getBtnColor(String value) {
    return [Btn.del, Btn.clr].contains(value)
        ? const Color.fromARGB(255, 171, 68, 152)
        : [Btn.per, Btn.multiply, Btn.divide, Btn.substract, Btn.add, Btn.calculate].contains(value)
            ? const Color.fromARGB(255, 92, 172, 128)
            : Colors.black87;
  }
}