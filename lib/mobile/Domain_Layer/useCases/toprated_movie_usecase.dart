import 'package:clean_arch_moviee_app/mobile/Domain_Layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';

class TopRatedPlayingUseCase{

  BaseMoviesRepository baseMoviesRepository;

  TopRatedPlayingUseCase(this.baseMoviesRepository);

  Future<Either <Failure,List<Movie>>> executeTopRated() async{

    return await baseMoviesRepository.getTopRatedMovies();
  }


}
