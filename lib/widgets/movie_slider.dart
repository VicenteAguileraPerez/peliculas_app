import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class MovieSlider extends StatelessWidget
{
  //final List<Movie> movies;
  final String title;
  //final Function onNextPage;

  const MovieSlider({
    Key key,
    //required this.movies,
    //required this.onNextPage,
    this.title,
  }) : super(key: key);
   @override
   Widget build(BuildContext context)
   {
      return Container(
        width: double.infinity,
        height: 300,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top:20,left: 15,bottom: 10 ),
              child:   Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ),

             Expanded(
               child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemBuilder: ( _,int index)=> _MoviePoster()
               ),
            ),


          ],
        ),
     );
   }


}
class _MoviePoster extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return  Container(
    width: 130,
    height: 260,
    color: Colors.transparent,
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, 'details',arguments: 'movie-instance'),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5,),
        Text("Starwars: El retorno del nuevo Jedi silvertre stalone",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        )
      ],
    ),
  );
 }
}