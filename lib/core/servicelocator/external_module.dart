import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class BaseClient {
  @singleton
  http.Client get httpClient => http.Client();
}