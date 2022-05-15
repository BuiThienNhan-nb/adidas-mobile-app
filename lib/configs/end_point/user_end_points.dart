class UserEndPoint {
  static updateUserInfor(String id) => "user/updateUserInfor/$id";

  static addUserAddress(String id) => "user/addUserAddress/$id";
  static updateUserAddress(String id) => "user/updateUserAddress/$id";

  static uploadAvatar(String id) => "user/avatar/$id";
  static getUserAddress(String id) => "user/getUserAddress/$id";
  static getUserById(String id) => "user/getUserById/$id";
}
