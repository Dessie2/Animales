import 'package:flutter/material.dart';

class RabbitTile extends StatelessWidget {
  final String rabbitName;
  final String rabbitPrice;
  final dynamic rabbitColor;
  final String rabbitImagePath;
  final String rabbitProvider;
  final VoidCallback? onAddToCart;

  const RabbitTile({
    super.key,
    required this.rabbitName,
    required this.rabbitPrice,
    this.rabbitColor,
    required this.rabbitImagePath,
    required this.rabbitProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: (rabbitColor is MaterialColor)
              ? rabbitColor[50]
              : rabbitColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (rabbitColor is MaterialColor)
                        ? rabbitColor[100]
                        : rabbitColor.withOpacity(0.3),
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
                    '\$$rabbitPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: (rabbitColor is MaterialColor)
                          ? rabbitColor[800]
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // Imagen del conejo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Image.asset(
                rabbitImagePath,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),

            // Raza del conejo
            Text(
              rabbitName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Proveedor
            Text(rabbitProvider, style: TextStyle(color: Colors.grey[600])),

            // Botones
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  TextButton(
                    onPressed: onAddToCart,
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
