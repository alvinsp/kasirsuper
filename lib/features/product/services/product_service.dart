import 'package:flutter/cupertino.dart';
import 'package:kasirsuper/core/core.dart';
import 'package:kasirsuper/features/product/product.dart';

class ProductService {
  ProductService._();

  static Future<List<ProductModel>> getAll(String search) async {
    try {
      final db = await SQLiteDatabase.database;

      final data = await db.query(
        'products',
        where: "title LIKE ?",
        whereArgs: ["%$search%"],
      );

      return data.map(ProductModel.fromJson).toList();
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<bool> create(ProductModel product) async {
    try {
      final db = await SQLiteDatabase.database;

      await db.insert('products', product.toJson());

      return true;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<bool> update(ProductModel product) async {
    try {
      final db = await SQLiteDatabase.database;

      await db.update(
        'products',
        product.toJson(),
        where: "id = ?",
        whereArgs: [product.id],
      );

      return true;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<bool> delete(int id) async {
    try {
      final db = await SQLiteDatabase.database;

      await db.delete('products', where: "id = ?", whereArgs: [id]);

      return true;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
