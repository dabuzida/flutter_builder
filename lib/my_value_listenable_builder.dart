import 'package:flutter/material.dart';

class MyValueListenableBuilder extends StatefulWidget {
  const MyValueListenableBuilder({super.key});

  @override
  State<MyValueListenableBuilder> createState() => _MyValueListenableBuilderState();
}

class _MyValueListenableBuilderState extends State<MyValueListenableBuilder> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<List<int>> _list = ValueNotifier<List<int>>(<int>[0, 50, -100, 5050]);

  final Widget goodJob = const Text('Good job!');

  @override
  Widget build(BuildContext context) {
    print('build!!!!!!!!!!!!!!!!!!!!!!!!!!');
    return Center(
      child: Container(
        color: Colors.orange.shade100,
        width: double.infinity,
        height: double.infinity,
        // width: 600,
        // height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              child: const Text('You have pushed the button this many times:'),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: ValueListenableBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  // This builder will only get called when the _counter
                  // is updated.
                  print('ValueListenableBuilder');
                  // print('=====================================');
                  // print(_counter.value);
                  // print(_counter);
                  // print(value);
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(value.toString()),
                      Text(value.toString()),
                      Text('${_counter.value}'),
                      child!,
                    ],
                  );
                },
                valueListenable: _counter,
                // The child parameter is most helpful if the child is
                // expensive to build and does not depend on the value from
                // the notifier.
                child: goodJob,
              ),
            ),
            TextButton(
              onPressed: () => _counter.value += 1,
              child: const Icon(Icons.plus_one),
            ),
          ],
        ),
      ),
    );
  }
}
