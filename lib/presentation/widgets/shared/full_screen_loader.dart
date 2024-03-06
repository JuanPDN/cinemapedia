import 'package:flutter/material.dart';

class FullScrennLoader extends StatelessWidget {
  const FullScrennLoader({super.key});

  Stream<String> getLoadingMessages() {
    final List<String> messages = [
      'Cargando peliculas',
      'Comprando Palomitas',
      'Cargando Populares',
      'Ya casi ...',
      'Esto esta tardando mas de lo esperado 😣'
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Espere por favor'),
        const SizedBox(
          height: 10,
        ),
        const CircularProgressIndicator(
          strokeWidth: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando...');
            return Text(snapshot.data!);
          },
        )
      ],
    ));
  }
}
