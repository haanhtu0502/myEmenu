import 'package:dio/dio.dart';
import 'package:emenu/core/networking/api_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data);
}

class DataError<T> extends DataState<T> {
  DataError(
    DioException error,
  ) : super(error: error);
}

extension DataStateExtensions<T> on DataState<T> {
  Either<ApiException, bool> toBoolResult() {
    if (this is DataError) {
      return Left(
        ApiException(message: error?.message ?? 'Error'),
      );
    }
    return const Right(true);
  }
}
