import 'package:clean_arch_moviee_app/core/utils/enums.dart';
import 'package:clean_arch_moviee_app/mobile/Presentation_Layer/controller/movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Data_Layer/Data_Source/Remote_Data_Source.dart';
import '../../Data_Layer/repository/movie_repository.dart';
import '../../Domain_Layer/repository/base_movies_repository.dart';
import '../../Domain_Layer/useCases/nowplaying_movie_usecase.dart';
import 'movie_events.dart';

class MoviesBloc extends Bloc<MovieEvents,MovieState>{
  final NowPlayingUseCase nowPlayingUseCase ;
  MoviesBloc(this.nowPlayingUseCase): super(const MovieState()) {
    on<GetNowPlayingEvent>((event, emit) async {
      print("state is $state");



      final result = await nowPlayingUseCase.executeNowPlaying();
      result.fold((l) => emit(MovieState(nowPlayingMessage: l.message,nowPlayingState: RequestedState.error))
          , (r) => emit(MovieState(nowPlayingMovies: r,nowPlayingState: RequestedState.isLoaded))
      );
      print("state is $state");
    });

    on<GetPopularEvent> ( (event,emit)async {

    }


    );
  }
  }



