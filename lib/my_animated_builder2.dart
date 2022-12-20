import 'package:flutter/material.dart';

class MyAnimatedBuilder2 extends StatelessWidget {
  MyAnimatedBuilder2({super.key});
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade100,
        border: Border.all(color: Colors.red),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Current counter value:'),
            // Thanks to the [AnimatedBuilder], only the widget displaying the
            // current count is rebuilt when `counterValueNotifier` notifies its
            // listeners. The [Text] widget above and [CounterBody] itself aren't
            // rebuilt.
            AnimatedBuilder(
              // [AnimatedBuilder] accepts any [Listenable] subtype.
              animation: _counter,
              builder: (BuildContext context, Widget? child) {
                return Text('${_counter.value}');
              },
            ),
            TextButton(
              onPressed: () => _counter.value++,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
