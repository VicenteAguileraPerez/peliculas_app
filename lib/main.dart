import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'screens/screens.dart';
void main() {
  runApp(AppState());
}
//dE MANERA GLOBAL O LOCAL
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes:
      {
        'home': (_)=>HomeScreen(),
        'details':(_)=>DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          color: Colors.indigo
        )
      ),
    );
  }
}


class AppState extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
  return MultiProvider( providers: [
    ChangeNotifierProvider(create: (_)=>MoviesProvider(),lazy: false,),//tam pronto se crea el witget se manda llamar el provider y no hasta que se necesite
  ],
  child: MyApp(),
 );
 }
}
