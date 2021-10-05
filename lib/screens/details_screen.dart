import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/casting_cards.dart';
class DetailsScreen extends StatelessWidget
{


   @override
   Widget build(BuildContext context)
   {
     //TODO: Cambiar por una instancia de movie
     final String movie = ModalRoute.of(context).settings.arguments.toString()??"no-movie";
    return Scaffold(
      //recibe unos slivers  hace lo mismo que el silver scroll
      //los slivers son no son mas que widgets que tienen cierto comportamiento
      // preprogramado cuando se hace scroll en el contenido del padre
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(delegate: SliverChildListDelegate([
            _PosterAndTitle(),
            _OverView(),
            _OverView(),
            CastingCards(),
          ]))
        ],
      )

   );
 }
}
class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 18),
            color: Colors.black12,
            alignment: Alignment.bottomCenter,
            child: Text("movie.title",style: TextStyle(fontSize: 20),)
          ,),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),//

    );
  }
}
class _PosterAndTitle extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     final TextTheme textTheme =Theme.of(context).textTheme;
      return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/200x300'),
                height: 150,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Movie.title",
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,),
              Text("Movie.originalTitle",
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,),
                Row(
                  children: [
                    Icon(Icons.star_outline,size:15,color: Colors.grey,),
                    SizedBox(width: 5,),
                    Text("movie.voteAverage",style: textTheme.caption,)
                  ],
                )
            ],)
          ],
        ) ,
     );
   }
}
class _OverView extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
        ),
     );
   }
}