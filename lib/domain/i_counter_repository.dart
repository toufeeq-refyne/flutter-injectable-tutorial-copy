import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/infrastructure/counter_repository.dart';
import 'package:injectable_tutorial/infrastructure/dev_counter_repository.dart';
import 'package:injectable_tutorial/injection.dart';

abstract class ICounterRepository {
  int getIncrement();
}
