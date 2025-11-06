import 'package:flutter/material.dart';
import 'package:animales_app/utils/bird_tile.dart';
import 'package:animales_app/models/cart.dart';
import 'package:animales_app/models/product.dart';

class BirdTab extends StatelessWidget {
  BirdTab({super.key});

  // Lista de pájaros disponibles para adopción
  final List<List<dynamic>> birdsAvailable = [
    [
      'Loro Amazónico',
      350.0,
      Colors.green,
      'lib/images/amazon_parrot.png',
      'Aves Exóticas',
    ],
    [
      'Canario Amarillo',
      120.0,
      Colors.yellow,
      'lib/images/yellow_canary.png',
      'Pájaros Cantores',
    ],
    [
      'Periquito Azul',
      95.0,
      Colors.blue,
      'lib/images/blue_parakeet.png',
      'Aves del Paraíso',
    ],
    [
      'Cacatúa Blanca',
      450.0,
      Colors.grey,
      'lib/images/white_cockatoo.png',
      'Refugio de Aves',
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
          itemCount: birdsAvailable.length,
          itemBuilder: (context, index) {
            final bird = birdsAvailable[index];

            return BirdTile(
              birdName: bird[0],
              birdPrice: bird[1].toString(),
              birdColor: bird[2],
              birdImagePath: bird[3],
              birdProvider: bird[4],
              onAddToCart: () {
                final product = Product(
                  name: bird[0],
                  price: bird[1],
                  imagePath: bird[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${bird[0]} agregado al carrito'),
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
