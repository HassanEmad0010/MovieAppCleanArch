import 'package:clean_arch_moviee_app/mobile/Domain_Layer/useCases/nowplaying_movie_usecase.dart';

import '../../mobile/Data_Layer/Data_Source/Remote_Data_Source.dart';
import '../../mobile/Data_Layer/repository/movie_repository.dart';
import '../../mobile/Domain_Layer/repository/base_movies_repository.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
GetIt getIt = GetIt.instance;


class ServiceLocator{
  void init(){

    ///DataSource
    getIt.registerLazySingleton<MovieBaseRemoteDataSource>(() =>MovieRemoteDataSource() );

    ///Repository
    getIt.registerLazySingleton<BaseMoviesRepository>(() =>MovieRepository(getIt())  );

    ///UseCases
    getIt.registerLazySingleton(() => NowPlayingUseCase(getIt()));




  }
}



