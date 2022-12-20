import 'package:flutter/material.dart';

class MyAnimatedBuilder3 extends StatelessWidget {
  MyAnimatedBuilder3({super.key});

  // final ValueNotifier<List<int>> _list = ValueNotifier<List<int>>(<int>[0, 50, -100, 5050]);
  final ValueNotifier<Map<int, int>> _list = ValueNotifier<Map<int, int>>(<int, int>{
    0: 0,
    1: 1,
    2: 2,
    3: 3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        border: Border.all(color: Colors.cyan),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBuilder(
              animation: _list,
              builder: (BuildContext context, Widget? child) {
                return Column(
                  children: <Widget>[
                    Text('$_list'),
                    Text('${_list.value}'),
                    Text('${_list.value[0]}'),
                    Text('${_list.value.length}'),
                  ],
                );
              },
            ),
            TextButton(
              onPressed: () {
                // print(_list.value[0]);
                // print(11);
                // _list.value[0] += 1;
                _list.value.update(0, (value) => ++value);
                // _list.value[0] = _list.value[0] + 1;
                // _list.value[0]++;
                print(_list);
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
