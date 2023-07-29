import 'package:go_spendr/models/catagory_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCategories();
}
