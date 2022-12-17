import 'package:flutter/material.dart';
import 'package:frontend/Pages/Regions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Republique du Mali'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Ajout d'une nouvelle région
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Le Mali', style: TextStyle(fontSize: 24.0)),
                  SizedBox(height: 4.0),
                  const Text(
                      'La République du Mali est un pays situé en Afrique de l\'Ouest. Il est bordé par l\'Algérie au nord, le Niger à l\'est, le Burkina Faso et la Côte d\'Ivoire au sud, la Guinée au sud-ouest, et le Sénégal et la Mauritanie à l\'ouest. Le Mali est un pays enclavé dont la superficie totale est d\'environ 1 241 238 km². Il est essentiellement désertique ou semi-aride, à l\'exception du fleuve Niger et de ses affluents, qui traversent le pays et permettent l\'irrigation de l\'agriculture. Le Mali a une population d\'environ 20 millions d\'habitants. La langue officielle est le français, mais de nombreuses personnes parlent également le bambara, une langue régionale. La majorité de la population est musulmane, avec une petite minorité chrétienne. '),
                  SizedBox(height: 4.0),
                  Image.asset(
                    'images/rectangle.png',
                    height: 150,
                    width: 5000,
                  )
                  // Image.network(
                  // 'https://pixabay.com/fr/photos/arbre-le-coucher-du-soleil-736885/'),
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: [
                for (var region in regions)
                  Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(region.name),
                        Text('Superficie: ${region.area} km²'),
                        Text('Population: ${region.population}'),
                        ButtonBar(
                          children: <Widget>[
                            TextButton(
                              child: Text('Détails'),
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  '/region-details',
                                  arguments: region,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
