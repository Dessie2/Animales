import 'package:flutter/material.dart';

class MonkeyTile extends StatelessWidget {
  final String monkeyName;
  final String monkeyPrice;
  final dynamic monkeyColor;
  final String monkeyImagePath;
  final String monkeyProvider;
  final VoidCallback? onAddToCart;

  const MonkeyTile({
    super.key,
    required this.monkeyName,
    required this.monkeyPrice,
    this.monkeyColor,
    required this.monkeyImagePath,
    required this.monkeyProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: (monkeyColor is MaterialColor)
              ? monkeyColor[50]
              : monkeyColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: (monkeyColor is MaterialColor)
                        ? monkeyColor[100]
                        : monkeyColor.withOpacity(0.2),
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
                    '\$$monkeyPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: (monkeyColor is MaterialColor)
                          ? monkeyColor[800]
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            // imagen ajustada
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Image.asset(
                monkeyImagePath,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),

            // nombre
            Text(
              monkeyName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // proveedor
            Text(monkeyProvider, style: TextStyle(color: Colors.grey[600])),

            // botones
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
