import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class JobApplicantsBack {
  Crud crud;
  JobApplicantsBack(this.crud);

  getApplicants(String token, String jobId,String lang) async {
    var response = await crud.postAndGetData(
        AppLinks.applayJob+"/?job_detail_id="+jobId+"&lang="+lang,
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
}
