import 'package:desafio_snapfi/core/routes/navigation_service.dart';
import 'package:desafio_snapfi/core/utils/snack_bar_service.dart';
import 'package:desafio_snapfi/src/pokedex/data/repositories/pokedex_repository_impl.dart';
import 'package:desafio_snapfi/src/pokedex/domain/repositories/pokedex_repository.dart';
import 'package:desafio_snapfi/src/pokedex/domain/usecases/get_list_pokedex.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/provider/pokedex_state.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton(NavigationService());

  locator.registerSingleton<SnackbarService>(SnackbarService());

  locator.registerSingleton<PokedexRepository>(
    PokedexRepositoryImpl(),
  );

  locator.registerSingleton<PokedexState>(PokedexState());

  locator.registerSingleton<GetListPokedexUseCase>(
    GetListPokedexUseCase(),
  );
}


