import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void increase(int num) {
    setState(() {
      _count += num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              "https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              "https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              "https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              "https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.6,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Count : $_count",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              increase(4);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff000000),
            ),
            child: const Text("Increase"),
          )
        ],
      ),
    );
  }
}
