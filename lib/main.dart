import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skillswap/state/auth/providers/is_logged_in_provider.dart';
import 'package:skillswap/state/providers/is_loading_provider.dart';
import 'package:skillswap/utilities/components/loading/loading_screen.dart';
import 'package:skillswap/utilities/widgets/bottom_nav.dart';
import 'package:skillswap/views/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: '',
    anonKey: '',
  );

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

final supabase = Supabase.instance.client;

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Consumer(
        builder: (context, ref, child) {
          ref.listen(isLoadingProvider, (_, isLoading) {
            if (isLoading) {
              LoadingScreen.instance().show(
                context: context,
              );
            } else {
              LoadingScreen.instance().hide();
            }
          });
          final isLoggedIn = ref.watch(isLoggedInProvider);
          if (isLoggedIn) {
            return const BottomnavBar();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
