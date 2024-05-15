
// Using When Creating Committee
class CommitteeMemberModel {
  String id;
  String memberName;
  String userProfileImage;

  CommitteeMemberModel({
    this.id,
    this.memberName,
    this.userProfileImage,

  }
      );
  factory CommitteeMemberModel.fromJson(Map<String, dynamic> json) {
    return CommitteeMemberModel(

      id: json['id'],
      memberName: json['FirstName'],
      userProfileImage: json['UserProfileImage'],

    );
  }
}
class CommitteeMemberList{
  List<CommitteeMemberModel> committeeMemberDataLists;
  CommitteeMemberList(this.committeeMemberDataLists);
  factory CommitteeMemberList.fromJson(List<dynamic> json){
    List<CommitteeMemberModel> committeeList = List<CommitteeMemberModel>();
    committeeList = json.map((i) => CommitteeMemberModel.fromJson(i)).toList();

    return CommitteeMemberList(committeeList);
  }
}