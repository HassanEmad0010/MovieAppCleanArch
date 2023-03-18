import 'package:clean_arch_moviee_app/mobile/Domain_Layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';

class NowPlayingUseCase{

  BaseMoviesRepository baseMoviesRepository;

  NowPlayingUseCase(this.baseMoviesRepository);

  Future<Either <Failure,List<Movie>>> executeNowPlaying() async{

    return await baseMoviesRepository.getNowPlayingMovies();
}


}
