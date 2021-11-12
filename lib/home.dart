import 'package:flutter/material.dart';
import 'package:vanilla_bloc_flutter_counter/vanilla_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  VanillaBloc vanillaBloc = VanillaBloc();

  @override
  void dispose() {
    super.dispose();
    vanillaBloc.counterController.close();
  }

  @override
  Widget build(BuildContext context) {
    print("Widget Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<int>(
          stream: vanillaBloc.outCounter,
          initialData: 0,
          builder: (context, snapshot) {
            return Center(
              child: Text(
                "${snapshot.data}",
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: vanillaBloc.incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 20,
          ),
          FloatingActionButton(
            onPressed: vanillaBloc.decrementCounter,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
