part of 'bloc.dart';
class NotificationsData {
  late final NotificationsModel data;
  late final String status;
  late final String message;

  NotificationsData.fromJson(Map<String, dynamic> json){
    data = NotificationsModel.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }
}

class NotificationsModel {
  late final Null unreadnotificationsCount;
  late final List<Notifications> list;

  NotificationsModel.fromJson(Map<String, dynamic> json){
    unreadnotificationsCount = json['unreadnotifications_count'];
    list = List.from(json['notifications']??[]).map((e)=>Notifications.fromJson(e)).toList();
  }
}

class Notifications {
  late final String id;
  late final String title;
  late final String body;
  late final String notifyType;
  late final Order order;
  late final Null offer;
  late final Null chat;
  late final String createdAt;
  late final String readAt;
  late final String image;

  Notifications.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    body = json['body'];
    notifyType = json['notify_type'];
    order = Order.fromJson(json['order']);
    offer = null;
    chat = null;
    createdAt = json['created_at'];
    readAt = json['read_at'];
    image = json['image'];
  }
}

class Order {
  late final int orderId;
  late final int clientId;
  late final int driverId;
  late final Null orderType;
  late final String orderStatus;

  Order.fromJson(Map<String, dynamic> json){
    orderId = json['order_id'];
    clientId = json['client_id'];
    driverId = json['driver_id'];
    orderType = null;
    orderStatus = json['order_status'];
  }

}
