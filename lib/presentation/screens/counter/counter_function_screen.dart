import 'package:flutter/material.dart';

class CounterFunctionScreen extends StatefulWidget {
  const CounterFunctionScreen({super.key});

  @override
  State<CounterFunctionScreen> createState() => _CounterFunctionScreenState();
}

class _CounterFunctionScreenState extends State<CounterFunctionScreen> {
  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Counter funtion Screen")),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
              icon: const Icon(Icons.refresh_rounded),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$clickCounter",
                style:
                    const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
              ),
              Text(
                "Click${clickCounter == 1 ? "" : "s"}",
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomButton(
            icon: Icons.refresh_rounded,
            onPress: () {
              setState(() {
                clickCounter = 0;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icon: Icons.plus_one,
            onPress: () {
              setState(() {
                clickCounter++;
              });
            },
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icon: Icons.exposure_minus_1_rounded,
            onPress: () {
              if (clickCounter == 0) return;
              setState(() {
                clickCounter--;
              });
            },
          ),
        ]));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      onPressed: onPress,
      splashColor: Colors.red,
      child: Icon(icon),
    );
  }
}
