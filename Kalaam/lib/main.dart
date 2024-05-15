// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, avoid_print, avoid_init_to_null

import 'package:kalaam/src/services/DataInfo.dart';
import 'package:kalaam/src/services/FirebaseOption.dart';
import 'package:kalaam/src/services/Library.dart';

String headerKey = "@%#^&)c58DHcm";
List caseStudyList = [];
String otpForget = "";
String isPartner = "";

String otpCreate = "";

String privacy = "";
String aboutUs = "";
bool isNewTicket = false;
bool isNewOrder = false;
List catList = [];
List selectTicketStatus = [];
List selectTicketName = [];
List ticketStatus = [];
bool accountDetails = false;
String userId = "";
File imageFile;
int productCount = 0;
int itemCount = 0;
double priceCount = 0.0;
String countryCode = "";

String base64Image;
String countryCodeID = "";
String countryShort = "";
List paymentBoxList = [];
String shortName = "";
String userName = "";
String payID = "";
String payerName = "";

List bills = [];
int pageLen = 0;
List invoice = [];
List history = [];
List<dynamic> billData = [];
String userImage = "";
String userEmail = "";
String userMobile = "";
bool showContact = false;
List payersList = [];
String contactNo = "";
String emailContact = "";
String firebaseId = "";
String deviceId = "";
int filterCount = 0;
bool newUser = true;
String countryCodeLength = "0";
String facbookUrl = "";
String instagramUrl = "";
String linkedinUrl = "";
String appVersion = "";
bool appStatePasue = false;
Timer timer;
Timer timer1;

