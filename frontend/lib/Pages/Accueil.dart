import 'package:flutter/material.dart';
import 'package:frontend/Pages/Regions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String AjoutNRegion(String name, int area, int population) {
    //Bouton d'ajout d'une nouvelle region
    regions.add(
      Region(
        name: name,
        area: area,
        population: population,
        culture: 'culture',
        geographie: '1254845',
        image: Image.asset('images/rectangle.png'),
      ),
    );
    return 'Nouvelle région ajouté avec succés';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Republique du Mali'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Ajout d'une nouvelle région
              AjoutNRegion('Region name', 1000, 100000);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                height: 200,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/rectangle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Text(
                  'La République du Mali est un pays situé en Afrique de l\'Ouest. Il est bordé par l\'Algérie au nord, le Niger à l\'est, le Burkina Faso et la Côte d\'Ivoire au sud, la Guinée au sud-ouest, et le Sénégal et la Mauritanie à l\'ouest. Le Mali est un pays enclavé dont la superficie totale est d\'environ 1 241 238 km². Il est essentiellement désertique ou semi-aride, à l\'exception du fleuve Niger et de ses affluents, qui traversent le pays et permettent l\'irrigation de l\'agriculture. Le Mali a une population d\'environ 20 millions d\'habitants. La langue officielle est le français, mais de nombreuses personnes parlent également le bambara, une langue régionale. La majorité de la population est musulmane, avec une petite minorité chrétienne.',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.justify,
                ),
              );

              // return Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         const Text('Le Mali', style: TextStyle(fontSize: 24.0)),
              //         const SizedBox(height: 8.0),
              //         const Text(
              //           'La République du Mali est un pays situé en Afrique de l\'Ouest. Il est bordé par l\'Algérie au nord, le Niger à l\'est, le Burkina Faso et la Côte d\'Ivoire au sud, la Guinée au sud-ouest, et le Sénégal et la Mauritanie à l\'ouest. Le Mali est un pays enclavé dont la superficie totale est d\'environ 1 241 238 km². Il est essentiellement désertique ou semi-aride, à l\'exception du fleuve Niger et de ses affluents, qui traversent le pays et permettent l\'irrigation de l\'agriculture. Le Mali a une population d\'environ 20 millions d\'habitants. La langue officielle est le français, mais de nombreuses personnes parlent également le bambara, une langue régionale. La majorité de la population est musulmane, avec une petite minorité chrétienne. ',
              //           style: TextStyle(fontSize: 14.0),
              //           textAlign: TextAlign.justify,
              //         ),
              //         const SizedBox(height: 8.0),
              //         Container(
              //           height: 200,
              //           width: constraints.maxWidth,
              //           decoration: const BoxDecoration(
              //             image: DecorationImage(
              //               image: AssetImage('images/rectangle.png'),
              //               fit: BoxFit.fill,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // );
            },
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
