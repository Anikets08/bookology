import 'package:flutter/material.dart';

const kAppName = 'Bookology';
const kAppStorage = 'bookology';
const kAppDescription = 'Read or listen to your favourite books on the go.';
const splashImage = 'assets/images/splash-image.png';
const splashBgImage = 'assets/images/splash-bg-img.jpeg';
var splashGradient = LinearGradient(
  colors: [
    Colors.black.withOpacity(0.9),
    Colors.black.withOpacity(0.85),
    Colors.black.withOpacity(0.8),
    Colors.black.withOpacity(0.4),
    Colors.black.withOpacity(0.3),
    Colors.black.withOpacity(0.2),
    Colors.transparent,
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
List<String> genreList = [
  "All",
  "Romance",
  "Mystery & Thriller",
  "Fantasy",
  "Science Fiction",
  "Horror",
  "History & Biography",
  "Middle Grade & Children's",
  "Fiction",
  "Debut Novel",
  "Young Adult Fiction",
];

const String dummyBookDescription =
    "euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc. Donec euismod, nisl eget aliquam ultricies, nunc nisl aliquet nunc, vitae aliquam nisl nisl ac nunc.";
