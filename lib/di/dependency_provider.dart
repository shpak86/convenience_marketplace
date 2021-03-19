import 'package:convenience_marketplace/domain/interactors/marketplace_interactor.dart';
import 'package:convenience_marketplace/domain/use_cases/use_case.dart';

class DependencyProvider {
  static DependencyProvider _instance = DependencyProvider._internal();

  UseCase _useCase = MarketplaceInteractor();

  UseCase get useCase => _useCase;

  factory DependencyProvider() {
    return _instance;
  }

  DependencyProvider._internal();
}
