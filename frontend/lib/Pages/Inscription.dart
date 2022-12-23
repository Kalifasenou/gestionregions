import 'package:flutter/material.dart';
import 'package:frontend/Connexion.dart';
import 'package:frontend/Pages/Accueil.dart';

class Inscription extends StatefulWidget {
  static String tag = 'inscription';

  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    final nom = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.person),
        labelText: 'Nom et prenoms',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.mail),
        labelText: 'Adresse mail ',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final number = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: const InputDecoration(
        icon: Icon(Icons.call),
        labelText: 'Numéro de telephone',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.lock),
        labelText: 'Mot de passe',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final conpass = TextFormField(
      autofocus: false,
      obscureText: true,
      decoration: const InputDecoration(
        icon: Icon(Icons.spellcheck),
        labelText: 'Confirmer Mot de passe',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Hero(
      tag: 'hero',
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
          //   style: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(8),
          //   ),
          onPressed: () => Connexion(),
          // padding: const EdgeInsets.all(12),
          // style: Colors.lightBlueAccent,
          child:
              const Text('S\'inscrire', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    Container(
      alignment: Alignment.topLeft,
      child: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.lightBlue,
          size: 25.0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Connexion(),
            ),
          );
        },
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.lightBlue,
                        size: 25.0,
                      ),
                      onPressed: () => Connexion(),
                    ),
                  ),
                  const SizedBox(width: 0.0),
                  const Text(
                    'Se connecter',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 20.0),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(left: 40.0, right: 40.0),
              children: <Widget>[
                const SizedBox(height: 24.0),
                nom,
                const SizedBox(height: 12.0),
                email,
                const SizedBox(height: 12.0),
                number,
                const SizedBox(height: 12.0),
                password,
                const SizedBox(height: 12.0),
                conpass,
                const SizedBox(height: 24.0),
                loginButton,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
