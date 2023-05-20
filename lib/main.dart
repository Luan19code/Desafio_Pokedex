import 'package:desafio_snapfi/core/routes/app_routes.dart';
import 'package:desafio_snapfi/core/routes/navigation_service.dart';
import 'package:desafio_snapfi/core/utils/get_it_menager.dart';
import 'package:desafio_snapfi/core/utils/custom_colors.dart';
import 'package:desafio_snapfi/core/utils/snack_bar_service.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/screens/details_page.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/screens/pokedex_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      scaffoldMessengerKey: locator<SnackbarService>().messengerKey,
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.home: (context) => const PokedexPage(),
        AppRoutes.details: (context) => const DetailsPage(),
      },
      theme: ThemeData(
        primaryColor: CustomColors.primary,
      ),
    );
  }
}
