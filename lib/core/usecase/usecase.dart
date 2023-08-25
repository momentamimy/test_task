import 'package:equatable/equatable.dart';

abstract class UseCase<T, Params> {

  Future<T> call(Params params);

}

/// Use it if your use case do not have parameters.
class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}


/// The type parameters you will create it in the use case that you will use
/// LIKE => GetAllChatsParams or
/// if it common type create it in common LIKE => FilterParams entity