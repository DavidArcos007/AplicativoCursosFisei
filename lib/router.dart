import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import './screens/curso_details_screen.dart';
import './screens/cursos_screen.dart';
import './screens/login.dart';
import './screens/curso_comprar.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/cursos',
        name: 'cursos',
        builder: (context, state) => const CursosScreen(),
        routes: [
          GoRoute(
            path: ':index',
            name: 'curso',
            builder: (context, state) => CursoDetails(
              int.parse(state.params['index']!),
            ),
          ),
          GoRoute(
            path: ':index/comprar',
            name: 'comprar',
            builder: (context, state) => CursoComprar(
              int.parse(state.params['index']!),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const Login(),
      ),
    ],
  );
});
