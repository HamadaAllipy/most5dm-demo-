
/// Base url
const String BASE_URL = 'https://most5dm.azurewebsites.net/api/';

/// Authentication
const String LOGIN = '/Auth/Login';
const String REGISTER = '/Auth/Register';
const String EDIT = '/Auth/Edit';

/// Main Category
const String GET_ALL_MAIN_CATEGORY = '/MainCategory/GetAll';


/// Category
const String GET_ALL_CATEGORY = '/Category/GetAll';
const String GET_CATEGORY_BY_MAIN_CATEGORY_ID = '/Category/GetCategoryByMainCategoryId';

/// Brand
const String GET_ALL_BRAND = '/Brand/GetAll';
const String GET_ALL_BRAND_BY_CATEGORY_ID = '/Brand/GetAllBrandsByCategoryId';

/// Product
const String GET_ALL_PRODUCTS = '/Products/GetAll';
const String GET_ALL_PRODUCTS_BY_BRAND_ID = '/Products/GetAllProductsByBrandId';
const String GET_ALL_PRODUCTS_BY_MAIN_CATEGORY_ID = '/Products/GetProductByMainCategoryId';
const String GET_PRODUCT_BY_SEARCH = 'Products/GetProductBySearch';

/// City
const String GET_ALL_CITY = '/City/GetAll';
const String GET_ALL_CITY_BY_CITY_ID = '/City/GetCityById';
