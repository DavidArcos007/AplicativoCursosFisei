// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Curso {
  final String titulo;
  final String descripcion;
  final String imagen;
  final String tutor;
  final double precio;
  final double duracion;
  final bool comprado;
  const Curso({
    required this.titulo,
    required this.descripcion,
    required this.imagen,
    required this.tutor,
    required this.precio,
    required this.duracion,
    required this.comprado,
  });

  Curso copyWith({
    String? titulo,
    String? descripcion,
    String? imagen,
    String? tutor,
    double? precio,
    double? duracion,
    bool? comprado,
  }) {
    return Curso(
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      imagen: imagen ?? this.imagen,
      tutor: tutor ?? this.tutor,
      precio: precio ?? this.precio,
      duracion: duracion ?? this.duracion,
      comprado: comprado ?? this.comprado,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'titulo': titulo,
      'descripcion': descripcion,
      'imagen': imagen,
      'tutor': tutor,
      'precio': precio,
      'duracion': duracion,
      'comprado': comprado,
    };
  }

  factory Curso.fromMap(Map<String, dynamic> map) {
    return Curso(
      titulo: map['titulo'] as String,
      descripcion: map['descripcion'] as String,
      imagen: map['imagen'] as String,
      tutor: map['tutor'] as String,
      precio: map['precio'] as double,
      duracion: map['duracion'] as double,
      comprado: map['comprado'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Curso.fromJson(String source) => Curso.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Curso(titulo: $titulo, descripcion: $descripcion, imagen: $imagen, tutor: $tutor, precio: $precio, duracion: $duracion, comprado: $comprado)';
  }

  @override
  bool operator ==(covariant Curso other) {
    if (identical(this, other)) return true;
  
    return 
      other.titulo == titulo &&
      other.descripcion == descripcion &&
      other.imagen == imagen &&
      other.tutor == tutor &&
      other.precio == precio &&
      other.duracion == duracion &&
      other.comprado == comprado;
  }

  @override
  int get hashCode {
    return titulo.hashCode ^
      descripcion.hashCode ^
      imagen.hashCode ^
      tutor.hashCode ^
      precio.hashCode ^
      duracion.hashCode ^
      comprado.hashCode;
  }
}
