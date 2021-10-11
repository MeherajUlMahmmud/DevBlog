import 'package:flutter/material.dart';

class DeactivateAccountScreen extends StatefulWidget {

  @override
  _DeactivateAccountScreenState createState() => _DeactivateAccountScreenState();
}

class _DeactivateAccountScreenState extends State<DeactivateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deactivate Account'),
      ),
      body: Center(
        child: Text('Deactivate Account'),
      ),
    );
  }
}