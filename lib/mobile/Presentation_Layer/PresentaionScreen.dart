
import 'package:clean_arch_moviee_app/core/services/services_locator.dart';
import 'package:clean_arch_moviee_app/mobile/Domain_Layer/useCases/nowplaying_movie_usecase.dart';
import 'package:clean_arch_moviee_app/mobile/Presentation_Layer/controller/movies_bloc.dart';
import 'package:clean_arch_moviee_app/mobile/Presentation_Layer/controller/movies_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'controller/movie_events.dart';

class PresentaionScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

     return BlocProvider(

    // lazy: false,
     create: (context) {
       return MoviesBloc(getIt())..add(GetNowPlayingEvent ());
     },
     child: BlocBuilder<MoviesBloc,MovieState>(
       builder: (context,state)=>
        Scaffold(
       ),
     ),
   );


  }
}