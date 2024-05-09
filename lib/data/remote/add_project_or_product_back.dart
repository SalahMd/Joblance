import 'package:joblance/core/class/crud.dart';
import 'package:joblance/core/constants/links.dart';

class AddProjectOrProductBack {
  Crud crud;
  AddProjectOrProductBack(this.crud);
  postData(
    Map data,
    List files,
    var token,
  ) async {
    var response = await crud.requestDataWithHeaders(
      AppLinks.addProject, data,
        {'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNmI3NzJmMTUzNDM4Y2RlMzRjMWU3NWFlY2M0ZDE4MDgxN2Y1NWM2NjY1ODI0ZDA1NDYzM2ExZmYzMTE2ZmU4NDc2NTQxZjljYmJmZWIyMmMiLCJpYXQiOjE3MTQ1ODYxOTkuMzU4MzM2LCJuYmYiOjE3MTQ1ODYxOTkuMzU4MzM5LCJleHAiOjE3NDYxMjIxOTkuMzQ2NDA2LCJzdWIiOiIyIiwic2NvcGVzIjpbXX0.M3jT7WM1Hj8aY-vWDvM8kvorH5agJqtCe6lPenZmcd08h9QbQY4VMOSsiEdTDAmExqHtsQfOy1d9VrDd4SXRwh42PbA6L7nWOvBMYhjbsaAgOEYwJDCVPfohuJDl7iXKvaV0xO-4IRTxiybHPxaV_z196kLrO-sugqC9fpoDo6JLBvyNXodvx-5U0FUm3YlQxRm1Ef6imVWdWND4ERy2IaIMMDblYyw2xTf2juez3_4WnBiw9BbIebH_1IwIow9nHtxZnj40e0cTCmY2e32hDNSlYWcXUqnKyKbJ4zVwJbK5_H97-Ze3DNixJeKpgNwaQF9SrPI2W4UWoBd6Y1Yy_ZpqEUiJ5dXdnXPgjZGizEyDD8l2ID-OAIAivdUjcorHfGjF1fCjQIX-mAPHQ4idEq5ZDkmxRTqU0ys7Kmp2Nm2aVrHKlKNlNJFltZ1kHHWVIC0mH1bOjYDeDTw6Xk2Wwqi3yAL1XCAv5EgGSAnjK5jQn31CNVmInXir10eQQE8uouuM6ttmBb5hj0aMplvdXu-c8PqgxTKd7shnbz6n2eWBEf_T6WdWjPLRGMRuI2gYrVWo0AEK_brs42p31iGS_OoZZ5nV2H8I_NvQUowF79JMwTp442xxmbnXtoWmy8po4niMMQqgxZ6p7wU1J7XK3_s8TPppS8eqvgx4pmwJmyo'},
         "iamges",
          true,
           true,
files
            );
    return response.fold((l) => l, (r) => r);
  }
}
