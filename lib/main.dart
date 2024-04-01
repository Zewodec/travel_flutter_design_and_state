import 'package:flutter/material.dart';
import 'package:travel_flutter_design_and_state/widgets/place_card.dart';

import 'favourites_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aspen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const List<String> intrestingPlaces = <String>[
    'Paris',
    'New York',
    'London',
    'Tokyo',
    'Sydney',
    'Dubai',
    'Rome',
    'Barcelona',
    'Istanbul',
    'Cape Town',
  ];

  static const List<double> rating = <double>[
    4.5,
    4.8,
    4.3,
    4.7,
    4.6,
    4.9,
    4.4,
    4.7,
    4.5,
    4.8,
  ];

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;

  final List<bool> _isFavorite = <bool>[
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
    false,
    true,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Aspen'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PlaceCard(
                  backgroundImageUrl:
                      'https://source.unsplash.com/400x300/?${MyHomePage.intrestingPlaces[index]}',
                  placeName: MyHomePage.intrestingPlaces[index],
                  rating: MyHomePage.rating[index],
                  isFavorite: _isFavorite[index],
                  onFavoritePressed: (isFavorite) {
                    setState(() {
                      _isFavorite[index] = isFavorite;
                    });
                  },
                );
              },
              itemCount: MyHomePage.intrestingPlaces.length,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentPageIndex,
          onTap: (index) {
            switch (index) {
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavouritesPage(
                      isFavorite: _isFavorite,
                    ),
                  ),
                );
                break;
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
        ));
  }
}
