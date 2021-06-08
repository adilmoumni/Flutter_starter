class User {
  String token;
  String email;
  String firstName;
  String lastName;
  String address;
  var latitude;
  var longitude;
  String mobilePhone;
  String phoneNumberAr;
  String picture;
  var jobTitleId;
  String type;
  String status;
  int rgpd;
  int experience;
  int diploma;
  var degree;
  var source;
  var updatePassword;
  int roleId;
  var healthId;
  var healthCard;
  var contract;
  String idCard;
  String rib;
  String networking;
  var softyId;
  int chatroomId;
  var aircallId;
  var stripeId;
  String aircallContactId;
  int importDone;
  int createdBy;
  List<Skills> skills;
  String ribFile;
  String diplomaDisplay;
  String experienceDisplay;
  String name;
  String avatar;
  Trainer trainer;

  User(
      {this.email,
      this.token,
      this.firstName,
      this.lastName,
      this.address,
      this.latitude,
      this.longitude,
      this.mobilePhone,
      this.phoneNumberAr,
      this.picture,
      this.jobTitleId,
      this.type,
      this.status,
      this.rgpd,
      this.experience,
      this.diploma,
      this.degree,
      this.source,
      this.updatePassword,
      this.roleId,
      this.healthId,
      this.healthCard,
      this.contract,
      this.idCard,
      this.rib,
      this.networking,
      this.softyId,
      this.chatroomId,
      this.aircallId,
      this.stripeId,
      this.aircallContactId,
      this.importDone,
      this.createdBy,
      this.skills,
      this.ribFile,
      this.diplomaDisplay,
      this.experienceDisplay,
      this.name,
      this.avatar,
      this.trainer});

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'] ?? '';
    token = json['token'] ?? '';
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    address = json['address'] ?? '';
    latitude = json['latitude'] ?? '';
    longitude = json['longitude'] ?? '';
    mobilePhone = json['mobile_phone'] ?? '';
    phoneNumberAr = json['phone_number_ar'] ?? '';
    picture = json['picture'] ?? '';
    jobTitleId = json['job_title_id'] ?? '';
    type = json['type'] ?? '';
    status = json['status'] ?? '';
    rgpd = json['rgpd'];
    experience = json['experience'];
    diploma = json['diploma'];
    degree = json['degree'] ?? '';
    source = json['source'] ?? '';
    updatePassword = json['update_password'] ?? '';
    roleId = json['role_id'];
    healthId = json['health_id'] ?? '';
    healthCard = json['health_card'] ?? '';
    contract = json['contract'] ?? '';
    idCard = json['id_card'] ?? '';
    rib = json['rib'] ?? '';
    networking = json['networking'] ?? '';
    softyId = json['softy_id'] ?? '';
    chatroomId = json['chatroom_id'];
    aircallId = json['aircall_id'] ?? '';
    stripeId = json['stripe_id'] ?? '';
    aircallContactId = json['aircall_contact_id'] ?? '';
    importDone = json['import_done'];
    createdBy = json['created_by'];
    if (json['skills'] != null) {
      skills = [];
      json['skills'].forEach((v) {
        skills?.add(new Skills.fromJson(v));
      });
    }
    ribFile = json['rib_file'] ?? '';
    diplomaDisplay = json['diploma_display'] ?? '';
    experienceDisplay = json['experience_display'] ?? '';
    name = json['name'] ?? '';
    avatar = json['avatar'] ?? '';
    trainer =
        json['trainer'] != null ? new Trainer.fromJson(json['trainer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['token'] = this.token;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['mobile_phone'] = this.mobilePhone;
    data['phone_number_ar'] = this.phoneNumberAr;
    data['picture'] = this.picture;
    data['job_title_id'] = this.jobTitleId;
    data['type'] = this.type;
    data['status'] = this.status;
    data['rgpd'] = this.rgpd;
    data['experience'] = this.experience;
    data['diploma'] = this.diploma;
    data['degree'] = this.degree;
    data['source'] = this.source;
    data['update_password'] = this.updatePassword;
    data['role_id'] = this.roleId;
    data['health_id'] = this.healthId;
    data['health_card'] = this.healthCard;
    data['contract'] = this.contract;
    data['id_card'] = this.idCard;
    data['rib'] = this.rib;
    data['networking'] = this.networking;
    data['softy_id'] = this.softyId;
    data['chatroom_id'] = this.chatroomId;
    data['aircall_id'] = this.aircallId;
    data['stripe_id'] = this.stripeId;
    data['aircall_contact_id'] = this.aircallContactId;
    data['import_done'] = this.importDone;
    data['created_by'] = this.createdBy;
    if (this.skills != null) {
      data['skills'] = this.skills?.map((v) => v.toJson()).toList();
    }
    data['rib_file'] = this.ribFile;
    data['diploma_display'] = this.diplomaDisplay;
    data['experience_display'] = this.experienceDisplay;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    if (this.trainer != null) {
      data['trainer'] = this.trainer?.toJson();
    }
    return data;
  }
}

class Skills {
  int skillId;
  String name;
  String keywords_list;

  Skills({this.skillId, this.name, this.keywords_list});

  Skills.fromJson(Map<String, dynamic> json) {
    skillId = json['skill_id'];
    name = json['name'] ?? '';
    keywords_list = json['keywords_list'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['skill_id'] = this.skillId;
    data['name'] = this.name;
    data['keywords_list'] = this.keywords_list;
    return data;
  }
}

class Trainer {
  String level;
  int levelNumber;
  var hourlyRate;
  String resume;
  int fpa;
  String rib;
  String ribFile;
  int certification;
  var sourcing;
  var contract;
  String siren;
  String sirenFile;
  String attestationUrssaf;
  String urssafUpdate;
  int sirenWaiting;
  int freelance;
  var diplomaTrainer;
  int trainingDistance;
  String activityId;
  String auditDate;
  int auditUserId;
  String auditComment;
  int mentor;
  String mentorMemberId;
  String mentorContract;
  int freelancer;
  var companyType;
  var hasCompany;
  var companyName;
  var companyRepresentative;
  var companyEmail;
  var companyPhone;
  var companyAddress;
  var companySiren;
  int inTraining;
  int driverLicence;
  String mobility;
  String updatedAt;

  Trainer(
      {this.level,
      this.levelNumber,
      this.hourlyRate,
      this.resume,
      this.fpa,
      this.rib,
      this.ribFile,
      this.certification,
      this.sourcing,
      this.contract,
      this.siren,
      this.sirenFile,
      this.attestationUrssaf,
      this.urssafUpdate,
      this.sirenWaiting,
      this.freelance,
      this.diplomaTrainer,
      this.trainingDistance,
      this.activityId,
      this.auditDate,
      this.auditUserId,
      this.auditComment,
      this.mentor,
      this.mentorMemberId,
      this.mentorContract,
      this.freelancer,
      this.companyType,
      this.hasCompany,
      this.companyName,
      this.companyRepresentative,
      this.companyEmail,
      this.companyPhone,
      this.companyAddress,
      this.companySiren,
      this.inTraining,
      this.driverLicence,
      this.mobility,
      this.updatedAt});

  Trainer.fromJson(Map<String, dynamic> json) {
    level = json['level'] ?? '';
    levelNumber = json['level_number'];
    hourlyRate = json['hourly_rate'] ?? '';
    resume = json['resume'] ?? '';
    fpa = json['fpa'];
    rib = json['rib'] ?? '';
    ribFile = json['rib_file'] ?? '';
    certification = json['certification'];
    sourcing = json['sourcing'] ?? '';
    contract = json['contract'] ?? '';
    siren = json['siren'] ?? '';
    sirenFile = json['siren_file'] ?? '';
    attestationUrssaf = json['attestation_urssaf'] ?? '';
    urssafUpdate = json['urssaf_update'] ?? '';
    sirenWaiting = json['siren_waiting'];
    freelance = json['freelance'];
    diplomaTrainer = json['diploma_trainer'] ?? '';
    trainingDistance = json['training_distance'];
    activityId = json['activity_id'] ?? '';
    auditDate = json['audit_date'] ?? '';
    auditUserId = json['audit_user_id'];
    auditComment = json['audit_comment'] ?? '';
    mentor = json['mentor'];
    mentorMemberId = json['mentor_member_id'] ?? '';
    mentorContract = json['mentor_contract'] ?? '';
    freelancer = json['freelancer'];
    companyType = json['company_type'] ?? '';
    hasCompany = json['has_company'] ?? '';
    companyName = json['company_name'] ?? '';
    companyRepresentative = json['company_representative'] ?? '';
    companyEmail = json['company_email'] ?? '';
    companyPhone = json['company_phone'] ?? '';
    companyAddress = json['company_address'] ?? '';
    companySiren = json['company_siren'] ?? '';
    inTraining = json['in_training'];
    driverLicence = json['driver_licence'];
    mobility = json['mobility'] ?? '';
    updatedAt = json['updated_at'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['level_number'] = this.levelNumber;
    data['hourly_rate'] = this.hourlyRate;
    data['resume'] = this.resume;
    data['fpa'] = this.fpa;
    data['rib'] = this.rib;
    data['rib_file'] = this.ribFile;
    data['certification'] = this.certification;
    data['sourcing'] = this.sourcing;
    data['contract'] = this.contract;
    data['siren'] = this.siren;
    data['siren_file'] = this.sirenFile;
    data['attestation_urssaf'] = this.attestationUrssaf;
    data['urssaf_update'] = this.urssafUpdate;
    data['siren_waiting'] = this.sirenWaiting;
    data['freelance'] = this.freelance;
    data['diploma_trainer'] = this.diplomaTrainer;
    data['training_distance'] = this.trainingDistance;
    data['activity_id'] = this.activityId;
    data['audit_date'] = this.auditDate;
    data['audit_user_id'] = this.auditUserId;
    data['audit_comment'] = this.auditComment;
    data['mentor'] = this.mentor;
    data['mentor_member_id'] = this.mentorMemberId;
    data['mentor_contract'] = this.mentorContract;
    data['freelancer'] = this.freelancer;
    data['company_type'] = this.companyType;
    data['has_company'] = this.hasCompany;
    data['company_name'] = this.companyName;
    data['company_representative'] = this.companyRepresentative;
    data['company_email'] = this.companyEmail;
    data['company_phone'] = this.companyPhone;
    data['company_address'] = this.companyAddress;
    data['company_siren'] = this.companySiren;
    data['in_training'] = this.inTraining;
    data['driver_licence'] = this.driverLicence;
    data['mobility'] = this.mobility;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
