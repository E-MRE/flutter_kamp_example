import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/utils/core_dependecies.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/views/cubit/auth_cubit.dart';
import 'package:flutter_kamp_example/dependency_injection-lesson-15-february/views/cubit/auth_state.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => getDependency<AuthCubit>(),
          child: BlocConsumer<AuthCubit, AuthState>(
              listener: _buildListener,
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(hintText: 'E-Posta'),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _passwordController,
                        decoration: const InputDecoration(hintText: 'Parola'),
                      ),
                      const SizedBox(height: 16),
                      _buildButton(context, state),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(BuildContext context, AuthState state) {
    return ElevatedButton(
      onPressed: () {
        context.read<AuthCubit>().login(
              _emailController.text,
              _passwordController.text,
            );
      },
      child: state is AuthLoading
          ? const CircularProgressIndicator()
          : const Text('Giriş Yap'),
    );
  }

  void _buildListener(BuildContext context, AuthState state) {
    if (state is AuthError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(state.message)),
      );
    } else if (state is AuthSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.green,
          content: Text('İşlem Başarılı!'),
        ),
      );
    }
  }
}
