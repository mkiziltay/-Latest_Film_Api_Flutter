import 'package:flutter/material.dart';
import 'package:latest_film_api/api_service/api_class.dart';
import 'constants/constants.dart';
import 'model/film.dart';
import 'widgets/child_cardstyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Film Api',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<List<Film>> _filmList = ClassApi.getFilmList();

  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClassApi.getFilmList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        centerTitle: true,
        elevation: 4,
      ),
      body: FutureBuilder<List<Film>>(
        future: _filmList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Film> _films = snapshot.data!;

            return ListView.builder(
                itemCount: _films.length,
                itemBuilder: (context, index) {
                  var currentFilm = _films[index];
                  return ChildCardStyle(
                      title: Film.trimString(currentFilm.name.toString()),
                      subtitle: Film.readTimestamp(currentFilm.getUpdated),
                      details: Film.removeAllHtmlTags(currentFilm.summary!),
                      rating: currentFilm.getWeight.toString(),
                      originalImg: currentFilm.image!.getOriginal! ,
                      imageurl: currentFilm.image!.getMedium!);
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Hata Oluştu'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