DateTime date = DateTime.now();
String appStatus = "";
final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
List filters = ["Latest to Oldest"];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //       apiKey: "AIzaSyCINPwNnllyxP7kTx-a2oZdaGDnElpln8A",
  //       appId: "1:150419901289:android:8d18e9be4f0a547b628bf8",
  //       messagingSenderId: "150419901289",
  //       projectId: "kalaam-5339c"),
  // );
  await NotificationServices.initialize();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
  ));

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  AppLifecycleState _appLifecycleState;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    appStatePasue = false;
    NotificationServices.init();
    appSession();
    getInitialMessage();
    getVersion();

    FirebaseMessaging.onMessage.listen((event) {
      NotificationServices.showNotification(
          id: 0,
          title: event.notification.title,
          body: event.notification.body,
          payload: "event");

      // NotificationServices.showNotification(
      //     id: event.data.hashCode,
      //     title: event.data['title'].toString(),
      //     body: event.data['body'],
      //     payload: "event");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) {});
    super.initState();
  }

  void getInitialMessage() async {
    RemoteMessage message =
        await FirebaseMessaging.instance.getInitialMessage();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (DataInfo.sessionActive.value) {
      setState(() {
        timer.cancel();
        _appLifecycleState = state;
        try {
          if (_appLifecycleState == AppLifecycleState.paused ||
              _appLifecycleState == AppLifecycleState.inactive ||
              _appLifecycleState == AppLifecycleState.detached) {
            date = DateTime.now();
            appStatePasue = true;
            appStatus = _appLifecycleState.toString();

            timer = Timer.periodic(
                Duration(seconds: DataInfo.sessionTime.value),
                _capitalCallback);
            CustomWidgets.setSession();
          } else {
            //  CustomWidgets.setSession();
            //_loginUser(navigatorKey.currentContext);

            setState(() {
              appStatus = _appLifecycleState.toString();
              appStatePasue = false;
            });
          }
        } catch (e) {
          // ignore: prefer_interpolation_to_compose_strings
          print("error:" + e.toString());
        }
      });
    }
  }

  void _capitalCallback(timer) {
    if (DataInfo.sessionActive.value) {
      if (appStatePasue == true) {
        timer.cancel();

        setState(() {
          CustomWidgets.checkSession();
          Navigator.push(
              navigatorKey.currentContext,
              MaterialPageRoute(
                builder: (BuildContext context) => Login(),
              ));
        });
      } else {
        timer.cancel();
      }
    }
  }

  // You'll probably want to wrap this function in a debounce
  void _handleUserInteraction([_]) {
    if (DataInfo.sessionActive.value) {
      if (timer != null) {
        if (!timer.isActive) {
          // This means the user has been logged out
          return;
        }

        timer.cancel();
      }

      if (timer != null) {
        CustomWidgets.initializeTimer();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleUserInteraction,
      onPanDown: _handleUserInteraction,
      onScaleStart: _handleUserInteraction,
      child: FutureBuilder(
        future: _loginUser(context),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Kalaam',
              home: Home(),
              theme: ThemeData(
                scaffoldBackgroundColor: Constants.backgroundWhiteColor,
              ),
              navigatorKey: navigatorKey,
            );
          } else if (snapshot.data == false) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Kalaam',
              home: IntroPlaceholder(),
              theme: ThemeData(
                scaffoldBackgroundColor: Constants.backgroundWhiteColor,
              ),
              navigatorKey: navigatorKey,
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: Container(color: Colors.white, child: SplashLoad()),
              navigatorKey: navigatorKey,
            );
          }
        },
      ),
    );
  }

  Future _loginUser(BuildContext context) async {
    String userEmaila = null;
    String userPassw = null;
    //  await Future.delayed(Duration(seconds: 2));
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // if (DataInfo.sessionActive.value) {
    //   if (appStatus != "AppLifecycleState.paused" &&
    //       appStatus != "AppLifecycleState.resumed" &&
    //       appStatus != "AppLifecycleState.inactive") {
    //     await CustomWidgets.checkSession();
    //   }
    // }

    try {
      userEmaila = sharedPreferences.getString("userEmail");
      userPassw = sharedPreferences.getString("userPass");
      if (userEmaila == "" ||
          userEmaila == null ||
          userPassw == "" ||
          userPassw == null) {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }

    var enc = await encryptData({
      "email": userEmaila,
      "password": userPassw,
    });
    var dataSignUp = await login(enc);

    if (dataSignUp["RETURN_FLAG"] == true) {
      // CustomWidgets.initializeTimer();
      userId = dataSignUp["RETURN_DATA"]['id'];
      userName = dataSignUp["RETURN_DATA"]['name'];
      userEmail = dataSignUp["RETURN_DATA"]['email'];
      userMobile = dataSignUp["RETURN_DATA"]['phone'];
      countryCode = dataSignUp["RETURN_DATA"]['country_code'];
      countryCodeLength = dataSignUp["RETURN_DATA"]['phone_max_lenght'];
      countryCodeID = dataSignUp["RETURN_DATA"]['country_id'];
      countryShort = dataSignUp["RETURN_DATA"]['sortname'];
      newUser = dataSignUp["RETURN_DATA"]['type'] == "1" ? true : false;

      isPartner = dataSignUp["RETURN_DATA"]['partner'];
      userImage = dataSignUp["RETURN_DATA"]['image'].toString() == "null"
          ? ""
          : WebApis.SERVER_URL + dataSignUp["RETURN_DATA"]['image'];
      firebaseId = dataSignUp["RETURN_DATA"]['firebase_id'];
      deviceId = await FirebaseMessaging.instance.getToken();

      if (CustomWidgets.checkValidString(
                  dataSignUp["RETURN_DATA"]['firebase_id']) ==
              false ||
          CustomWidgets.checkValidString(
                  dataSignUp["RETURN_DATA"]['device_id']) ==
              false) {
        await FirebaseServices.checkUser(userEmail, "12345678");
        var enc = await encryptData({
          "user_id": userId,
          "firebase_id": firebaseId,
          "device_id": deviceId,
        });

        await updateToken(enc);
      }
      if (dataSignUp["RETURN_DATA"]['firebase_id'] != firebaseId) {
        await FirebaseServices.checkUser(userEmail, "12345678");
        var enc = await encryptData({
          "user_id": userId,
          "firebase_id": firebaseId,
          "device_id": deviceId,
        });

        await updateToken(enc);
      }

      return true;
    } else {
      return false;
    }
  }

  void getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    appVersion = packageInfo.version;
  }
}

class LoadingIm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: navigatorKey,
      home: Scaffold(
        backgroundColor: Constants.greenColor,
        body: Center(
          child: Image.asset("images/logoW.png"),
        ),
      ),
    );
  }
}
