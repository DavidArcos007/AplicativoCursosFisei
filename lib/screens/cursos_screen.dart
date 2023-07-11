import 'package:cursos_fisei_movil/controllers/cursos_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CursosScreen extends ConsumerWidget {
  const CursosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final cursosState = ref.watch(cursosControllerProvider);
    final cursos = cursosState.cursosFiltrados;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                ref.read(cursosControllerProvider.notifier).setFilter(value);
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Buscar',
              ),
            ),
            const SizedBox.square(dimension: 20),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  mainAxisExtent: 300,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: cursos.length,
                itemBuilder: (context, index) {
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 8,
                    child: InkWell(
                      onTap: () => context.goNamed('curso', params: {'index': '$index'}),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Hero(
                            tag: '$index',
                            child: Image.asset(
                              cursos[index].imagen,
                              fit: BoxFit.cover,
                              height: 150,
                              width: double.infinity,
                            ),
                          ),
                          ListTile(
                            title: Text(cursos[index].titulo),
                            subtitle: Text(
                              cursos[index].descripcion,
                              softWrap: false,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            isThreeLine: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.50),
                                    child: FittedBox(
                                      child: Text("\$ ${cursos[index].precio}"),
                                    ),
                                  ),
                                ),
                                cursos[index].comprado
                                    ? Text(
                                        "Ya es tuyo!",
                                        style: textTheme.bodyMedium!
                                            .copyWith(color: colorScheme.tertiary, fontWeight: FontWeight.bold),
                                      )
                                    : ElevatedButton(
                                        onPressed: () => context.goNamed(
                                          'comprar',
                                          params: {'index': '$index'},
                                        ),
                                        child: const SizedBox(
                                          width: 120,
                                          height: 30,
                                          child: Center(
                                            child: Text('Comprar curso'),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
