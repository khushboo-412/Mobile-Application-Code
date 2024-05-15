// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps, unused_element
import 'package:kalaam/src/services/DataInfo.dart';
import 'package:kalaam/src/services/Library.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

getToken() async {
  final response = await http.post(
    Uri.parse(WebApis.AUTH_TOKEN),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    return jsonData;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    return jsonData;
  }
}

encryptData(var data) async {
  String rawJson = jsonEncode(data);
  final plainText = rawJson;

  final key = encrypt.Key.fromUtf8('7878tyefngfh9173');
  final iv = encrypt.IV.fromLength(16);
  final encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ecb));
  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base64.toString();
/*

    var getTokens = await getToken();

    final response = await http.post(
      Uri.parse(WebApis.ENCRYPT_DATA),
      body: json.encode(data),

      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
        "x-api-key": headerKey
      },
    );
    if (response.statusCode == 200) {
      final jsonData = response.body as String;
      print("encryptData" + jsonData.toString());

      return jsonData;
    } else {
      final jsonData = jsonDecode(response.body) as Map;
      print("encryptData" + jsonData.toString());
      return jsonData;
    }
  */
}

decrypt(var enc) {
  final key = encrypt.Key.fromUtf8('7878tyefngfh9173');
  final iv = encrypt.IV.fromLength(16);
  final encrypter =
      encrypt.Encrypter(encrypt.AES(key, mode: encrypt.AESMode.ecb));

  // final decrypted = encrypter.decrypt64("+GP6LbLdbjoQlC9NS1Ud1+GD+S7AqS3DfILogjcgZFA/ESUnn9TQjqMlxJpCWHmezjeyxZt0i7e5czFDrCKsIA==", iv: iv);
  final decrypted = encrypter.decrypt64(enc, iv: iv);

  return jsonDecode(decrypted) as Map;
  /* Map data = {
    "req_data" : enc
  };
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.DECRYPT_DATA),
    body: json.encode(data),

    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;
    print("decryptData" + jsonData.toString());

    return jsonData;
  } else {
    final jsonData = jsonDecode(response.body) as Map;
    print("decryptData" + jsonData.toString());
    return jsonData;
  }*/
}

login(var enc) async {
  try {
    Map data = {"req_data": enc.toString()};

    var getTokens = await getToken();

    final response = await http.post(
      Uri.parse(WebApis.LOGIN),
      body: json.encode(data),
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
        "x-api-key": headerKey
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map;

      Map data = decrypt(jsonData["res_data"].toString());
      print("fe:" + data.toString());
      return data;
    } else {
      final jsonData = jsonDecode(response.body) as Map;

      var data = await decrypt(jsonData["res_data"].toString());
      print("fe1:" + data.toString());

      return data as Map;
    }
  } catch (e) {
    print("error1:" + e.toString());
  }
}

outstandingGetAPI(var enc) async {
  Map data = {"req_data": enc.toString()};

  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.OUTSTANDING),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    var data = await decrypt(jsonData["res_data"].toString());

    return data as Map;
  }
}

signUp(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.SIGN_UP),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
 
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

updateProfileImage(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.PROFILE_IMAGE),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

verifyOTP(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.VERIFY_OTP),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

delAccount(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.ACCOUNT_DELETE),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  print("del acc");
  print(response.body);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}
sendRestoreOTP(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.ACCOUNT_RESTORE_OTP),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  print("del acc");
  print(response.body);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}
accRestore(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.ACCOUNT_RESTORE),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  print("del acc");
  print(response.body);

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}


customerAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CUSTOMER),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

customerBillsAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CUSTOMER),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

ticketAllMsgAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.TICKET_MSG_ALL),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

ticketReplyAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.TICKET_MSG_SEND),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

deleteCartAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CART_DELETE),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

updateProfileAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.UPDATE_PROFILE),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    // Map data  =  decrypt(jsonData["res_data"].toString());
    return jsonData;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    //Map data  =  decrypt(jsonData["res_data"].toString());

    return jsonData;
  }
}

updateUserNameApi(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.UPDATE_PROFILE_V1),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    // Map data  =  decrypt(jsonData["res_data"].toString());
    return jsonData;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    //Map data  =  decrypt(jsonData["res_data"].toString());

    return jsonData;
  }
}

createTicketAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.TICKET_CREATE),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

getSurveyStatusAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.GET_SURVEY_BY_STATUS),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

paymentURLgetAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.PAYMENT_URL_V2),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  print("response data:" + response.body.toString());

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

categoryGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CATEGORY),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

paymentBoxGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.PAYMENT_BOX),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

countryCodeGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.COUNTRY_CODE),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

ticketServiceGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.TICKET_SERVICES),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

ticketIssueGet(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.TICKET_ISSUE),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

ticketStatusGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.TICKET_STATUS),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    //  Map data  =  decrypt(jsonData["res_data"].toString());
    return jsonData['RETURN_DATA'];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    //Map data  =  decrypt(jsonData["res_data"].toString());

    return jsonData;
  }
}

contactAPI() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CONTACT_US),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

aboutAPI() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.ABOUT_US),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

bannerGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.BANNER),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

offerGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.OFFERS),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

offerGet1() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.OFFERS),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

surveyGet(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.SURVEY),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

surveyTriggerGet(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.SURVEY_TRIGGER),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

caseStudyListGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CASE_STUDIES_LIST),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

newsListGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.NEWS_LIST),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

faqListGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.FAQ),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

newsBannerGet() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.NEWS_BANNER),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data["RETURN_DATA"];
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

dashboardGet(var enc) async {
  Map data = {"req_data": enc};

  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.DASHBOARD),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

whatsappAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.WHATSAPP),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

forgotPassword(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.FORGET_PASSWORD),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

product(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.PRODUCT),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

addToCartAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.ADD_TO_CART_V1),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

updateToCartAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.UPDATE_CART),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

cartListAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CART_LIST),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

orderProceedAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.ORDER_PROCEED_V1),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

orderListAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.ORDER_LIST),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

getRequestList(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.GET_REQUEST),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

getRequestData(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.GET_REQUEST_DATA),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

ticketListAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.TICKET_LIST),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

notificationListAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.NOTIFICATION_LIST),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    if (data['RETURN_FLAG']) {
      return data["RETURN_DATA"];
    } else {
      return [];
    }
  } else {
    return [];
  }
}

resendOTP(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.RESEND_OTP),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

updatePassword(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.UPDATE_PASSWORD),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

changePassword(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CHANGE_PASSWORD),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

joinPartnerAPI(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.JOIN_AS_A_PARTNER),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

caseStudyDetails(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.CASE_STUDIES_DETAILS),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

subCat(var enc) async {
  Map data = {"req_data": enc};
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.SUB_CATEGORY),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
    return data;
  } else {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    return data;
  }
}

updateToken(var enc) async {
  Map data = {"req_data": enc};

  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.UPDATE_DEVICE_TOKEN),
    body: json.encode(data),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());
  }
}

appSession() async {
  var getTokens = await getToken();

  final response = await http.post(
    Uri.parse(WebApis.APP_SESSION),
    headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${getTokens['RETURN_DATA']}',
      "x-api-key": headerKey
    },
  );

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map;

    Map data = decrypt(jsonData["res_data"].toString());

    DataInfo.sessionTime.value =
        int.parse(data['RETURN_DATA']['app_session_time'].toString());
    DataInfo.sessionActive.value =
        data['RETURN_DATA']['app_session_status'] == "Y" ? true : false;
    final box = GetStorage();
    box.write('sessionTime', DataInfo.sessionTime.value);
    box.write('sessionActive', DataInfo.sessionActive.value);
  }
}
