import 'package:flutter/material.dart';

class FlightSearchPage extends StatefulWidget {
  @override
  _FlightSearchPageState createState() => _FlightSearchPageState();
}

class _FlightSearchPageState extends State<FlightSearchPage> {
  final _formKey = GlobalKey<FormState>();
  String _origin = '';
  String _destination = '';
  String _departureDate = '';
  String _returnDate = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar vuelos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Origen'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese el origen';
                  }
                  return null;
                },
                onSaved: (value) => _origin = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Destino'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese el destino';
                  }
                  return null;
                },
                onSaved: (value) => _destination = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha de salida'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese la fecha de salida';
                  }
                  return null;
                },
                onSaved: (value) => _departureDate = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Fecha de regreso'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, ingrese la fecha de regreso';
                  }
                  return null;
                },
                onSaved: (value) => _returnDate = value!,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Aquí puedes agregar la logica para buscar vuelos
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Vuelos encontrados')),
                    );
                  }
                },
                child: Text('Buscar vuelos'),
              ),
              ElevatedButton(
                onPressed: () {
                  _formKey.currentState!.reset();
                },
                child: Text('Limpiar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
