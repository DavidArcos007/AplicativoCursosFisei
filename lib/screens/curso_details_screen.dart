import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/cursos_controller.dart';

class CursoDetails extends ConsumerWidget {
  const CursoDetails(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final cursosState = ref.watch(cursosControllerProvider);
final cursos = cursosState.cursos;
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text(
          'Detalles del curso',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Hero(
                tag: '$index',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    cursos[index].imagen,
                    fit: BoxFit.cover,
                    height: 350,
                  ),
                ),
              ),
            ),
            Text(
              cursos[index].titulo,
              style: textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(cursos[index].precio.toString(),
                            style: textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold, color: colorScheme.secondary)),
                        const Text(
                          'Precio',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(cursos[index].duracion.toInt().toString(),
                            style: textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.bold, color: colorScheme.secondary)),
                        const Text(
                          'Horas',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Detalles:',
              style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
            ),
            const SizedBox(height: 10),
            Text(
              cursos[index].descripcion,
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
            ),
            const SizedBox(height: 24),
            Text(
              'Tutor:',
              style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
            ),
            const SizedBox(height: 10),
            Text(
              cursos[index].tutor,
              style: textTheme.bodyLarge!.copyWith(color: colorScheme.primary),
            ),
            const SizedBox(height: 36),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  cursos[index].comprado
                      ? Text(
                          "Ya es tuyo!",
                          style:
                              textTheme.bodyLarge!.copyWith(color: colorScheme.tertiary, fontWeight: FontWeight.bold),
                        )
                      : FilledButton(
                          onPressed: () => context.goNamed(
                            'comprar',
                            params: {'index': '$index'},
                          ),
                          child: const Text('Comprar Curso'),
                        ),
                ],
              ),
            ),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ if (cursos[index].comprado)
              QrImage(
                data: "/cursos/$index",
                version: QrVersions.auto,
                size: 200.0,
              ),])
            // Text('headlineLarge', style: textTheme.headlineLarge),
            // Text('headlineMedium', style: textTheme.headlineMedium),
            // Text('headlineSmall', style: textTheme.headlineSmall),
            // Text('labelLarge', style: textTheme.labelLarge),
            // Text('labelMedium', style: textTheme.labelMedium),
            // Text('labelSmall', style: textTheme.labelSmall),
            // Text('bodyLarge', style: textTheme.bodyLarge),
            // Text('bodyMedium', style: textTheme.bodyMedium),
            // Text('bodySmall', style: textTheme.bodySmall),
            // Text('titleLarge', style: textTheme.titleLarge),
            // Text('titleMedium', style: textTheme.titleMedium),
            // Text('titleSmall', style: textTheme.titleSmall),
            // Text('displayLarge', style: textTheme.displayLarge),
            // Text('displayMedium', style: textTheme.displayMedium),
            // Text('displaySmall', style: textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
