import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class FollowBack {
  Crud crud;
  FollowBack(this.crud);
  followUser(String token, String id) async {
    var response = await crud.postAndGetData(
        AppLinks.follow,
        {"user_id": id},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  unFollowUser(String token, String id) async {
    var response = await crud.deleteData(AppLinks.follow + "/" + id, {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'});
    return response.fold((l) => l, (r) => r);
  }
}
