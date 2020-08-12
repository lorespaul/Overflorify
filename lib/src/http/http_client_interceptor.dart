import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class HttpClientInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      data.params["key"] = "Jsl8N76Sn)zh6aFU)mfuNA((";
      data.params["site"] = "stackoverflow";
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}
