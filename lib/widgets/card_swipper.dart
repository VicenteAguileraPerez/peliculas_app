import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  CardSwiper({ @required this.movies});

 @override
 Widget build(BuildContext context)
 {
   final size = MediaQuery.of(context).size;
    if(this.movies.length==0)
    {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: Container(
          width: double.infinity,//ancho posible basado en el padre
          height: size.height*0.5,//depende del tamaño del device
          color: Colors.transparent,
          child: Center(child: CircularProgressIndicator())
        ),
      );
    }
    else{
      return Padding(
        padding: const EdgeInsets.symmetric(vertical:10.0),
        child: Container(
          width: double.infinity,//ancho posible basado en el padre
          height: size.height*0.5,//depende del tamaño del device
          color: Colors.transparent,
          child: Swiper(
            itemCount: movies.length,
            layout: SwiperLayout.STACK,
            itemWidth: size.width*0.6,
            itemHeight: size.height*0.7,
            itemBuilder:(BuildContext context, int index)//construcción dinamica o cuando sea necesario
            {
              final movie = movies[index];
              return GestureDetector(
                onTap:()=> Navigator.pushNamed(context, 'details',arguments: "movie-instance"),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder:  AssetImage('assets/no-image.jpg'),//NetworkImage('https://via.placeholder.com/300*400')
                      image: NetworkImage(movie.posterPathFull),
                      fit: BoxFit.cover
                  ),
                ),
              );
            },
          ),
        ),
      );
    }

 }
}

/*
class CardSwiper extends StatelessWidget {


 @override
 Widget build(BuildContext context)
 {
   final size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.symmetric(vertical:10.0),
    child: Container(
      width: double.infinity,//ancho posible basado en el padre
      height: size.height*0.5,//depende del tamaño del device
      color: Colors.transparent,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width*0.6,
        itemHeight: size.height*0.7,
        itemBuilder:(BuildContext context, int index)//construcción dinamica o cuando sea necesario
        {
          return GestureDetector(
            onTap:()=> Navigator.pushNamed(context, 'details',arguments: "movie-instance"),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder:  AssetImage('assets/no-image.jpg'),//NetworkImage('https://via.placeholder.com/300*400')
                  image: NetworkImage('https://via.placeholder.com/300x400'),
                  fit: BoxFit.cover
              ),
            ),
          );
        },
      ),
 ),
  );
 }
}
* */