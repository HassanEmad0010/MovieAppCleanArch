import 'package:clean_arch_moviee_app/mobile/Domain_Layer/entites/movie.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesRepository {

  Future<Either <Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either <Failure,List<Movie>>> getPopularPlayingMovies();
  Future<Either <Failure,List<Movie>>> getTopRatedMovies();




}