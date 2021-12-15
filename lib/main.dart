import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learningapp/learner/Screens/al_fatihah/list.languages.screen.dart';
import 'package:learningapp/learner/Screens/others/learner_walk_through.dart';
import 'package:learningapp/learner/Screens/al_fatihah/quizzes.dart';
import 'package:provider/provider.dart';

import 'Landing.page.dart';
import 'Provider/user.provider.dart';
import 'learner/Screens/al_fatihah/alfatihah.home.screen.dart';
import 'learner/Screens/others/learner_sign_up.dart';
import 'learner/Screens/others/learner_dashboard.dart';
import 'learner/Screens/others/learner_login.dart';
import 'learner/Screens/payment/test.payment.dart';
import 'main/store/app_store.dart';
import 'main/utils/AppTheme.dart';

AppStore appStore = AppStore();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final appUser = AppUser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppUser>.value(value: appUser),
      ],
      child: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: !appStore.isDarkModeOn
                  ? AppThemeData.lightTheme
                  : AppThemeData.darkTheme,
              home: LandingPage(),
              routes: {
                // '/': (context) => LearnerWalkThrough(),
                '/welcome': (context) => LearnerWalkThrough(),
                '/alfatihah': (context) => AlFatihahScreen(),
                '/test': (context) => TestPayment(),
                '/dashboard': (context) => LearnerDashboard(),
                '/listlanguages': (context) => const ListLanguagesScreen(),
                '/signup': (context) => LearnerSignUp(),
                '/quiz': (context) => const Quizzes(),
                '/login': (context) => WillPopScope(
                    onWillPop: () async => false, child: LearnerLogin()),
                '/register': (context) => WillPopScope(
                    onWillPop: () async => false, child: const LearnerSignUp()),
              },
              localeResolutionCallback: (locale, supportedLocales) => locale,
              locale: Locale(appStore.selectedLanguageCode),
            );
          }),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    testFirebase();
    super.initState();
  }

  testFirebase() async {
    final initApp = await Firebase.initializeApp();
    print(initApp);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
