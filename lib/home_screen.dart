import 'dart:convert';

import 'package:al_najax_money_exchange/Album.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MainActivity"),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: FutureBuilder<Album>(
          future: fetchAlbum(),
          // ignore: missing_return
          builder: (context, snapshop) {
            if (snapshop.hasData) {
              final album=snapshop.data;
              return Text("userId: ${album.userId} \n id: ${album.id} \n title: ${album.title}", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,

                  fontSize: 20),
                  textAlign: TextAlign.center
              );
            } else if (snapshop.hasError) {
              return  Text(snapshop.error.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

Future<Album> fetchAlbum() async {
  final url = "https://jsonplaceholder.typicode.com/albums/1";
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final jsonUser = jsonDecode(response.body);

    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
