import 'package:flutter/material.dart';

class BirdTile extends StatelessWidget {
  final String birdName;
  final String birdPrice;
  final Color birdColor;
  final String birdImagePath;
  final String birdProvider;
  final VoidCallback? onAddToCart;

  const BirdTile({
    super.key,
    required this.birdName,
    required this.birdPrice,
    required this.birdColor,
    required this.birdImagePath,
    required this.birdProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: birdColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Precio en esquina superior derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: birdColor.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 18,
                  ),
                  child: Text(
                    '\$$birdPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: birdColor,
                    ),
                  ),
                ),
              ],
            ),

            // Imagen centrada y responsiva
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 8,
                ),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1 / 1.5,
                    child: Image.asset(birdImagePath, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),

            // Especie del pájaro
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                birdName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Proveedor
            Text(
              birdProvider,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),

            // Parte inferior (corazón + botón Adoptar)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  TextButton(
                    onPressed: onAddToCart,
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.pink[600],
                    ),
                    child: const Text(
                      'Adoptar',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
