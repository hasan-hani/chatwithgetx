class ChattingModel {
  int? id;
  String? message;
  String? sender;
  String? dateofsending;
  String? 	reciver       ;

  ChattingModel({this.id, this.message, this.sender, this.dateofsending});

  ChattingModel.fromJson(Map<String, dynamic> json) {
    id            = json['id']           ;
    message       = json['message']      ;
    sender        = json['sender']       ;
    dateofsending = json['dateofsending'];
    reciver       =json['reciver']       ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['sender'] = this.sender;
    data['dateofsending'] = this.dateofsending;
    data['reciver']=this.reciver              ;
    return data;
  }
}
