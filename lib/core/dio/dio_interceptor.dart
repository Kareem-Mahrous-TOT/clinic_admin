import 'dart:developer';

import 'package:dio/dio.dart';

import '../dependency_injection/di_container.dart';
import '../utils/shared_keys.dart';

class DioInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {}

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = preferences.getString(SharedKeys.accessToken);
    options.headers["Authorization"] = "Bearer $token";
    log("=======================================");
    log("Request");
    log("url:=> ${options.path}");
    log("content:=> ${options.contentType}");
    log("headers:=> hasToken:${token != null}");
    log("body:=> ${options.data != null ? options.data! : "Data is null"}");
    log("=======================================");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    response.statusCode == 401 ||
            response.data.containsKey("Unauthorized") ||
            response.data["message"] == "Invalid token"
        ? preferences.clear()
        : null;
    log("=======================================");
    log("Response:");
    log("url:=> ${response.requestOptions.path}");
    log("statusCode:=> ${response.statusCode}");
    log("body:=> hasData: ${response.data != null}");
    log("=======================================");
    handler.next(response);
  }
}
