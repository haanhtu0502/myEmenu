import 'package:emenu/core/networking/api_exception.dart';
import 'package:fpdart/fpdart.dart';

typedef SResult<T> = Either<ApiException, T>;
