import 'package:flutter/material.dart';
import 'package:animales_app/utils/cattle_tile.dart';
import 'package:animales_app/models/cart.dart';
import 'package:animales_app/models/product.dart';

class CattleTab extends StatelessWidget {
  const CattleTab({super.key});

  // Lista de reses disponibles para adopción
  final List<List<dynamic>> cattleAvailable = const [
    [
      'Vaca Holstein',
      1500.0,
      Colors.black,
      'lib/images/holstein_cow.png',
      'Granja El Prado',
    ],
    [
      'Vaca Jersey',
      1350.0,
      Color(0xFF8B4513), // marrón realista
      'lib/images/jersey_cow.png',
      'Rancho Verde',
    ],
    [
      'Toro Angus',
      2000.0,
      Color(0xFF2F4F4F), // gris oscuro realista
      'lib/images/angus_bull.png',
      'Hacienda Los Robles',
    ],
    [
      'Ternero Hereford',
      1200.0,
      Color(0xFFB22222), // rojo terroso
      'lib/images/hereford_calf.png',
      'Finca La Esperanza',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Relación de aspecto adaptable según el ancho
        final double aspectRatio = constraints.maxWidth < 400
            ? 1 / 1.15
            : 1 / 0.95;

        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // dos columnas
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: aspectRatio,
          ),
          itemCount: cattleAvailable.length,
          itemBuilder: (context, index) {
            final cattle = cattleAvailable[index];

            return CattleTile(
              cattleName: cattle[0],
              cattlePrice: cattle[1].toString(),
              cattleColor: cattle[2],
              cattleImagePath: cattle[3],
              cattleProvider: cattle[4],
              onAddToCart: () {
                final product = Product(
                  name: cattle[0],
                  price: cattle[1],
                  imagePath: cattle[3],
                );

                Cart.addItem(product);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${cattle[0]} agregado al carrito'),
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
