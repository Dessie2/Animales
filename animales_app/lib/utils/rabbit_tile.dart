import 'package:flutter/material.dart';

class RabbitTile extends StatelessWidget {
  final String rabbitName;
  final String rabbitPrice;
  final Color rabbitColor;
  final String rabbitImagePath;
  final String rabbitProvider;
  final VoidCallback? onAddToCart;

  const RabbitTile({
    super.key,
    required this.rabbitName,
    required this.rabbitPrice,
    required this.rabbitColor,
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
          color: rabbitColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 💲 Precio en esquina superior derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: rabbitColor.withOpacity(0.2),
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
                      color: rabbitColor,
                    ),
                  ),
                ),
              ],
            ),

            // 🐇 Imagen centrada y responsiva
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
                    child: Image.asset(rabbitImagePath, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),

            // 🐰 Nombre del conejo
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                rabbitName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // 🏡 Proveedor
            Text(
              rabbitProvider,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),

            // ❤️ Parte inferior (corazón + botón Adoptar)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.favorite, color: Colors.pink[400]),
                  TextButton(
                    onPressed:
                        onAddToCart ??
                        () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$rabbitName agregado al carrito'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
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
