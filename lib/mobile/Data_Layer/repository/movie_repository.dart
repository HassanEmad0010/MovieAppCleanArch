import 'package:clean_arch_moviee_app/core/error/Exceptions.dart';
import 'package:clean_arch_moviee_app/mobile/Data_Layer/Data_Source/Remote_Data_Source.dart';
import 'package:clean_arch_moviee_app/mobile/Domain_Layer/entites/movie.dart';
import 'package:clean_arch_moviee_app/mobile/Domain_Layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';

class MovieRepository implements BaseMoviesRepository{
  final MovieBaseRemoteDataSource movieBaseRemoteDataSource;

  MovieRepository(this.movieBaseRemoteDataSource);

  @override
  Future<Either <Failure,List<Movie>>> getNowPlayingMovies() async {
    try {
      final result= await movieBaseRemoteDataSource.getNowPlayingData();
      return Right(result);
    }
    on ServerException catch(failure)
    {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularPlayingMovies() {
    // TODO: implement getPopularPlayingMovies
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }





}