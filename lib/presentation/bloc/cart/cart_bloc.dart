import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/error_handler.dart';
import '../../../domain/usecases/add_to_cart_use_case.dart';
import '../../../domain/usecases/decrease_cutlery_count_use_case.dart';
import '../../../domain/usecases/decrease_product_quantity_use_case.dart';
import '../../../domain/usecases/fetch_cart_items_use_case.dart';
import '../../../domain/usecases/get_cutlery_count_use_case.dart';
import '../../../domain/usecases/increase_cutlery_count_use_case.dart';
import '../../../domain/usecases/increase_product_quantity_use_case.dart';
import '../../models/product_ui_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCartUseCase addToCartUseCase;
  final DecreaseCutleryCountUseCase decreaseCutleryCountUseCase;
  final DecreaseProductQuantityUseCase decreaseProductQuantityUseCase;
  final FetchCartItemsUseCase fetchCartItemsUseCase;
  final GetCutleryCountUseCase getCutleryCountUseCase;
  final IncreaseCutleryCountUseCase increaseCutleryCountUseCase;
  final IncreaseProductQuantityUseCase increaseProductQuantityUseCase;

  int cutleryCount = 1;

  CartBloc(
    this.addToCartUseCase,
    this.decreaseCutleryCountUseCase,
    this.decreaseProductQuantityUseCase,
    this.fetchCartItemsUseCase,
    this.getCutleryCountUseCase,
    this.increaseCutleryCountUseCase,
    this.increaseProductQuantityUseCase,
  ) : super(CartLoading()) {
    on<AddProductToCart>((event, emit) async {
      emit(CartLoading());

      try {
        final result =
            await addToCartUseCase(event.product.toEntity(), event.quantity);

        await result.fold(
          (error) async {
            emit(CartError(ErrorHandler.getErrorMessage(error)));
          },
          (_) async {
            final cartItemsResult = await fetchCartItemsUseCase();

            await cartItemsResult.fold(
              (error) async {
                emit(CartError(ErrorHandler.getErrorMessage(error)));
              },
              (cartItems) async {
                final uiModels = cartItems.map((entity) {
                  return ProductUiModel.fromEntity(entity);
                }).toList();

                emit(CartSuccess(uiModels, cutleryCount: cutleryCount));
              },
            );
          },
        );
      } catch (e) {
        emit(CartError(ErrorHandler.getErrorMessage(e)));
      }
    });

    on<IncreaseProductQuantity>((event, emit) async {
      emit(CartLoading());

      final result =
          await increaseProductQuantityUseCase(event.product.toEntity());

      await result.fold(
        (error) async {
          emit(CartError(ErrorHandler.getErrorMessage(error)));
        },
        (_) async {
          final cartItemsResult = await fetchCartItemsUseCase();
          await cartItemsResult.fold(
            (error) async {
              emit(CartError(ErrorHandler.getErrorMessage(error)));
            },
            (cartItems) async {
              emit(CartSuccess(
                cartItems.map((e) => ProductUiModel.fromEntity(e)).toList(),
                cutleryCount: cutleryCount,
              ));
            },
          );
        },
      );
    });

    on<DecreaseProductQuantity>((event, emit) async {
      emit(CartLoading());

      final result =
          await decreaseProductQuantityUseCase(event.product.toEntity());

      await result.fold(
        (error) async {
          emit(CartError(ErrorHandler.getErrorMessage(error)));
        },
        (_) async {
          final cartItemsResult = await fetchCartItemsUseCase();
          await cartItemsResult.fold(
            (error) async {
              emit(CartError(ErrorHandler.getErrorMessage(error)));
            },
            (cartItems) async {
              emit(CartSuccess(
                cartItems.map((e) => ProductUiModel.fromEntity(e)).toList(),
                cutleryCount: cutleryCount,
              ));
            },
          );
        },
      );
    });

    on<FetchCartItemsEvent>((event, emit) async {
      emit(CartLoading());

      final cartItemsResult = await fetchCartItemsUseCase();

      await cartItemsResult.fold(
        (error) async {
          emit(CartError(ErrorHandler.getErrorMessage(error)));
        },
        (cartItems) async {
          final cutleryCountResult = await getCutleryCountUseCase();
          await cutleryCountResult.fold((error) async {
            emit(CartError(ErrorHandler.getErrorMessage(error)));
          }, (count) async {
            cutleryCount = count;
            emit(CartSuccess(
              cartItems
                  .map((entity) => ProductUiModel.fromEntity(entity))
                  .toList(),
              cutleryCount: cutleryCount,
            ));
          });
        },
      );
    });

    on<IncreaseCutleryCount>((event, emit) async {
      final result = await increaseCutleryCountUseCase();
      result.fold(
        (error) async {
          emit(CartError(ErrorHandler.getErrorMessage(error)));
        },
        (_) {
          cutleryCount++;
          if (state is CartSuccess) {
            emit(CartSuccess((state as CartSuccess).cartItems,
                cutleryCount: cutleryCount));
          }
        },
      );
    });

    on<DecreaseCutleryCount>((event, emit) async {
      if (cutleryCount > 1) {
        final result = await decreaseCutleryCountUseCase();
        result.fold(
          (error) async {
            emit(CartError(ErrorHandler.getErrorMessage(error)));
          },
          (_) {
            cutleryCount--;
            if (state is CartSuccess) {
              emit(CartSuccess((state as CartSuccess).cartItems,
                  cutleryCount: cutleryCount));
            }
          },
        );
      }
    });
  }
}
