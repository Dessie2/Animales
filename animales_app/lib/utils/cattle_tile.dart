import 'package:flutter/material.dart';

class CattleTile extends StatelessWidget {
  final String cattleName;
  final String cattlePrice;
  final dynamic cattleColor;
  final String cattleImagePath;
  final String cattleProvider;
  final VoidCallback? onAddToCart;

  const CattleTile({
    super.key,
    required this.cattleName,
    required this.cattlePrice,
    this.cattleColor,
    required this.cattleImagePath,
    required this.cattleProvider,
    this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    // 📏 Tamaño de pantalla
    final screenWidth = MediaQuery.of(context).size.width;

    // 🖼️ Tamaño dinámico de imagen (proporcional al ancho de pantalla)
    final double imageWidth = screenWidth * 0.5; // 50% del ancho
    final double imageHeight = imageWidth * 0.8; // mantiene proporción

    // ✅ Colores seguros (si cattleColor no es MaterialColor)
    final Color baseColor = (cattleColor is MaterialColor)
        ? cattleColor.shade50
        : (cattleColor as Color).withOpacity(0.1);

    final Color accentColor = (cattleColor is MaterialColor)
        ? cattleColor.shade100
        : (cattleColor as Color).withOpacity(0.2);

    final Color textColor = (cattleColor is MaterialColor)
        ? cattleColor.shade800
        : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: baseColor,
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Column(
          children: [
            // 💲 Precio
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: accentColor,
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
                    '\$$cattlePrice',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),

            // 🐄 Imagen (responsiva)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
              child: Image.asset(
                cattleImagePath,
                width: imageWidth.clamp(100, 250), // entre 100 y 250 px
                height: imageHeight.clamp(80, 200),
                fit: BoxFit.contain,
              ),
            ),

            // 🐮 Raza
            Text(
              cattleName,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // 🚜 Proveedor
            Text(cattleProvider, style: TextStyle(color: Colors.grey[600])),

            // ❤️ Botones
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
                              content: Text('$cattleName agregado al carrito'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
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
