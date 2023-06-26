import 'package:flutter/material.dart';
import 'package:value_notifier/src/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final controller = HomeController();

  final counter = Counter();

  // int get _counter => controller.counter;

  // Rebuilda tela como um todo com o setstate
  // @override
  // void initState() {
  //   super.initState();
  // É chamado sempre que algo no controller passa o notifyListeners()
  // controller.counter$.addListener(() {
  //   setState(() {});
  // });

  // extendendo valueNotifier
  //   counter.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // atualizando pelo initState e setState;
            Text(
              'O valor com notify e init é ${counter.value}',
              style: const TextStyle(fontSize: 18),
            ),
            // buildando apenas um local da tela;
            AnimatedBuilder(
              animation: counter,
              builder: (context, child) {
                return Text(
                  'O valor com AnimatedBuilder é ${counter.value}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: counter,
              builder: (context, value, child) {
                return Text(
                  'O valor com ValueListenableBuilder é $value',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: counter.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
