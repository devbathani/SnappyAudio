import 'package:provider/provider.dart';
import 'package:snappyaudio/providers/home-screen/home_provider.dart';

final providers = [
  ChangeNotifierProvider<HomeScreenProvider>(
    create: (context) => HomeScreenProvider(),
    lazy: false,
  ),
];
