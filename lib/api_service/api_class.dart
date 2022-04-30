import 'package:dio/dio.dart';
import '../model/film.dart';

class ClassApi {
  static const String baseUrl = 'https://api.tvmaze.com/shows';

  static Future<List<Film>> getFilmList() async {
    List<Film> _list = [];

    //FIXME: use try catch
    var result = await Dio().get(baseUrl);

    //_list = (result.data as FilmResponse).getFilm;
    _list  = (result.data as List).map((e) => Film.fromJson(e)).toList();


    //debugPrint('**************');
    //debugPrint(_list.first.toString());

    return _list;
  }
}