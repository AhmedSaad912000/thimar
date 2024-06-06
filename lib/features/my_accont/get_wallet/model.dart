part of 'bloc.dart';
class GetWalletData {
  late final List<GetWalletModel> list;
  late final String status;
  late final String message;
  late final double wallet;

  GetWalletData.fromJson(Map<String, dynamic> json){
    list = List.from(json['data']).map((e)=>GetWalletModel.fromJson(e)).toList();
    status = json['status'];
    message = json['message'];
    wallet = json['wallet'];
  }

}

class GetWalletModel {

  late final int id;
  late final int amount;
  late final double beforeCharge;
  late final double afterCharge;
  late final String date;
  late final String statusTrans;
  late final String status;
  late final String transactionType;
  late final String modelType;
  late final int modelId;
  late final String state;

  GetWalletModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    amount = json['amount'];
    beforeCharge = json['before_charge'];
    afterCharge = json['after_charge'];
    date = json['date'];
    statusTrans = json['status_trans'];
    status = json['status'];
    transactionType = json['transaction_type'];
    modelType = json['model_type'];
    modelId = json['model_id'];
    state = json['state'];
  }

}