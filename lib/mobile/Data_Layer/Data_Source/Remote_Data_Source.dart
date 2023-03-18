import 'package:clean_arch_moviee_app/core/error/Exceptions.dart';
import 'package:dio/dio.dart';

import '../../../core/network/API_constats.dart';
import '../../../core/network/error_message_model.dart';
import '../Model/Movie_Model.dart';

abstract class MovieBaseRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingData();

  Future<List<MovieModel>> getTopRatedData();

  Future<List<MovieModel>> getPopularData();
}

class MovieRemoteDataSource extends MovieBaseRemoteDataSource {
  Dio dio = Dio();

  @override
  Future<List<MovieModel>> getNowPlayingData() async {
    //List<MovieModel> retNowList = [];

    final response = await dio.get(nowPlayingURL);
    print("From DataSource, The response code is ${response.statusCode}");

    if (response.statusCode == 200) {
      print("From DataSource, Correct response code is ${response.statusCode}");
      //print ("response is "+response.data["results"].toString());
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJsonNamedConstructor(e)));
      //return list of MovieModel from the response of data, results, will return list of objects, looping on objects by mapping
    }

    else {
      print("error code is ${response.statusCode}");
      throw ServerException(
          errorMessageModel:
          (ErrorMessageModel.fromJsonConstructor(response.data)));
    }
  }

  @override
  Future<List<MovieModel>> getPopularData() async {
    var response = await dio.get(popularURL);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data as List).map((e) =>
          MovieModel.fromJsonNamedConstructor(e)));
    }
    else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJsonConstructor(
              response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedData() async {
    var response = await dio.get(topRatedURL);
    if (response.statusCode == 200) {
      return List.from((response.data as List).map((e) =>
          MovieModel.fromJsonNamedConstructor(e)));
    }
    else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJsonConstructor(
              response.data));
    }
  }
}
