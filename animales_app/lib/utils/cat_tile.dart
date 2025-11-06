import 'package:flutter/material.dart';

class CatTile extends StatelessWidget {
  final String catName;
  final String catPrice;
  final dynamic catColor;
  final String catImagePath;
  final String catProvider;
  final VoidCallback? onAddToCart;

  const CatTile({
    super.key,
    required this.catName,
    required this.catPrice,
    this.catColor,
    required this.catImagePath,
    required this.catProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: catColor[50],
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          children: [
            // Precio en esquina superior derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: catColor[100],
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
                    '\$$catPrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: catColor[800],
                    ),
                  ),
                ),
              ],
            ),

            // Imagen con tamaño controlado
            SizedBox(
              height: 120,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 36,
                  vertical: 12,
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(catImagePath, fit: BoxFit.contain),
                ),
              ),
            ),

            // Raza del gato
            Text(
              catName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // Refugio / proveedor
            Text(catProvider, style: TextStyle(color: Colors.grey[600])),

            // Icono favorito + botón Adoptar
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
