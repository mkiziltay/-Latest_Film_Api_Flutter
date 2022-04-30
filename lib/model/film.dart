// To parse this JSON data, do
//  https://javiercbk.github.io/json_to_dart/
//     final film = filmFromMap(jsonString);

// ignore_for_file: prefer_void_to_null, unnecessary_question_mark, unnecessary_new, unnecessary_this, prefer_collection_literals

import 'package:intl/intl.dart'; //date-time library
/* Not required.
class FilmResponse {
  List<Film>? film;

  FilmResponse(List<Film>? film) {
    film = this.film;
  }

  List<Film>? get getFilm => this.film;

  set setFilm(List<Film>? film) => this.film = film;
}
*/
class Film {
  String? name;
  String? summary;
  int? updated;
  int? weight;
  Image? image;

  Film({
    this.name,
    this.summary,
    this.updated,
    this.weight,
    this.image,
  });
  //--------------------------------------------------------
  Film.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    summary = json['summary'];
    updated = json['updated'];
    weight = json['weight'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }
  ////-----------------------------------------------------

  String? get getName => this.name;

  set setName(String? name) => this.name = name;

  get getSummary => this.summary;

  set setSummary(summary) => this.summary = summary;

  get getUpdated => this.updated;

  set setUpdated(updated) => this.updated = updated;

  get getWeight => this.weight;

  set setWeight(weight) => this.weight = weight;

  get getImage => this.image;

  set setImage(image) => this.image = image;

  //for converting to string intance of Film class
  @override
  String toString() {
    return 'Film(name: $name, summary: $summary, updated: $updated, weight: $weight, image: $image)';
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('MM/dd/yyyy');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' Day ago';
      } else {
        time = diff.inDays.toString() + ' Days ago';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' week ago';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' week ago';
      }
    }

    return format.format(date);
  }
// trim big strings
  static String trimString(String str) {
    if (str.length >= 24) {
      str = str.replaceRange(20, str.length, '...');
    }

    return str;
  }
  // remove html tags
  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}

class Image {
  String? medium;
  String? original;

  Image({
    this.medium,
    this.original,
  });

  //---------------------------------------------
  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['original'] = this.original;
    return data;
  }
  ////-----------------------------------------------

  String? get getMedium => this.medium;

  set setMedium(String? medium) => this.medium = medium;

  get getOriginal => this.original;

  set setOriginal(original) => this.original = original;

  //for converting to string intance of Image class
  @override
  String toString() => 'Image(medium: $medium, original: $original)';
}