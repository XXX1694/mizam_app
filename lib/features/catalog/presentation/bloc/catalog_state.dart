part of 'catalog_bloc.dart';

class CatalogState extends Equatable {
  const CatalogState();

  @override
  List<Object> get props => [];
}

class ConnectionError extends CatalogState {}

class CatalogInitial extends CatalogState {}

class CatalogGetting extends CatalogState {}

class CatalogGot extends CatalogState {
  // ignore: non_constant_identifier_names
  final List<Catalog> category_list;
  const CatalogGot(this.category_list);
}

class CatalogGetError extends CatalogState {}
