// To parse this JSON data, do
//
//     final leadManagementModel = leadManagementModelFromJson(jsonString);

import 'dart:convert';

List<LeadManagementModel> leadManagementModelFromJson(String str) => List<LeadManagementModel>.from(json.decode(str).map((x) => LeadManagementModel.fromJson(x)));

String leadManagementModelToJson(List<LeadManagementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeadManagementModel {
    String id;
    String name;
    String phoneNumber;
    DateTime dateOfJoining;
    String? status;
    bool? delete;
    String address;
    int mark;
    SubjectName subjectName;
    Course course;
    SRId? sRcId;
    SRId? sRoId;
    BranchId branchId;
    SchoolId schoolId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    List<History> histories;

    LeadManagementModel({
        required this.id,
        required this.name,
        required this.phoneNumber,
        required this.dateOfJoining,
        this.status,
        this.delete,
        required this.address,
        required this.mark,
        required this.subjectName,
        required this.course,
        this.sRcId,
        this.sRoId,
        required this.branchId,
        required this.schoolId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        required this.histories,
    });

    factory LeadManagementModel.fromJson(Map<String, dynamic> json) => LeadManagementModel(
        id: json["_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        status: json["status"],
        delete: json["delete"],
        address: json["address"],
        mark: json["mark"],
        subjectName: subjectNameValues.map[json["subject_name"]]!,
        course: courseValues.map[json["course"]]!,
        sRcId: json["sRCId"] == null ? null : SRId.fromJson(json["sRCId"]),
        sRoId: json["sROId"] == null ? null : SRId.fromJson(json["sROId"]),
        branchId: BranchId.fromJson(json["branchId"]),
        schoolId: SchoolId.fromJson(json["schoolId"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        histories: List<History>.from(json["histories"].map((x) => History.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "phone_number": phoneNumber,
        "date_of_joining": dateOfJoining.toIso8601String(),
        "status": status,
        "delete": delete,
        "address": address,
        "mark": mark,
        "subject_name": subjectNameValues.reverse[subjectName],
        "course": courseValues.reverse[course],
        "sRCId": sRcId?.toJson(),
        "sROId": sRoId?.toJson(),
        "branchId": branchId.toJson(),
        "schoolId": schoolId.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "histories": List<dynamic>.from(histories.map((x) => x.toJson())),
    };
}

class BranchId {
    Id id;
    BranchIdName name;
    Code code;
    bool status;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    BranchId({
        required this.id,
        required this.name,
        required this.code,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory BranchId.fromJson(Map<String, dynamic> json) => BranchId(
        id: idValues.map[json["_id"]]!,
        name: branchIdNameValues.map[json["name"]]!,
        code: codeValues.map[json["code"]]!,
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "name": branchIdNameValues.reverse[name],
        "code": codeValues.reverse[code],
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

enum Code {
    BR001
}

final codeValues = EnumValues({
    "BR001": Code.BR001
});

enum Id {
    THE_684_BC886707258_B7_B3_D496_EA,
    THE_684_BCBE3707258_B7_B3_D49716
}

final idValues = EnumValues({
    "684bc886707258b7b3d496ea": Id.THE_684_BC886707258_B7_B3_D496_EA,
    "684bcbe3707258b7b3d49716": Id.THE_684_BCBE3707258_B7_B3_D49716
});

enum BranchIdName {
    KOTTAKKAL_BRANCH
}

final branchIdNameValues = EnumValues({
    "Kottakkal Branch": BranchIdName.KOTTAKKAL_BRANCH
});

enum Course {
    BCA,
    B_BA,
    B_SC
}

final courseValues = EnumValues({
    "BCA": Course.BCA,
    "BBa": Course.B_BA,
    "B.Sc": Course.B_SC
});

class History {
    String id;
    DateTime? date;
    String status;
    String message;
    String leadId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    History({
        required this.id,
        this.date,
        required this.status,
        required this.message,
        required this.leadId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        status: json["status"],
        message: json["message"],
        leadId: json["leadId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "date": date?.toIso8601String(),
        "status": status,
        "message": message,
        "leadId": leadId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class SRId {
    PurpleId id;
    SRcIdName name;
    Email email;
    String password;
    Position position;
    String employeeCode;
    String phoneNumber;
    DateTime dateOfJoining;
    Address address;
    bool status;
    int pointAmount;
    bool isAdmin;
    bool headAdministractor;
    Id branchId;
    List<dynamic> managerPoint;
    List<dynamic> lead;
    List<dynamic> registration;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    Id? srcId;

    SRId({
        required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.position,
        required this.employeeCode,
        required this.phoneNumber,
        required this.dateOfJoining,
        required this.address,
        required this.status,
        required this.pointAmount,
        required this.isAdmin,
        required this.headAdministractor,
        required this.branchId,
        required this.managerPoint,
        required this.lead,
        required this.registration,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.srcId,
    });

    factory SRId.fromJson(Map<String, dynamic> json) => SRId(
        id: purpleIdValues.map[json["_id"]]!,
        name: sRcIdNameValues.map[json["name"]]!,
        email: emailValues.map[json["email"]]!,
        password: json["password"],
        position: positionValues.map[json["position"]]!,
        employeeCode: json["employee_code"],
        phoneNumber: json["phone_number"],
        dateOfJoining: DateTime.parse(json["date_of_joining"]),
        address: addressValues.map[json["address"]]!,
        status: json["status"],
        pointAmount: json["point_amount"],
        isAdmin: json["is_admin"],
        headAdministractor: json["head_administractor"],
        branchId: idValues.map[json["branchId"]]!,
        managerPoint: List<dynamic>.from(json["managerPoint"].map((x) => x)),
        lead: List<dynamic>.from(json["lead"].map((x) => x)),
        registration: List<dynamic>.from(json["registration"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        srcId: idValues.map[json["srcId"]]!,
    );

    Map<String, dynamic> toJson() => {
        "_id": purpleIdValues.reverse[id],
        "name": sRcIdNameValues.reverse[name],
        "email": emailValues.reverse[email],
        "password": password,
        "position": positionValues.reverse[position],
        "employee_code": employeeCode,
        "phone_number": phoneNumber,
        "date_of_joining": dateOfJoining.toIso8601String(),
        "address": addressValues.reverse[address],
        "status": status,
        "point_amount": pointAmount,
        "is_admin": isAdmin,
        "head_administractor": headAdministractor,
        "branchId": idValues.reverse[branchId],
        "managerPoint": List<dynamic>.from(managerPoint.map((x) => x)),
        "lead": List<dynamic>.from(lead.map((x) => x)),
        "registration": List<dynamic>.from(registration.map((x) => x)),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "srcId": idValues.reverse[srcId],
    };
}

enum Address {
    HSHSHSHS,
    KOTTAKKALL,
    OTHUKKUNGAL
}

final addressValues = EnumValues({
    "hshshshs": Address.HSHSHSHS,
    "kottakkall": Address.KOTTAKKALL,
    "othukkungal": Address.OTHUKKUNGAL
});

enum Email {
    ASHIK21_GMAIL_COM,
    SAHAD21_GMAIL_COM,
    SALI_GMAIL_COM
}

final emailValues = EnumValues({
    "ashik21@gmail.com": Email.ASHIK21_GMAIL_COM,
    "sahad21@gmail.com": Email.SAHAD21_GMAIL_COM,
    "sali@gmail.com": Email.SALI_GMAIL_COM
});

enum PurpleId {
    THE_684_BE6966_A73_CFE81_C31_CEE5,
    THE_684_BE6_D56_A73_CFE81_C31_CEEF,
    THE_6854_F77804_B4_A7_F762_AFEC95
}

final purpleIdValues = EnumValues({
    "684be6966a73cfe81c31cee5": PurpleId.THE_684_BE6966_A73_CFE81_C31_CEE5,
    "684be6d56a73cfe81c31ceef": PurpleId.THE_684_BE6_D56_A73_CFE81_C31_CEEF,
    "6854f77804b4a7f762afec95": PurpleId.THE_6854_F77804_B4_A7_F762_AFEC95
});

enum SRcIdName {
    ASHIK,
    SAHAD,
    SALIM
}

final sRcIdNameValues = EnumValues({
    "Ashik": SRcIdName.ASHIK,
    "sahad.": SRcIdName.SAHAD,
    "salim ": SRcIdName.SALIM
});

enum Position {
    SRC,
    SRO
}

final positionValues = EnumValues({
    "SRC": Position.SRC,
    "SRO": Position.SRO
});

class SchoolId {
    FluffyId id;
    SchoolIdName  name;
    String schoolCode;
    Id branchId;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    SchoolId({
        required this.id,
        required this.name,
        required this.schoolCode,
        required this.branchId,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory SchoolId.fromJson(Map<String, dynamic> json) => SchoolId(
        id: fluffyIdValues.map[json["_id"]]!,
        name: schoolIdNameValues.map[json["name"]]!,
        schoolCode: json["school_code"],
        branchId: idValues.map[json["branchId"]]!,
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": fluffyIdValues.reverse[id],
        "name": schoolIdNameValues.reverse[name],
        "school_code": schoolCode,
        "branchId": idValues.reverse[branchId],
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

enum FluffyId {
    THE_684_BE3_AA6_A73_CFE81_C31_CE64
}

final fluffyIdValues = EnumValues({
    "684be3aa6a73cfe81c31ce64": FluffyId.THE_684_BE3_AA6_A73_CFE81_C31_CE64
});

enum SchoolIdName {
    PKM
}

final schoolIdNameValues = EnumValues({
    "PKM": SchoolIdName.PKM
});

enum SubjectName {
    MARKETING,
    MATHEMATICS
}

final subjectNameValues = EnumValues({
    "marketing": SubjectName.MARKETING,
    "Mathematics": SubjectName.MATHEMATICS
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
