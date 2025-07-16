import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class JobApplicantsBack {
  Crud crud;
  JobApplicantsBack(this.crud);

  getApplicants(String token, String jobId,String lang) async {
    var response = await crud.postAndGetData(
        AppLinks.applayJob+"?job_detail_id="+jobId+"&lang="+lang,
        {},
        {
          'Authorization': 'Bearer $token',
        },
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
  acceptUser(String token, Map data) async {
    var response = await crud.postAndGetData(
        AppLinks.acceptedJobs,
        data,
        {
          'Authorization': 'Bearer $token',
        },
        null,
        true,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
     getData(
    String token,
    String id,
    String lang
  ) async {
    var response = await crud.postAndGetData(
        AppLinks.jobApplications+"/"+id+"?lang="+lang,
        {},
        {'Authorization': 'Bearer $token', "accept": "application/json"},
        null,
        false,
        false,
        null);
    return response.fold((l) => l, (r) => r);
  }
}
