import 'package:flutter/material.dart';
import 'package:frontend/Pages/Regions.dart';
import 'package:http/http.dart' as http;

class UpdateRegionPage extends StatefulWidget {
  const UpdateRegionPage({Key? key}) : super(key: key);

  @override
  _UpdateRegionPageState createState() => _UpdateRegionPageState();
}

class _UpdateRegionPageState extends State<UpdateRegionPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late String _name;
  late String _geography;
  late String _culture;
  late int _area;
  late int _population;

  @override
  Widget build(BuildContext context) {
    final Region region = ModalRoute.of(context)?.settings.arguments as Region;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Modifier la région'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                initialValue: region.name,
                decoration: const InputDecoration(labelText: 'Nom'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer le nom de la région';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: region.geographie,
                decoration:
                    const InputDecoration(labelText: 'Situation géographique'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer la situation géographique de la région';
                  }
                  return null;
                },
                onSaved: (value) => _geography = value!,
              ),
              TextFormField(
                initialValue: region.culture,
                decoration:
                    const InputDecoration(labelText: 'Description culturelle'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer la description culturelle de la région';
                  }
                  return null;
                },
                onSaved: (value) => _culture = value!,
              ),
              TextFormField(
                initialValue: region.area.toString(),
                decoration:
                    const InputDecoration(labelText: 'Superficie (km²)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer la superficie de la région';
                  }
                  return null;
                },
                onSaved: (value) => _area = int.parse(value!),
              ),
              TextFormField(
                initialValue: region.population.toString(),
                decoration: const InputDecoration(labelText: 'Population'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Veuillez entrer la population de la région';
                  }
                  return null;
                },
                onSaved: (value) => _population = int.parse(value!),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                child: const Text('Modifier'),
                onPressed: () =>
                    Navigator.of(context).pop('Modifier avec succés !'),
                // onPressed: () {
                //   if (_formKey.currentState!.validate()) {
                //     _formKey.currentState!.save();

                //     // Send a PUT request to the server to update the region
                //     http.put('https://my-server.com/regions/${region.id}',
                //     body: {
                //       'name': _name,
                //       'geography': _geography,
                //       'culture': _culture,
                //       'area': _area,
                //       'population': _population,
                //     }).then(
                //       (response) {
                //         if (response.statusCode == 200) {
                //           // Region was successfully updated
                //           Navigator.of(context).pop();
                //         } else {
                //           // An error occurred, show an error message to the user
                //           _scaffoldKey.currentState.showSnackBar(const SnackBar(
                //             content: Text('Erreur lors de la modification de la région'),
                //           ));
                //         }
                //       },
                //     );
                //   }
                // },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
