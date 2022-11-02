import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/domain/i_counter_repository.dart';

@Injectable(as: ICounterRepository, env: [Environment.dev])
class DevCounterRepository implements ICounterRepository {
  @override
  int getIncrement() => 2;
}
