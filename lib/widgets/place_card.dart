import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final String backgroundImageUrl;
  final String placeName;
  final double rating;
  final bool isFavorite;
  final Function(bool)? onFavoritePressed;

  const PlaceCard({
    Key? key,
    required this.backgroundImageUrl,
    required this.placeName,
    required this.rating,
    required this.isFavorite,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderImage(
            imageUrl: backgroundImageUrl,
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  placeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 5),
                RatingBar(rating: rating),
                const SizedBox(height: 10),
                onFavoritePressed != null
                    ? ElevatedButton(
                        onPressed: () {
                          onFavoritePressed!(!isFavorite);
                        },
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : Colors.red[100],
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;

  const RatingBar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.yellow),
        const SizedBox(width: 5),
        Text(
          rating.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class HeaderImage extends StatelessWidget {
  final String imageUrl;

  const HeaderImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
        height: 150,
      ),
    );
  }
}
