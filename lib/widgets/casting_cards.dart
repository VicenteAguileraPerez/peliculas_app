import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        height: 200,
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: 30),
        child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context,int index)=>_CastingCard()
            ),
     );
   }
}
class _CastingCard extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Container(
       width: 110,
       height:100,
       color: Colors.transparent,
       margin: EdgeInsets.all(10),
       child: Column(
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(20),
             child: FadeInImage(
               placeholder: AssetImage('assets/no-image.jpg'),
               image: NetworkImage('https://via.placeholder.com/300x400'),
               width: 100,
               height: 140,
               fit: BoxFit.cover,
             ),
           ),
           SizedBox(height: 5,),
           Text("actor.name hahahhaha",
             overflow: TextOverflow.ellipsis,
             maxLines: 2,
             textAlign: TextAlign.center,
           )
         ],
       ),
     );
   }
}