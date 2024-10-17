import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class BaseViewModel<T > extends Cubit<T>{

   BaseViewModel(super.initialState);

   AppLocalizations? appLocalizations;
   String getErrorMassageFromException(Exception ? exception){
      if(exception is DioException){
         return _mapDioExceptionToMessage(exception);
      }else {
         return appLocalizations!.unknown;
      }
   }



   String _mapDioExceptionToMessage(DioException dioException) {
      switch (dioException.type) {
         case DioExceptionType.connectionTimeout:
            return appLocalizations!.connectionTimeout;
         case DioExceptionType.sendTimeout:
            return appLocalizations!.sendTimeout;
         case DioExceptionType.receiveTimeout:
            return appLocalizations!.receiveTimeout ;
         case DioExceptionType.badCertificate:
            return appLocalizations!.badCertificate ;
         case DioExceptionType.badResponse:
            return _handleBadResponse(dioException);
         case DioExceptionType.connectionError:
            return appLocalizations!.connectionError ;
         case DioExceptionType.unknown:
            return appLocalizations!.unknown ;
         case DioExceptionType.cancel:
            return "Request cancelled";
         default:
            return appLocalizations!.unknown;
      }
   }
   String _handleBadResponse(DioException exception) {
      final statusCode = exception.response?.statusCode;
      if (statusCode == 400) {
         return exception.response?.data["message"] ?? appLocalizations!.badRequest ;
      } else if (statusCode == 401 || statusCode == 403) {
         return exception.response?.data["message"] ?? appLocalizations!.unauthorized ;
      } else if (statusCode == 404) {
         return  appLocalizations!.notFount;
      } else if (statusCode == 409) {
         return exception.response?.data["message"] ?? appLocalizations!.conflict ;
      } else if (statusCode == 500) {
         return  appLocalizations!.internalServerError ;
      } else {
         return exception.response?.data["message"] ?? appLocalizations!.unknown ;
      }
   }


}