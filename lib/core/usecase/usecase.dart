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
