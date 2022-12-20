// To create a web application in Flutter that has a homepage with a description of a country, an image in the background, and a list of regions of the country in a grid with a name, area, population size, and a description, you can follow these steps:
//     Create a new Flutter web project.
//     Create a Country model class that contains the properties you want to display on the homepage, such as the name, description, and image.
//     Create a Region model class that contains the properties you want to display for each region, such as the name, area, population size, and description.
//     Create a RegionDetails page that will display the details of a specific region. This page should have fields for the user to enter their email, username, and comment.
//     In the homepage, display the country's description and image using a Container widget and the BoxDecoration class.
//     Use a GridView widget to display a grid of Card widgets, each representing a region. In each card, display the name, area, population size, and description for the region.
//     Use the onTap property of the Card widget to navigate to the RegionDetails page when a card is tapped. Pass the region object to the RegionDetails page using the Navigator class.
//     In the RegionDetails page, display the region's details using a combination of Container, Text, and Image widgets.
//     Use a Form widget to allow the user to enter their email, username, and comment. Validate the form using the Validator class and save the user's comment to a database or file when the form is submitted.

// I hope this helps! Let me know if you have any questions or need further assistance.
import 'package:flutter/material.dart';
import 'package:frontend/Connexion.dart';
import 'package:frontend/Pages/Accueil.dart';
import 'package:frontend/Pages/Regions.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Régions d\'un Pays',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Connexion(),
      routes: {
        '/accueil': (context) => const HomePage(),
        '/region-details': (context) => const RegionDetailsPage(),
      },
    );
  }
}
