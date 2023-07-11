import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
					padding: const EdgeInsets.all(16.0),
					child: ConstrainedBox(
						constraints: const BoxConstraints(maxWidth: 560),
						child: Form(
							key: _formKey,
							child: Column(
								mainAxisSize: MainAxisSize.min,
								children: [
									const SizedBox.square(dimension: 10),
									Image.asset('assets/img/img-login.jpeg', height: 200),
									const SizedBox.square(dimension: 10),
									TextFormField(
										decoration: const InputDecoration(
											hintText: 'Email',
										),
										validator: (value) {
											if (value == null || value.isEmpty) {
												return 'El email es requerido';
											}
											if (!value.contains('@')) return "El email no es válido";
											return null;
										},
									),
									const SizedBox.square(dimension: 10),
									TextFormField(
										decoration: const InputDecoration(
											hintText: 'Clave',
										),
										validator: (value) {
											if (value == null || value.isEmpty) {
												return 'La clave es requerida';
											}
											return null;
										},
										obscureText: true,
									),
									const SizedBox.square(dimension: 36),
									ElevatedButton(
										onPressed: () {
											if (_formKey.currentState!.validate()) {
												context.goNamed('cursos');
											}
										},
										child: const SizedBox(
											width: double.infinity,
											child: Text(
												'Login',
												textAlign: TextAlign.center,
											),
										),
									),
									const SizedBox.square(dimension: 10),
								],
							),
						),
					),
				),
      ),
    );
  }
}
