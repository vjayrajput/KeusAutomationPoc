import 'package:sqflite/sqflite.dart';

import '../../models/product_model.dart';

class DbHelper {
  static const String tableCart = 'cart';
  static const String tableCutlery = 'cutlery';

  Future<Database> getDatabase() async {
    return openDatabase(
      'cart.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableCart(
            id INTEGER PRIMARY KEY,
            name TEXT,
            price REAL,
            currency TEXT,
            image TEXT,
            description TEXT,
            quantity INTEGER
          )
        ''');

        await db.execute('''
          CREATE TABLE $tableCutlery(
            id INTEGER PRIMARY KEY,
            cutleryCount INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertOrUpdateCartItem(
      ProductModel product, int quantity) async {
    final db = await getDatabase();

    final existingProduct = await db.query(
      tableCart,
      where: 'id = ?',
      whereArgs: [product.id],
    );

    if (existingProduct.isNotEmpty) {
      final currentQuantity = existingProduct.first['quantity'] as int;
      await db.update(
        tableCart,
        {'quantity': currentQuantity + quantity},
        where: 'id = ?',
        whereArgs: [product.id],
      );
    } else {
      await db.insert(
        tableCart,
        {
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'currency': product.currency,
          'image': product.image,
          'description': product.description,
          'quantity': quantity,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<void> updateProductQuantity(int productId, int quantity) async {
    final db = await getDatabase();
    await db.update(
      tableCart,
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [productId],
    );
  }

  Future<List<ProductModel>> getCartItems() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query(tableCart);

    return List.generate(maps.length, (i) {
      return ProductModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        currency: maps[i]['currency'],
        image: maps[i]['image'],
        description: maps[i]['description'],
        quantity: maps[i]['quantity'],
        infoList: [],
      );
    });
  }

  Future<void> deleteProduct(int productId) async {
    final db = await getDatabase();
    await db.delete(
      tableCart,
      where: 'id = ?',
      whereArgs: [productId],
    );
  }

  Future<void> insertOrUpdateCutleryCount(int count) async {
    final db = await getDatabase();

    final existingCutlery =
        await db.query(tableCutlery, where: 'id = ?', whereArgs: [1]);

    if (existingCutlery.isNotEmpty) {
      await db.update(
        tableCutlery,
        {'cutleryCount': count},
        where: 'id = ?',
        whereArgs: [1],
      );
    } else {
      await db.insert(
        tableCutlery,
        {'id': 1, 'cutleryCount': count},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<int> getCutleryCount() async {
    final db = await getDatabase();
    final cutleryData =
        await db.query(tableCutlery, where: 'id = ?', whereArgs: [1]);

    if (cutleryData.isNotEmpty) {
      return cutleryData.first['cutleryCount'] as int;
    }
    return 1;
  }
}
