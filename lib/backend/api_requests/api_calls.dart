import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetWeatherCall {
  static Future<ApiCallResponse> call({
    String? city = 'Tunisia',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetWeather',
      apiUrl:
          'https://api.openweathermap.org/data/2.5/weather?q=${city}&appid=&units=metric&lang=fr',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? temp(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
  static int? humidity(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.main.humidity''',
      ));
  static double? speed(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.wind.speed''',
      ));
  static String? cityname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
}

class ImageuploadCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'imageupload',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic imageUrl(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
}

class ShareOnFacebookCall {
  static Future<ApiCallResponse> call({
    String? message = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'ShareOnFacebook',
      apiUrl: 'https://graph.facebook.com/v22.0//feed',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'message': message,
        'access_token':
            "",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CarInfoCall {
  static Future<ApiCallResponse> call({
    String? text = 'hrllo',
  }) async {
    final ffApiRequestBody = '''
{
  "model": "llama3-70b-8192",
  "messages": [
    {
      "role": "user",
      "content": "${escapeStringForJson(text)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CarInfo',
      apiUrl: 'https://api.groq.com/openai/v1/chat/completions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            '',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.choices[:].message.content''',
      ));
}

class InvoiceCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? address = '',
    int? nbJours,
    double? price,
    double? totalPrice,
  }) async {
    final ffApiRequestBody = '''
{
  "document": "Lw2dzhdXaxdsjFs8ytTA",
  "apiKey": "",
  "format": "docx",
  "data": {
    "name": "${escapeStringForJson(name)}",
    "address": "${escapeStringForJson(address)}",
    "nbJours": ${nbJours},
    "price": ${price},
    "totalprice": ${totalPrice}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Invoice',
      apiUrl: 'https://app.documentero.com/api',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? pdflink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data''',
      ));
}

class WikiCall {
  static Future<ApiCallResponse> call({
    String? nom = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Wiki',
      apiUrl: 'https://fr.wikipedia.org/api/rest_v1/page/summary/${nom}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? imageLink(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.originalimage.source''',
      ));
  static String? url(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.content_urls.desktop.page''',
      ));
  static String? content(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.extract''',
      ));
}

class SmsCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'SMS',
      apiUrl:
          'https://api.twilio.com/2010-04-01/Accounts//Messages.json',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic ==',
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'To': "+21693676046",
        'From': "+19342470766",
        'Body': "Votre Abonement est  Confirme ! ",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PhoneVerificationCall {
  static Future<ApiCallResponse> call({
    String? phoneNumber = '28194715',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'PhoneVerification',
      apiUrl:
          'https://api.api-ninjas.com/v1/validatephone?number=+216${phoneNumber}',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': '==',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static bool? isvalid(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.is_valid''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
