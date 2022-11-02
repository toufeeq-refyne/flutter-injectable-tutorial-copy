import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/injection.dart';

import 'injection.config.dart';

// final GetIt getItTest = GetIt.instance;

@InjectableInit(generateForDir: ['test'])
void configureTestInjection(String environment) =>
    $initGetIt(getIt, environment: environment);

