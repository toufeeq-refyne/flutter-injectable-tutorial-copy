import 'package:injectable/injectable.dart';
import 'package:injectable_tutorial/infrastructure/%20core/local_storage/i_local_storage_handler_facade.dart';
import 'package:mocktail/mocktail.dart';

@Singleton(as: ILocalStorageHandlerFacade, env: [Environment.test])
class MockLocalStorageHandlerFacade extends Mock
    implements ILocalStorageHandlerFacade {}
