import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegionDetailsPage extends StatefulWidget {
  const RegionDetailsPage({super.key});

  @override
  _RegionDetailsPageState createState() => _RegionDetailsPageState();
}

class _RegionDetailsPageState extends State<RegionDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _email;
  late String _pseudo;
  late String _comment;

  @override
  Widget build(BuildContext context) {
    final Region region = ModalRoute.of(context)?.settings.arguments as Region;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(region.name),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Show a confirmation dialog to the user
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirmer la suppression'),
                    content: const Text(
                        'Voulez-vous vraiment supprimer cette région?'),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Oui'),
                        onPressed: () => 'Supprimer avec succés !',
                        // onPressed: () {
                        //   // Send a DELETE request to the server to delete the region
                        //   http.delete('https://my-server.com/regions/${region.id}').then(
                        //     (response) {
                        //       if (response.statusCode == 200) {
                        //         // Region was successfully deleted
                        //         Navigator.of(context).pop();
                        //         Navigator.of(context).pop();
                        //       } else {
                        //         // An error occurred, show an error message to the user
                        //         _scaffoldKey.currentState.showSnackBar(const SnackBar(
                        //           content: Text('Erreur lors de la suppression de la région'),
                        //         ));
                        //       }
                        //     },
                        //   );
                        // },
                      ),
                      ElevatedButton(
                        child: const Text('Non'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.update),
            onPressed: () {
              // Navigate to the update page
              Navigator.of(context)
                  .pushNamed('/update-region', arguments: region);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Situation géographique'),
              Text(region.geographie),
              const SizedBox(height: 8.0),
              const Text('Description culturelle'),
              Text(region.culture),
              const SizedBox(height: 8.0),
              Text('Superficie: ${region.area} km²'),
              Text('Population: ${region.population}'),
              const SizedBox(height: 8.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre email';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Pseudo'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre pseudo';
                  }
                  return null;
                },
                onSaved: (value) => _pseudo = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Commentaire'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer votre commentaire';
                  }
                  return null;
                },
                onSaved: (value) => _comment = value!,
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                child: const Text('Commenter'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Succès'),
                        content: const Text('Commentaire envoyé avec succès'),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );

                  // if (_formKey.currentState!.validate()) {
                  //   _formKey.currentState!.save();

                  //   // Envoi du commentaire au serveur web
                  //   http.post('https://mon-serveur.com/comment', body: {
                  //     'email': _email,
                  //     'pseudo': _pseudo,
                  //     'comment': _comment,
                  //   }).then(
                  //     (response) {
                  //       if (response.statusCode == 200) {
                  //         _scaffoldKey.currentState.showSnackBar(const SnackBar(
                  //           content: Text('Commentaire envoyé avec succès'),
                  //         ));
                  //       } else {
                  //         showDialog(
                  //           context: context,
                  //           builder:
                  //             (BuildContext context) {
                  //             return AlertDialog(
                  //               title: const Text('Erreur'),
                  //               content: Text(
                  //                   'Une erreur s\'est produite lors de l\'envoi du commentaire'),
                  //               actions: <Widget>[
                  //                 ElevatedButton(
                  //                   child: const Text('OK'),
                  //                   onPressed: () {
                  //                     Navigator.of(context).pop();
                  //                   },
                  //                 ),
                  //               ],
                  //             );
                  //           },
                  //         );
                  //       }
                  //     },
                  //   );
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Region {
  late final String name;
  final String geographie;
  final String culture;
  final int area;
  final int population;
  final Image image;

  Region({
    required this.name,
    required this.geographie,
    required this.culture,
    required this.area,
    required this.population,
    required this.image,
  });
}

final List<Region> regions = [
  Region(
    name: 'Région 1',
    geographie: 'Description de la situation géographique de la région 1',
    culture: 'Description de la culture de la région 1',
    area: 1000,
    population: 100000,
    image: Image.asset('images/rectangle.png'),
  ),
];
