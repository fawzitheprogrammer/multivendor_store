class StoreModel {
  final String? userId;
  final String? fullNameOnId;
  final String? profilePicture;
  final String? businessName;
  final String? shopType;
  final String? phoneNumber;
  final String? location;
  final String? idFrontSide;
  final String? idBackSide;
  final String? businessLicenseId;
  final bool? isApproved;
  final String? deviceToken;
  final bool? isRegistered;

  StoreModel(
      {this.fullNameOnId,
      this.profilePicture,
      this.businessName,
      this.shopType,
      this.phoneNumber,
      this.location,
      this.idFrontSide,
      this.idBackSide,
      this.businessLicenseId,
      this.isApproved,
      this.deviceToken,
      this.userId,
      this.isRegistered});

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      fullNameOnId: json['fullNameOnId'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      businessName: json['businessName'] ?? '',
      shopType: json['shopType'] ?? '',
      phoneNumber: json['phoneNumber'],
      location: json['location'] ?? '',
      idFrontSide: json['idFrontSide'] ?? '',
      idBackSide: json['idBackSide'] ?? '',
      businessLicenseId: json['licenseId'] ?? '',
      isApproved: json['isApproved'] ?? '',
      deviceToken: json['deviceToken'] ?? '',
      userId: json['userId'] ?? '',
      isRegistered: json['isRegistered'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullNameOnId': fullNameOnId,
      'profilePicture': profilePicture,
      'businessName': businessName,
      'shopType': shopType,
      'phoneNumber': phoneNumber,
      'location': location,
      'idFrontSide': idFrontSide,
      'idBackSide': idBackSide,
      'licenseId': businessLicenseId,
      'isApproved': isApproved,
      'deviceToken': deviceToken,
      'userId': userId,
      'isRegistered': isRegistered
    };
  }
}
