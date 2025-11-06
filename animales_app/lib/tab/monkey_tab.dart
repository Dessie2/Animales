import 'package:flutter/material.dart';
import 'package:animales_app/utils/monkey_tile.dart';
import 'package:animales_app/models/cart.dart';
import 'package:animales_app/models/product.dart';

class MonkeyTab extends StatelessWidget {
  MonkeyTab({super.key});

  // Lista de monos disponibles para adopción
  final List<List<dynamic>> monkeysAvailable = [
    [
      'Mono Capuchino',
      800.0,
      Colors.brown,
      'lib/images/capuchin_monkey.png',
      'Primates Sanctuary',
    ],
    [
      'Mono Araña',
      950.0,
      Colors.black,
      'lib/images/spider_monkey.png',
      'Selva Protegida',
    ],
    [
      'Mono Ardilla',
      650.0,
      Colors.orange,
      'lib/images/squirrel_monkey.png',
      'Centro de Primates',
    ],
    [
      'Mono Tití',
      720.0,
      Colors.grey,
      'lib/images/marmoset_monkey.png',
      'Refugio Silvestre',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double aspectRatio =
            constraints.maxWidth < 400 ? 1 / 1.1 : 1 / 0.9;

        return GridView.builder(
          padding: const EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: aspectRatio,
          ),
          itemCount: monkeysAvailable.length,
          itemBuilder: (context, index) {
            final monkey = monkeysAvailable[index];

            return MonkeyTile(
              monkeyName: monkey[0],
              monkeyPrice: monkey[1].toString(),
              monkeyColor: monkey[2],
              monkeyImagePath: monkey[3],
              monkeyProvider: monkey[4],
              onAddToCart: () {
                final product = Product(
                  name: monkey[0],
                  price: monkey[1],
                  imagePath: monkey[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${monkey[0]} agregado al carrito'),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
