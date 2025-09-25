import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:pizza_app/screens/auth/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:pizza_app/screens/auth/views/welcome_screen.dart';
import 'package:pizza_app/screens/home/views/home_screen.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza Delivery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey.shade100,
          brightness: Brightness.light,
          primary: Colors.blue,
          // onSurface: Colors.black,
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.authenticad) {
            return BlocProvider(
              create: (context) =>
                  SignInBloc(context.read<AuthenticationBloc>().userRepository),
              child: HomeScreen(),
            );
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
