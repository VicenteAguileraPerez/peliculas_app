//proveedor de info

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';

class MoviesProvider with  ChangeNotifier, DiagnosticableTreeMixin
{
  String _PATHBASE ='api.themoviedb.org';
  String _APIKEY = '0af3f4ba653ebf8e87240702285eaf50';
  String _LANGUAGE = 'es-ES';


  List<Movie> onDisyplayMovies = [];


  MoviesProvider()
  {
    print("Inicializando proveedor");
    this.getOnDisplayMovies();
  }
  getOnDisplayMovies() async
  {
      var url = Uri.https(_PATHBASE, '3/movie/now_playing',
          {
            'api_key': _APIKEY,
            'language':_LANGUAGE,
            'page':'1'
          });
      print("getOnDisplayMovies");
      // Await the http get response, then decode the json-formatted response.
      var response = await http.get(url);
      if (response.statusCode == 200)
      {

       // var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        //var itemCount = jsonResponse['results'];
        //print('Number of books about http: $jsonResponse.');
        //print('Number of books about http: $itemCount.');
        final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
        onDisyplayMovies = nowPlayingResponse.results;
        notifyListeners();//para notificar el cambio
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
  }
}