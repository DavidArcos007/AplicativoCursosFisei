import 'package:cursos_fisei_movil/controllers/cursos_controller.dart';
import 'package:cursos_fisei_movil/data/cursos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final isStudentProvider = StateProvider<bool>((ref) => false);

class CursoComprar extends ConsumerWidget {
  const CursoComprar(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final bool isStudent = ref.watch(isStudentProvider);
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: const Text(
          'Comprar curso',
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                  tag: '$index',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      cursos[index].imagen,
                      fit: BoxFit.cover,
                      height: 150,
                      width: double.infinity,
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
                          Text(cursos[index].tutor,
                              style: textTheme.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.bold, color: colorScheme.secondary)),
                          const Text(
                            'Tutor',
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
              const Divider(height: 32),
              Text(
                'Datos personales:',
                style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.bold, color: colorScheme.primary),
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Nombres')),
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Apellidos')),
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Nro. Cedula')),
              ),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                title: const Text('Es estudiante'),
                value: isStudent,
                onChanged: (value) {
                  ref.read(isStudentProvider.notifier).state = !isStudent;
                },
              ),
              DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  children: [
                    const TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.attach_money), text: 'Transferencia'),
                        Tab(icon: Icon(Icons.credit_card), text: 'T. credito/debito'),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      child: TabBarView(
                        children: [
                          //transferencia
                          Center(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: const Text('Adjutar comprobante.'),
                            ),
                          ),
                          //Tarjeta credito/debito
                          Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(label: Text('Nro. tarjeta')),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: TextFormField(
                                      decoration: const InputDecoration(label: Text('Codigo seguridad')),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Flexible(
                                    flex: 6,
                                    child: TextFormField(
                                      decoration: const InputDecoration(label: Text('Fecha caducidad')),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: const Text('Confirmacion de compra'),
                              content: const Text('Se ha comprado el curso con exito.'),
                              actions: [
                                TextButton(
                                  child: const Text('Aceptar'),
                                  onPressed: () {
                                    ref.read(cursosControllerProvider.notifier).marcarComprado(index);
                                    context.goNamed('curso', params: {'index': '$index'});
                                  },
                                )
                              ]);
                        },
                      );
                    },
                    child: const Text('Generar orden de pago'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
