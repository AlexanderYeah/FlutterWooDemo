import 'dart:ffi';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart'
    hide Response, FormData, MultipartFile; // 这里要隐藏 否则dio 的会冲突
import '../index.dart';

// GetXService用在runApp之前，用于启动App之前进行初始化工作
// 可以分别定义APIService(网络)、DBService(数据库)、S
// haredPreferenceService(本地化存储)等
class WPHttpService extends GetxService {
  static WPHttpService get to => Get.find();
  late final Dio _dio;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // 初始化Dio
    var options = BaseOptions(
      baseUrl: Constants.wpApiBaseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 5),
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    _dio = Dio(options);
    // 拦截器
    _dio.interceptors.add(RequestInterceptors());
    _dio.interceptors.add(LogInterceptor());
  }

  // get 请求
  Future<Response> get(
    String url, {
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(url,
        queryParameters: params, options: options, cancelToken: cancelToken);
    return response;
  }

  // post
  Future<Response> post(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.post(url,
        data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
    return response;
  }

  // put
  Future<Response> put(String url,
      {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.put(url,
        data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
    return response;
  }

  // delete
  Future<Response> delete(String url,
      {dynamic data, Options? options, CancelToken? cancelToken}) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.delete(url,
        data: data ?? {}, options: requestOptions, cancelToken: cancelToken);
    return response;
  }
}

class RequestInterceptors extends Interceptor {
  // 拦截请求
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    return handler.next(options);
  }

  // 拦截响应
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse

    // 200 请求成功  201 添加成功
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
          DioError(
              requestOptions: response.requestOptions,
              response: response,
              type: DioErrorType.badResponse),
          true);
    } else {
      handler.next(response);
    }
  }

  // Future<Void> _errorNoAuthLogout() async {

  // }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // TODO: implement onError

    final exception = HttpException(err.message!);
    switch (err.type) {
      case DioErrorType.badResponse: //服务器自定义错误的处理
        {
          final response = err.response;
          final errorMsg = ErrorMessageModel.fromJson(response?.data);
          switch (errorMsg.statusCode) {
            case 401:
              // 未授权 重新登录
              break;
            case 404:
              break;
            case 502:
              break;
            case 500:
              break;
            default:
          }
          Loading.error(errorMsg.message);
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectionTimeout:
        break;
      case DioErrorType.unknown:
        break;
      default:
    }

    DioError errNext = err.copyWith(
      error: exception,
    );
    handler.next(errNext);
  }
}
