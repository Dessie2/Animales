import 'package:flutter/material.dart';
import 'package:animales_app/utils/rabbit_tile.dart';
import 'package:animales_app/models/cart.dart';
import 'package:animales_app/models/product.dart';

class RabbitTab extends StatelessWidget {
  RabbitTab({super.key});

  // Lista de conejos disponibles para adopción
  final List<List<dynamic>> rabbitsAvailable = [
    [
      'Conejo Holandés',
      150.0,
      Colors.black,
      'lib/images/dutch_rabbit.png',
      'Conejera Feliz',
    ],
    [
      'Conejo Angora',
      180.0,
      Colors.white,
      'lib/images/angora_rabbit.png',
      'Refugio de Conejos',
    ],
    [
      'Conejo Rex',
      160.0,
      Colors.brown,
      'lib/images/rex_rabbit.png',
      'Hogar Conejil',
    ],
    [
      'Conejo Belier',
      170.0,
      Colors.grey,
      'lib/images/lop_rabbit.png',
      'Adopta un Conejito',
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
          itemCount: rabbitsAvailable.length,
          itemBuilder: (context, index) {
            final rabbit = rabbitsAvailable[index];

            return RabbitTile(
              rabbitName: rabbit[0],
              rabbitPrice: rabbit[1].toString(),
              rabbitColor: rabbit[2],
              rabbitImagePath: rabbit[3],
              rabbitProvider: rabbit[4],
              onAddToCart: () {
                final product = Product(
                  name: rabbit[0],
                  price: rabbit[1],
                  imagePath: rabbit[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${rabbit[0]} agregado al carrito'),
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
