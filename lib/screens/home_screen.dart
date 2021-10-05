import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
class HomeScreen extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context,listen: true);//listen dice redibuja cuando haya una modificacion
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en Cines"),
        elevation: 0,
        actions: [IconButton(
          icon: Icon( Icons.search_outlined),
          onPressed: (){},
        )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //CardSwiper
            CardSwiper(movies: movieProvider.onDisyplayMovies),//https://pub.dev/packages/card_swiper

            //Listado horizontal de peliculas
            MovieSlider(title: "Populares",),
            MovieSlider(title:"Acción"),
            MovieSlider(title:"Terror"),

          ],
        ),
      ),

    );
  }
}