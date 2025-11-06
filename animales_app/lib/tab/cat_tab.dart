import 'package:flutter/material.dart';
import 'package:animales_app/utils/cat_tile.dart';
import 'package:animales_app/models/cart.dart';
import 'package:animales_app/models/product.dart';

class CatTab extends StatelessWidget {
  CatTab({super.key});

  // Lista de gatos disponibles para adopción
  final List<List<dynamic>> catsAvailable = [
    [
      'Gato Persa',
      250.0,
      Colors.brown,
      'lib/images/persian_cat.png',
      'Refugio Felino',
    ],
    [
      'Gato Siamés',
      220.0,
      Colors.blue,
      'lib/images/siamese_cat.png',
      'Adopta un Amigo',
    ],
    [
      'Gato Naranja',
      180.0,
      Colors.orange,
      'lib/images/orange_cat.png',
      'Gatitos Felices',
    ],
    [
      'Gato Blanco',
      200.0,
      Colors.grey,
      'lib/images/white_cat.png',
      'Hogar Animal',
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
          itemCount: catsAvailable.length,
          itemBuilder: (context, index) {
            final cat = catsAvailable[index];

            return CatTile(
              catName: cat[0],
              catPrice: cat[1].toString(),
              catColor: cat[2],
              catImagePath: cat[3],
              catProvider: cat[4],
              onAddToCart: () {
                final product = Product(
                  name: cat[0],
                  price: cat[1],
                  imagePath: cat[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${cat[0]} agregado al carrito'),
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
