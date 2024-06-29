import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class FollowBack {
  Crud crud;
  FollowBack(this.crud);
   followUser(
    String token,
    String id
  ) async {
    var response = await crud.postAndGetData(AppLinks.follow, {"user_id":id},
        {'Authorization': 'Bearer $token'}, null, true, false, null);
    return response.fold((l) => l, (r) => r);
  }
  unFollowUser(
    String token,
    String id
  ) async {
    var response = await crud.deleteData(AppLinks.follow+"?user_id="+id, {},
        {'Authorization': 'Bearer $token'});
    return response.fold((l) => l, (r) => r);
  }
}