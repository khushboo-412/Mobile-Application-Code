// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null, non_constant_identifier_names, prefer_interpolation_to_compose_strings, file_names, sized_box_for_whitespace, prefer_const_constructors, prefer_adjacent_string_concatenation, use_build_context_synchronously, unused_catch_clause, prefer_final_fields, unused_field, prefer_void_to_null, prefer_is_empty, avoid_unnecessary_containers, no_logic_in_create_state, must_be_immutable, unnecessary_this, annotate_overrides, no_leading_underscores_for_local_identifiers, unnecessary_new, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, void_checks, library_private_types_in_public_api, deprecated_member_use, unnecessary_string_interpolations, missing_required_param, sort_child_properties_last, unnecessary_brace_in_string_interps
import 'package:kalaam/src/services/Library.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
 

  // NotificationServices.showNotification(
  //     id: message.data.hashCode,
  //     title: message.data['title'],
  //     body: message.data['body'],
  //     payload: "event");
}

class NotificationServices {
  static Future<void> initialize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String token = await FirebaseMessaging.instance.getToken();
      if (token != null) {
        print("token:" + token);
        deviceId = token;
      }
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);

     
    }
  }

  static final _notification = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails('firebase_channel', 'channel name',
            channelDescription: 'channel description',
            color: Color(0xff50a700)),
        iOS: IOSNotificationDetails());
  }

  static Future init({bool initScheduled = false}) async {
    final android =
        AndroidInitializationSettings("@drawable/ic_launcher_foreground");
    final ios = IOSInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: ios);
    await _notification.initialize(settings,
        onSelectNotification: (payload) async {
      //onNotification.add(payload);
    });
  }

  static Future showNotification({
    int id = 0,
    String title,
    String body,
    String payload,
  }) async =>
      _notification.show(id, title, body, await _notificationDetails(),
          payload: payload);
}
