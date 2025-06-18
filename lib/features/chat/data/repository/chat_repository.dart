import 'package:rashed/core/utils/app_toast.dart';
import 'package:rashed/core/utils/data/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class UserRepository {
  static const String _sessionIdKey = 'session_id';

  static String? get sessionId => AppLocalStorage.getData(key: _sessionIdKey);
  static Future<void> saveSessionId(String sessionId) async {
    await AppLocalStorage.saveData(key: _sessionIdKey, value: sessionId);
  }


  static Future<bool> startSession() async {
    try {
      final Response<dynamic> response = await ApiService.postApi(ApiPaths.startSession);

      debugPrint(response.data.toString());
      AppToast.toast(msg: response.data['message']);

      if(response.statusCode! < 300){
        saveSessionId(response.data['data']['sessionId']);
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }
}
