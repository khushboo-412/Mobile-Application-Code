class AlertModel {

  List<Map<String, dynamic>> alertList;

  AlertModel({
    this.alertList,
  });

  factory AlertModel.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>> alertListLocal = new List();
    alertListLocal.add(json);
    return AlertModel(
      alertList: alertListLocal,
    );
  }
}

class AlertModelList {
  List<AlertModel> alertModelLists;

  AlertModelList(this.alertModelLists);

  factory AlertModelList.fromJson(List<dynamic> json) {
    List<AlertModel> alertModelList = List<AlertModel>();
    alertModelList = json.map((i) => AlertModel.fromJson(i)).toList();

    return AlertModelList(alertModelList);
  }
}
