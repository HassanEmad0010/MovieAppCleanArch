import 'package:clean_arch_moviee_app/core/error/failure.dart';

import '../network/error_message_model.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

 const ServerException({
   required this.errorMessageModel
 });

}

class LocalException implements Exception
{
  final String message;
 // final ErrorMessageModel errorMessageModel;
 const LocalException(this.message);
}


