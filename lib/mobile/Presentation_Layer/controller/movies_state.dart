

import 'package:clean_arch_moviee_app/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import '../../Domain_Layer/entites/movie.dart';

class MovieState extends Equatable{

  final List<Movie> nowPlayingMovies;
  final RequestedState nowPlayingState;
  final String nowPlayingMessage;

  const MovieState({
    this.nowPlayingState=RequestedState.isLoading,
    this.nowPlayingMovies=const [],
    this.nowPlayingMessage='',
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    nowPlayingMovies,nowPlayingState,nowPlayingMessage
  ];
  




}