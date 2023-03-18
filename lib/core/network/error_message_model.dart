import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
//equatable instante of overriding operator, should be done in any model
final int statusCode;
final String statusMessage;
final bool success;
const ErrorMessageModel({
  required this.statusMessage,
  required this.success,
  required this.statusCode,
});

factory ErrorMessageModel.fromJsonConstructor( Map<String,dynamic> jsonDataError )
{
 return ErrorMessageModel(
     statusMessage: jsonDataError["status_message"],
     success: jsonDataError["success"],
     statusCode: jsonDataError["status_code"]);


      }

  @override
  // TODO: implement props
  List<Object?> get props => [statusMessage,statusCode,success];




}