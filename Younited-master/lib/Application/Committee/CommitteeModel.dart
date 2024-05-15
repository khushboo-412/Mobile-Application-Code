// For Showing Committees
class CommitteeModel {
  String id;
  String committeeName;
  String associationAndMembers;
  String validTill;

  CommitteeModel({
    this.id,
    this.committeeName,
    this.associationAndMembers,
    this.validTill,
  });

  factory CommitteeModel.fromJson(Map<String, dynamic> json) {
    return CommitteeModel(
      id: json['id'],
      committeeName: json['CommitteeName'],
      associationAndMembers: json['AssocationAndMeberes'],
      validTill: json['ValidTill'],
    );
  }
}

class CommitteeList {
  List<CommitteeModel> committeeDataLists;

  CommitteeList(this.committeeDataLists);

  factory CommitteeList.fromJson(List<dynamic> json) {
    List<CommitteeModel> committeeList = List<CommitteeModel>();
    committeeList = json.map((i) => CommitteeModel.fromJson(i)).toList();

    return CommitteeList(committeeList);
  }
}

/*
class CommitteeMembersModel {
  String memberId;
  String memberName;
  String associationId;

  CommitteeMembersModel({this.memberId, this.memberName, this.associationId});

  factory CommitteeMembersModel.fromJson(Map<String, dynamic> memberItem) {
    return CommitteeMembersModel(
      memberId: memberItem['MemberId'],
      memberName: memberItem['MemberName'],
      associationId: memberItem['AssociationId'],
    );
  }
}

class CommitteeMemberList {
  List<CommitteeMembersModel> committeeMembersDataList;

  CommitteeMemberList(this.committeeMembersDataList);

  factory CommitteeMemberList.fromJson(List<dynamic> jsonData) {
    List<CommitteeMembersModel> committeeMembersList =
        List<CommitteeMembersModel>();
    committeeMembersList =
        jsonData.map((i) => CommitteeMembersModel.fromJson(i)).toList();

    return CommitteeMemberList(committeeMembersList);
  }
}
*/
