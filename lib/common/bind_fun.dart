import 'package:dio/dio.dart';

class BindFun{
  String serverUrl = 'http://192.168.1.5:8000/';
  Future<Map> getBind(String userId,{Map other}) async {
    Map data = {'user_id': userId};
    if (other != null) {
      data.addAll(other);
      print(data.toString());
    }
    try {
      Response response = await Dio().post("${this.serverUrl}query", data: data);
      return {'data': response.data};
    } on DioError catch (e) {
      print(e);
      return {'msg': '无法连接到服务器'};
    }
  }
  Future<Map> getBindMore(String bindId,{Map other}) async {
    Map data = {'bind_id': bindId};
    if (other != null) {
      data.addAll(other);
      print(data.toString());
    }
    try {
      Response response = await Dio().post("${this.serverUrl}querymore", data: data);
      return {'data': response.data};
    } on DioError catch (e) {
      print(e);
      return {'msg': '无法连接到服务器'};
    }
  }
  Future<Map> changeStatus(String bindId,int type ,{Map other}) async {
    Map data = {'bind_id': bindId, 'type': type};
    if (other != null) {
      data.addAll(other);
      print(data.toString());
    }
    try {
      Response response = await Dio().post("${this.serverUrl}change", data: data);
      return {'data': response.data};
    } on DioError catch (e) {
      print(e);
      return {'msg': '无法连接到服务器'};
    }
  }
  Future<Map> sendBind(String useIdFrom,String userIdTo,String text,{Map other}) async {
    Map data = {'user_id_from': useIdFrom,'user_id_to': userIdTo,'text':text};
    if (other != null) {
      data.addAll(other);
      print(data.toString());
    }
    try {
      Response response = await Dio().post("${this.serverUrl}send", data: data);
      return {'data': response.data};
    } on DioError catch (e) {
      print(e);
      return {'msg': '无法连接到服务器'};
    }
  }
}