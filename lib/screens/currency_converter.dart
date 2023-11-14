import "package:flutter/material.dart";

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  double result = 0;
  final TextEditingController _textEditingController = TextEditingController();

  void convertCurrency() {
    setState(() {
      result = double.parse(_textEditingController.text) * 83.29;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 1.0,
        style: BorderStyle.solid,
      ),
      // borderRadius: BorderRadius.circular(5),
    );

    return Container(
      color: Colors.pink[200],
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "INR ${result > 0 ? result.toStringAsFixed(2) : result.toStringAsFixed(0)}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: "Enter amount in USD",
                hintStyle: TextStyle(color: Colors.black87),
                prefixIcon: Icon(Icons.monetization_on_outlined),
                prefixIconColor: Colors.black87,
                fillColor: Colors.white,
                filled: true,
                focusedBorder: border,
                enabledBorder: border,
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                _textEditingController.text.isNotEmpty ? convertCurrency() : {};
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Convert"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  result = 0;
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Clear"),
            )
          ],
        ),
      ),
    );
  }
}
