// import 'package:jaynetwork/jaynetwork.dart';

class FailedResponseValue {
  String? message;

  FailedResponseValue({this.message});

  FailedResponseValue.fromJson(Map<String, dynamic> json) {
    if (json["message"] is String) this.message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["message"] = this.message;
    return data;
  }
}

// // handle network failures
// var _response;

// ApiResponse<dynamic> handleNetworkException(e) {
//   if (e?.response?.data != null) {
//     _response = FailedResponseValue.fromJson(e.response.data);

//     return ApiResponse.failure(
//         error: NetworkExceptions.getJayNetworkException(e)!,
//         statusMessage: _response?.message,
//         statusCode: e?.response?.statusCode);
//   } else {
//     return ApiResponse.failure(
//         error: NetworkExceptions.getJayNetworkException(e)!,
//         statusMessage: NetworkExceptions.getErrorMessage(
//             NetworkExceptions.getJayNetworkException(e)!));
//   }
// }
