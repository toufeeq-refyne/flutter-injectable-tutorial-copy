import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/domain/i_counter_repository.dart';
import 'package:mocktail/mocktail.dart';

@Injectable(as: ICounterRepository, env: [Environment.test])
class MockCounterRepository extends Mock implements ICounterRepository {}
