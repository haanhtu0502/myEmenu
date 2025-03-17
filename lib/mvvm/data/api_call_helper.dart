import 'dart:io';

import 'package:dio/dio.dart';
import 'package:emenu/core/networking/api_exception.dart';
import 'package:emenu/core/networking/data_state.dart';
import 'package:emenu/core/networking/s_result.dart';
import 'package:emenu/mvvm/data/model/response/pagination_response/pagination_response_model.dart';
import 'package:emenu/mvvm/data/model/response/reponse_data/response_data_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:retrofit/dio.dart';

class ApiCallHelper {
  final String dataNullError = "Data null";
  final String baseError = "Error";

  ApiException toErrorMessage(DioException? exception) => ApiException(
      message: exception?.response?.data["message"]?.toString() ?? baseError);

  Future<DataState<T>> getStateOf<T>(
      {required Future<HttpResponse<T>> Function() apiCall}) async {
    try {
      final httpResponse = await apiCall();
      if (httpResponse.response.statusCode == HttpStatus.ok ||
          httpResponse.response.statusCode == HttpStatus.created) {
        return DataSuccess(httpResponse.data);
      }
      return DataError(
        DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
        ),
      );
    } on DioException catch (e) {
      return DataError(
        DioException(
          requestOptions: e.requestOptions,
          response: e.response,
          type: e.type,
          error: e.error,
        ),
      );
    }
  }

  Future<SResult<T>> callHandleResponseData<T>({
    required Future<HttpResponse<T>> Function() request,
    bool onlyCheckStatus = false,
  }) async {
    // if(!(await InternetConnectionChecker().hasConnection)){
    //   log("⚠️ No internet connection");
    //   return Left(AppException(message: "No internet connection"));
    // }
    try {
      final response =
          await getStateOf(apiCall: () async => await request.call());
      if (response is DataError) {
        return Left(toErrorMessage(response.error));
      }
      if (response.data == null) {
        return Left(ApiException(message: dataNullError));
      }

      if (response.data is ResponseData<T>) {
        final resData = response.data as ResponseData<T>;
        if (resData.status! < 200 && resData.status! > 300) {
          return Left(
            ApiException(
              message: resData.errors ?? resData.message,
              code: resData.status,
            ),
          );
        } else {
          if (resData.data == null) {
            return Left(
              ApiException(message: dataNullError, code: resData.status),
            );
          }
          return Right(response.data as T);
        }
      }
      //Check null data exception
      if (response.data is ResponseData &&
          (response.data as ResponseData).data == null) {
        return Left(
          ApiException(
              message: dataNullError,
              code: (response.data as ResponseData).status),
        );
      }
      return Right(response.data as T);
    } catch (e) {
      return Left(ApiException(message: e.toString()));
    }
  }

  Future<SResult<T>> callHandlePaginationResponseData<T>({
    required Future<HttpResponse<T>> Function() request,
    bool onlyCheckStatus = false,
  }) async {
    // if(!(await InternetConnectionChecker().hasConnection)){
    //   log("⚠️ No internet connection");
    //   return Left(AppException(message: "No internet connection"));
    // }
    try {
      final response =
          await getStateOf(apiCall: () async => await request.call());
      if (response is DataError) {
        return Left(toErrorMessage(response.error));
      }
      if (response.data == null) {
        return Left(ApiException(message: dataNullError));
      }

      if (response.data is PaginationResponse<T>) {
        final resData = response.data as PaginationResponse<T>;
        if (resData.status! < 200 && resData.status! > 300) {
          return Left(
            ApiException(
              message: resData.errors ?? resData.message ?? '',
              code: resData.status,
            ),
          );
        } else {
          return Right(response.data as T);
        }
      }

      return Right(response.data as T);
    } catch (e) {
      return Left(ApiException(message: e.toString()));
    }
  }
}
