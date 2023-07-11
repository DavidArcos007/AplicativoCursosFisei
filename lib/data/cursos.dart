import '../models/curso.dart';

List<Curso> cursos = const [
  Curso(
    titulo: 'Curso de JavaScript',
    descripcion: 'Aprende JavaScript desde 0 a Experto',
    imagen: 'assets/img/js.jpeg',
    tutor: 'Andres Garcia',
    duracion: 40,
    precio: 23.5,
		comprado: false,
  ),
  Curso(
    titulo: 'PHP y HTML',
    descripcion: 'Aprende a Programar como un experto en PHP',
    imagen: 'assets/img/php.jpeg',
    tutor: 'David Arcos',
    duracion: 50,
    precio: 27.5,
		comprado: false,
  ),
  Curso(
    titulo: 'Curso Completo Python',
    descripcion: 'Desde las Bases hasta Django, Flask y Bases del lenguaje',
    imagen: 'assets/img/py.jpeg',
    tutor: 'Andres Flores',
    duracion: 60,
    precio: 87.5,
		comprado: false,
  ),
];
