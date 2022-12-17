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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('Situation géographique'),
              Text(region.geography),
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
                  //         _scaffoldKey.currentState.showSnackBar(
                  //           const SnackBar(
                  //             content: Text(
                  //                 'Erreur lors de l\'envoi du commentaire'),
                  //           ),
                  //         );
                  //       }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// RaisedButton(
//   child: const Text('Envoyer'),
//   onPressed: () {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();

//       // Envoi du commentaire au serveur web
//       http.post('https://mon-serveur.com/comment', body: {
//         'email': _email,
//         'pseudo': _pseudo,
//         'comment': _comment,
//       }).then((response) {
//         if (response.statusCode == 200) {
//           _scaffoldKey.currentState.showSnackBar(const SnackBar(
//             content: Text('Commentaire envoyé avec succès'),
//           ));
//         } else {
//           _scaffoldKey.currentState.showSnackBar(const SnackBar(
//             content:
//                 Text('Erreur lors de l\'envoi du commentaire'),
//           ));
//         }
//       });
//     }
//   },
// ),

class Region {
  late final String name;
  final String geography;
  final String culture;
  final int area;
  final int population;

  Region({
    required this.name,
    required this.geography,
    required this.culture,
    required this.area,
    required this.population,
  });
}

final List<Region> regions = [
  Region(
    name: 'Région 1',
    geography: 'Description de la situation géographique de la région 1',
    culture: 'Description de la culture de la région 1',
    area: 1000,
    population: 100000,
  ),
  Region(
    name: 'Région 2',
    geography: 'Description de la situation géographique de la région 2',
    culture: 'Description de la culture de la région 2',
    area: 2000,
    population: 200000,
  ),
  Region(
    name: 'Région 3',
    geography: 'Description de la situation géographique de la région 3',
    culture: 'Description de la culture de la région 3',
    area: 3000,
    population: 300000,
  ),
  Region(
    name: 'Région 4',
    geography: 'Description de la situation géographique de la région 4',
    culture: 'Description de la culture de la région 4',
    area: 4000,
    population: 400000,
  ),
  Region(
    name: 'Région 5',
    geography: 'Description de la situation géographique de la région 5',
    culture: 'Description de la culture de la région 5',
    area: 5000,
    population: 500000,
  ),
];
