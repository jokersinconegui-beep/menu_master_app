import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/injection_container.dart';
import 'app/router.dart';
import 'core/themes/app_theme.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 🔥 IMPORTANTE: Configurar dependencias ANTES de correr la app
  await configureDependencies();
  
  runApp(const MenuMasterApp());
}

class MenuMasterApp extends StatelessWidget {
  const MenuMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: MaterialApp.router(
        title: 'MenuMaster',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}