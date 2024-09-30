import '../../core/constants/drawables.dart';
import '../../core/constants/strings.dart';
import '../models/info_model.dart';
import '../models/product_model.dart';

class DummyData {
  DummyData._();

  static const List<String> categories = [
    Strings.salads,
    Strings.pizza,
    Strings.beverages,
    Strings.snacks,
  ];

  static List<ProductModel> hitOfWeekProducts = products[Strings.pizza]!;

  static List<InfoModel> productInfoList = [
    InfoModel(
      id: 501,
      unit: "kcal",
      value: "325",
    ),
    InfoModel(
      id: 502,
      unit: "grams",
      value: "420",
    ),
    InfoModel(
      id: 503,
      unit: "proteins",
      value: "21",
    ),
    InfoModel(
      id: 504,
      unit: "fats",
      value: "19",
    ),
    InfoModel(
      id: 505,
      unit: "carbs",
      value: "65",
    ),
  ];

  static Map<String, List<ProductModel>> products = {
    Strings.salads: [
      ProductModel(
        id: 101,
        name: "Poke with chicken 1",
        price: 7.00,
        currency: Strings.defaultCurrency,
        image: Drawables.banana,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 102,
        name: "Poke with chicken 2",
        price: 25.00,
        currency: Strings.defaultCurrency,
        image: Drawables.fruitsPlate,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 103,
        name: "Poke with chicken 3",
        price: 20.00,
        currency: Strings.defaultCurrency,
        image: Drawables.tomato,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 104,
        name: "Poke with chicken 4",
        price: 55.00,
        currency: Strings.defaultCurrency,
        image: Drawables.salad2,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
    ],
    Strings.pizza: [
      ProductModel(
        id: 201,
        name: "Two slices of pizza with delicious salami",
        price: 12.40,
        currency: Strings.defaultCurrency,
        image: Drawables.pizza,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 202,
        name: "Salad with egg, cheese and shrims",
        price: 9.25,
        currency: Strings.defaultCurrency,
        image: Drawables.foodPlate,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 203,
        name: "Two slices of pizza ",
        price: 5.40,
        currency: Strings.defaultCurrency,
        image: Drawables.indianChutney,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 204,
        name: "cheese and shrims 4",
        price: 6.00,
        currency: Strings.defaultCurrency,
        image: Drawables.salad2,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
    ],
    Strings.beverages: [
      ProductModel(
        id: 301,
        name: "Green Tea 1",
        price: 11.00,
        currency: Strings.defaultCurrency,
        image: Drawables.lime,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 302,
        name: "Green Tea 2",
        price: 5.00,
        currency: Strings.defaultCurrency,
        image: Drawables.lemon,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 303,
        name: "Green Tea 3",
        price: 5.00,
        currency: Strings.defaultCurrency,
        image: Drawables.soup,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 304,
        name: "Green Tea 4",
        price: 5.00,
        currency: Strings.defaultCurrency,
        image: Drawables.sweetBowl,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
    ],
    Strings.snacks: [
      ProductModel(
        id: 401,
        name: "Fries with ketchup 1",
        price: 7.00,
        currency: Strings.defaultCurrency,
        image: Drawables.greenApples,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 402,
        name: "Fries with ketchup 2",
        price: 6.00,
        currency: Strings.defaultCurrency,
        image: Drawables.napoliBread,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 403,
        name: "Fries with ketchup 3",
        price: 8.00,
        currency: Strings.defaultCurrency,
        image: Drawables.indianChutney,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
      ProductModel(
        id: 404,
        name: "Fries with ketchup 4",
        price: 9.00,
        currency: Strings.defaultCurrency,
        image: Drawables.egg2,
        description: Strings.dummyDescription,
        quantity: 0,
        infoList: productInfoList,
      ),
    ],
  };
}
