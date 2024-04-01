import 'package:flutter/material.dart';

import 'main.dart';
import 'widgets/place_card.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key, required List<bool> isFavorite}) : _isFavorite = isFavorite;

  final List<bool> _isFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (_isFavorite[index]) {
                return PlaceCard(
                  backgroundImageUrl:
                      'https://source.unsplash.com/400x300/?${MyHomePage.intrestingPlaces[index]}',
                  placeName: MyHomePage.intrestingPlaces[index],
                  rating: MyHomePage.rating[index],
                  isFavorite: _isFavorite[index],
                  onFavoritePressed: null,
                );
              }
              return const SizedBox.shrink();
            },
            itemCount: MyHomePage.intrestingPlaces.length,
          ),
        ),
      ),
    );
  }
}
