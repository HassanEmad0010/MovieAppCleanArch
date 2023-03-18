import 'package:clean_arch_moviee_app/mobile/Domain_Layer/entites/movie.dart';

class MovieModel extends Movie{
  MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAvg,
    required super.generIds});


  factory MovieModel.fromJsonNamedConstructor( Map<String,dynamic> jsonData ){
    return MovieModel(
        id: jsonData["id"],
        title: jsonData["title"] ,
        backdropPath: jsonData["backdrop_path"],
        overview: jsonData["overview"],
        voteAvg: jsonData["vote_average"].toDouble(),
        generIds: List<int>.from(jsonData["genre_ids"].map((e) => e)) ); //because its list

  }

}