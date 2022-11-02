import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/domain/i_counter_repository.dart';

@Injectable(as: ICounterRepository, env: [Environment.prod])
class CounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 1;
}
