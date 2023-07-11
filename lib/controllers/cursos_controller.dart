// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cursos_fisei_movil/data/cursos.dart';
import 'package:cursos_fisei_movil/models/curso.dart';

final cursosControllerProvider = StateNotifierProvider<CursosControllerNotifier, CursosState>((ref) {
  final state = CursosState(cursos: cursos, cursosFiltrados: cursos);
  return CursosControllerNotifier(state);
});

class CursosControllerNotifier extends StateNotifier<CursosState> {
  CursosControllerNotifier(super.state);
  marcarComprado(int index) {
    state = state.copyWith(cursos: [
      for (int i = 0; i < state.cursos.length; i++)
        if (i == index) state.cursos[i].copyWith(comprado: true) else state.cursos[i]
    ]);
    filter();
  }
setFilter(String value){
	state = state.copyWith(filter: value);
	filter();
}
  filter() {
    state = state.copyWith(
        cursosFiltrados: state.cursos.where((element) {
      return element.titulo.toLowerCase().contains(state.filter.toLowerCase()) ||
          element.descripcion.toLowerCase().contains(state.filter.toLowerCase());
    }).toList());
  }
}

class CursosState {
  final List<Curso> cursos;
  final List<Curso> cursosFiltrados;
  final String filter;
  CursosState({
    required this.cursos,
    required this.cursosFiltrados,
    this.filter = '',
  });

  CursosState copyWith({
    List<Curso>? cursos,
    List<Curso>? cursosFiltrados,
    String? filter,
  }) {
    return CursosState(
      cursos: cursos ?? this.cursos,
      cursosFiltrados: cursosFiltrados ?? this.cursosFiltrados,
      filter: filter ?? this.filter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cursos': cursos.map((x) => x.toMap()).toList(),
      'cursosFiltrados': cursosFiltrados.map((x) => x.toMap()).toList(),
      'filter': filter,
    };
  }

  factory CursosState.fromMap(Map<String, dynamic> map) {
    return CursosState(
      cursos: List<Curso>.from(
        (map['cursos'] as List<int>).map<Curso>(
          (x) => Curso.fromMap(x as Map<String, dynamic>),
        ),
      ),
      cursosFiltrados: List<Curso>.from(
        (map['cursosFiltrados'] as List<int>).map<Curso>(
          (x) => Curso.fromMap(x as Map<String, dynamic>),
        ),
      ),
      filter: map['filter'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CursosState.fromJson(String source) => CursosState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CursosState(cursos: $cursos, cursosFiltrados: $cursosFiltrados, filter: $filter)';

  @override
  bool operator ==(covariant CursosState other) {
    if (identical(this, other)) return true;

    return listEquals(other.cursos, cursos) &&
        listEquals(other.cursosFiltrados, cursosFiltrados) &&
        other.filter == filter;
  }

  @override
  int get hashCode => cursos.hashCode ^ cursosFiltrados.hashCode ^ filter.hashCode;
}
