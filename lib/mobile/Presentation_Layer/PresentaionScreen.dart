import 'package:clean_arch_moviee_app/mobile/Data_Layer/Data_Source/Remote_Data_Source.dart';
import 'package:clean_arch_moviee_app/mobile/Data_Layer/repository/movie_repository.dart';
import 'package:clean_arch_moviee_app/mobile/Domain_Layer/repository/base_movies_repository.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';

import '../../core/error/failure.dart';
import '../Data_Layer/Model/Movie_Model.dart';
import '../Domain_Layer/entites/movie.dart';
import '../Domain_Layer/useCases/nowplaying_movie_usecase.dart';

class PresentaionScreen extends StatefulWidget{
  @override
  State<PresentaionScreen> createState() => _PresentaionScreenState();
}

class _PresentaionScreenState extends State<PresentaionScreen> {
   List<Movie> movieList=[];
   Failure serverFailure= ServerFailure("messag_server");
   Failure databaseFailure= ServerFailure("message_DB");

  @override
  void initState() {
    //super.initState();


  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
           appBar: AppBar(

             title: IconButton(icon:Icon(Icons.ac_unit) ,onPressed: ()async{
               print("icon pressed");

                 MovieBaseRemoteDataSource movieBaseRemoteDataSource=MovieRemoteDataSource();
                 BaseMoviesRepository baseMoviesRepository= MovieRepository(movieBaseRemoteDataSource);
           // final result= await NowPlayingUseCase(baseMoviesRepository).executeNowPlaying();
               //
             NowPlayingUseCase nowPlayingUseCase=NowPlayingUseCase(baseMoviesRepository);
               final result= await nowPlayingUseCase.executeNowPlaying();
               //
                 result.fold((l) {
                   //faliure not working well
                   print("result from presentation is $result");
                 return serverFailure;
                 }, (r) =>
                 movieList=r,
                 );
               print("result from presentation is $result");

               setState(()  { });

             }),
           ),

     body: Center(
       child: Container(
         color: Colors.amber,
         child: MaterialButton(onPressed: (){
           print("diplay pressed");
          if( movieList.isNotEmpty) {
            print("Data in the list of Movies is:");

            for (Movie movie in movieList) {
              print(movie.title);
            }

          }
          else{
            print("No data in the list of Movies");
          }
         }
         ,child:Text("Display Data from List") ,
         ),

       ),
     )


   );


  }
}