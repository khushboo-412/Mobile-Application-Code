class AssociationModel {
  String associationId;
  String associationName;
  String userId;

  AssociationModel({this.associationId, this.associationName, this.userId});

  factory AssociationModel.fromJson(Map<String, dynamic> json) {
    return AssociationModel(
      associationId : json['AssociationID'],
      associationName : json['AssociationName'],
      userId : json['user_id']
    ); // Need To Change Here
  }

}

class AssociationListModel{

  List<AssociationModel> association;

  AssociationListModel(this.association);

  factory AssociationListModel.fromJson(List<dynamic> json){

    List<AssociationModel> associationList = List<AssociationModel>();

    associationList = json.map((i) => AssociationModel.fromJson(i)).toList();

    return AssociationListModel(associationList);
  }


}