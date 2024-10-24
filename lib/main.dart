import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Para decodificar las respuestas JSON

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String apiUrl = 'http://192.168.0.112:8082';

  // Función para mostrar notificaciones
  void showNotification(BuildContext context, String message, bool isError) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isError ? Colors.red : Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Función para encender
  Future<void> encender() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/prender'),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        showNotification(
            context, responseBody['message'], false); // Notificación de éxito
      } else {
        showNotification(
            context, "Error al encender la luz", true); // Notificación de error
      }
    } catch (e) {
      showNotification(
          context, "No se pudo conectar a la API", true); // Notificación de error de conexión
    }
  }

  // Función para apagar
  Future<void> apagar() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/apagar'),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        showNotification(
            context, responseBody['message'], false); // Notificación de éxito
      } else {
        showNotification(
            context, "Error al apagar la luz", true); // Notificación de error
      }
    } catch (e) {
      showNotification(
          context, "No se pudo conectar a la API", true); // Notificación de error de conexión
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Control')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: encender,
              child: Text('Encender'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: apagar,
              child: Text('Apagar'),
            ),
          ],
        ),
      ),
    );
  }
}
