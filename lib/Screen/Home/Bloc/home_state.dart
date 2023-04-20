import 'package:demo_block/model/api_res_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  List<Object?> get props => [];
}

class ApiSuccessState extends HomeState {
  final ApiResModel apiResModel;
  final String? key;

  const ApiSuccessState({required this.apiResModel, this.key});

  @override
  List<Object> get props => [];
}

class LoaderState extends HomeState {
  const LoaderState();

  @override
  List<Object> get props => [];
}

class ErrorState extends HomeState {
  final String? errorMessage;

  const ErrorState({this.errorMessage});

  @override
  List<Object> get props => [];
}

class EmptyState extends HomeState {
  const EmptyState();

  @override
  List<Object> get props => [];
}

class PageNotFound extends HomeState {
  const PageNotFound();

  @override
  List<Object> get props => [];
}
