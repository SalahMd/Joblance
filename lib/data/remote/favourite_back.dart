import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class FavouriteBack {
  Crud crud;
  FavouriteBack(this.crud);

  addTaskAndJobsToFavourite(String token, bool isTask, Map data) async {
    var response = await crud.postAndGetData(
        isTask ? AppLinks.favouriteTask : AppLinks.favouriteJob,
        data,
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  addFreelancerToFavorite(String token, String id) async {
    var response = await crud.postAndGetData(
        AppLinks.favouriteFreelancer,
        {"freelancer_id": id},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }

  removeTaskAndJobsFromFavourite(String token, String id, bool isTask) async {
    var response = await crud.deleteData(
      isTask
          ? AppLinks.favouriteTask + "/" + id
          : AppLinks.favouriteJob + "/" + id,
      {},
      {'Authorization': 'Bearer $token', 'accept': 'application/json'},
    );
    return response.fold((l) => l, (r) => r);
  }

  removeFreelancerFromFavourite(String token, String id) async {
    var response = await crud.deleteData(
      AppLinks.favouriteFreelancer + "/" + id,
      {},
      {'Authorization': 'Bearer $token', 'accept': 'application/json'},
    );
    return response.fold((l) => l, (r) => r);
  }

  getFavourite(String token, String link) async {
    var response = await crud.postAndGetData(
        link,
        {},
        {'Authorization': 'Bearer $token', 'accept': 'application/json'},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
