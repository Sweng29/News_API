import 'package:newsapi/models/category_model.dart';

List<Category> getCategories(){

  List<Category> categories = new List<Category>();

  Category category = new Category();
  category.categoryName = 'Business';
  category.imageUrl = 'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  categories.add(category);

  category = new Category();
  category.categoryName = 'World';
  category.imageUrl = 'https://images.unsplash.com/photo-1531266752426-aad472b7bbf4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  category = new Category();
  category.categoryName = 'Sports';
  category.imageUrl = 'https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categories.add(category);


  category = new Category();
  category.categoryName = 'Entertainment';
  category.imageUrl = 'https://images.unsplash.com/photo-1565009520202-ad8e8a57b304?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=667&q=80';
  categories.add(category);

  category = new Category();
  category.categoryName = 'General';
  category.imageUrl = 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=752&q=80';
  categories.add(category);

  category = new Category();
  category.categoryName = 'Health';
  category.imageUrl = 'https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  category = new Category();
  category.categoryName = 'Technology';
  category.imageUrl = 'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80';
  categories.add(category);

  return categories;

}