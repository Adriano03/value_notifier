import 'package:flutter/material.dart';

// class HomeController {
// Modo para atualizar apenas com o notifyListeners, a classe precisa extends ChangeNotifier
// var counter = 0;
// void increment() {
//   counter++;
//   Atualiza todos os interessados na view, mais precisamemte colocando dentro do initState como .addListener((){})
//   notifyListeners();
// }

// Modo para atualizar apenas o componente com ValueNotifier, desse modo pode ter quantas reatividades quiser
// var counter$ = ValueNotifier(0);

// int get counter => counter$.value;

// void increment() {
//   // Atribuindo ao value, diretamente vai notifyListeners()
//   counter$.value++;
// }
// }

class Counter extends ValueNotifier<int> {
  Counter() : super(0);

  increment() => value++;
  decrement() => value--;
}
