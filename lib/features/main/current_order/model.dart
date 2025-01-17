part of 'bloc.dart';
class CurrentOrderData {
  late final List<CurrentOrderModel> list;
  late final String status;
  late final String message;

  CurrentOrderData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']??[]).map((e)=>CurrentOrderModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
  }

}

class CurrentOrderModel {
  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final dynamic? orderPrice;
  late final int deliveryPrice;
  late final dynamic? totalPrice;
  late final String clientName;
  late final Null phone;
  late final Null location;
  late final String deliveryPayer;
  late final List<Products> products;
  late final String payType;
  late final Null note;
  late final int isVip;
  late final int vipDiscountPercentage;

  CurrentOrderModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    status = json['status'];
    date = json['date'];
    time = json['time'];
    orderPrice = json['order_price'];
    deliveryPrice = json['delivery_price'];
    totalPrice = json['total_price'];
    clientName = json['client_name'];
    phone = null;
    location = null;
    deliveryPayer = json['delivery_payer'];
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    payType = json['pay_type'];
    note = null;
    isVip = json['is_vip'];
    vipDiscountPercentage = json['vip_discount_percentage'];
  }

}

class Products {
  late final String name;
  late final String url;

  Products.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }
}
