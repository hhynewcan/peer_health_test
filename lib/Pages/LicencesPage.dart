import 'package:flutter/material.dart';

// This page will print out all licences involved in this app
class Licences extends StatefulWidget {
  @override
  State<Licences> createState() => _LicencesState();
}

class _LicencesState extends State<Licences> {
  @override
  Widget build(BuildContext context){
    return LicensePage(
      applicationVersion: '1.0.0',
      applicationIcon: Image.asset('assets/icons/BeWellLogoColour.png'),
      applicationName: 'USask Roadmap to Health',
    );
  }
}