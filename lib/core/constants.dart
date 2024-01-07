import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? sharedPreferences;

class AppAssets {
  /// Vectors
  static const String vectors = 'assets/vectors';
  static const String loginVector = '$vectors/login.svg';
  static const String storeVectors = '$vectors/store.svg';
  static const String otpVerify = '$vectors/otp_verify.svg';
  static const String cart_vector = '$vectors/cart.svg';

  /// Images
  static const String user = '$vectors/user.png';
  static const String slider = '$vectors/test_slider.jpg';

  /// Icon SVGs
  static const String accountCircle = 'assets/icons/account_circle.svg';
  static const String accountCircleBold =
      'assets/icons/account_circle_bold.svg';
  static const String arrowRight = 'assets/icons/arrow_right.svg';
  static const String bell = 'assets/icons/bell.svg';
  static const String bigArrowBack = 'assets/icons/big_arrow_back.svg';
  static const String call = 'assets/icons/call.svg';
  static const String cart = 'assets/icons/cart.svg';
  static const String cashOnDelivery = 'assets/icons/cash_on_delivery.svg';
  static const String category = 'assets/icons/category.svg';
  static const String chat = 'assets/icons/chat.svg';
  static const String check = 'assets/icons/check.svg';
  static const String clock = 'assets/icons/clock.svg';
  static const String deliveryFee = 'assets/icons/delivery_fee.svg';
  static const String deliveryTime = 'assets/icons/delivery_time.svg';
  static const String eyeOpen = 'assets/icons/eye_open.svg';
  static const String fav = 'assets/icons/fav.svg';
  static const String home = 'assets/icons/home.svg';
  static const String info = 'assets/icons/info.svg';
  static const String location = 'assets/icons/location.svg';
  static const String logOut = 'assets/icons/log_out.svg';
  static const String minimumOrder = 'assets/icons/minimum_order.svg';
  static const String paymentMethod = 'assets/icons/payment_method.svg';
  static const String preOrder = 'assets/icons/pre_order.svg';
  static const String search = 'assets/icons/search.svg';
  static const String settings = 'assets/icons/settings.svg';
  static const String star = 'assets/icons/star.svg';
  static const String userOrder = 'assets/icons/user_order.svg';
  static const String store = 'assets/imgs/store.png';
  static const String minus = 'assets/icons/minus.svg';
  static const String add = 'assets/icons/add.svg';
  static const String mode = 'assets/icons/mode.svg';
  static const String lang = 'assets/icons/lang.svg';
  static const String profit = 'assets/icons/profit.svg';
  static const String items = 'assets/icons/items.svg';
  static const String orders = 'assets/icons/orders.svg';
  static const String edit = 'assets/icons/edit.svg';
  static const String delete = 'assets/icons/delete.svg';
  static const String totalProfit = 'assets/icons/total_profit.svg';
  static const String messenger = 'assets/icons/messenger.svg';
  static const String appLogo = 'assets/icons/messenger.svg';
  static const String businessLicense = 'assets/icons/business.svg';
  static const String id = 'assets/icons/id.svg';
  static const String shelf = 'assets/icons/shelf.png';

  static Map<String, String> categoriesMap = {
    'Men Wear': 'assets/categories/men_wear.svg',
    'Women Wear': 'assets/categories/women_wear.svg',
    'Kids Wear': 'assets/categories/kids.svg',
    'Bags and Luggage': 'assets/categories/bags.svg',
    'Footwear': 'assets/categories/footwear.svg',
    'Accessories': 'assets/categories/accessories.svg',
    'Electronics': 'assets/categories/electronics.svg',
    'Gaming': 'assets/categories/gaming.svg',
    'Wearable Technology': 'assets/categories/wearable_tech.svg',
  };

  static Map<String, List<String>> categoriesAndSubcategory = {
    'Men Wear': [
      'Casual T-Shirts',
      'Formal T-Shirts',
      'Sports T-Shirts',
      'Straight Jeans',
      'Skinny Jeans',
      'Relaxed Fit Jeans',
      'Casual Jackets',
      'Formal Jackets',
      'Outdoor Jackets'
    ],
    'Women Wear': [
      'Casual Dresses',
      'Formal Dresses',
      'Cocktail Dresses',
      'Casual Shoes',
      'Formal Shoes',
      'Sports Shoes',
      'Tote Handbags',
      'Clutch Handbags',
      'Shoulder Handbags'
    ],
    'Kids Wear': [
      'T-Shirts',
      'Shirts',
      'Sweatshirts',
      'Shorts',
      'Pants',
      'Skirts',
      'Jackets',
      'Coats',
      'Raincoats'
    ],
    'Bags and Luggage': [
      'Casual Backpacks',
      'Professional Backpacks',
      'Sports Backpacks',
      'Daytime Handbags',
      'Evening Handbags',
      'Work Handbags',
      'Suitcases',
      'Duffels',
      'Garment Bags'
    ],
    'Footwear': [
      'Casual Sneakers',
      'Athletic Sneakers',
      'High-Top Sneakers',
      'Casual Boots',
      'Work Boots',
      'Winter Boots',
      'Flat Sandals',
      'Heeled Sandals',
      'Sports Sandals'
    ],
    'Accessories': [
      'Casual Hats',
      'Sports Hats',
      'Formal Hats',
      'Casual Sunglasses',
      'Sports Sunglasses',
      'Designer Sunglasses',
      'Necklaces',
      'Bracelets',
      'Rings'
    ],
    'Electronics': [
      'Android Smartphones',
      'iOS Smartphones',
      'Budget Smartphones',
      'Notebook Laptops',
      'Ultrabook Laptops',
      'Gaming Laptops',
      'Wired Headphones',
      'Wireless Headphones',
      'Noise-Cancelling Headphones'
    ],
    'Gaming': [
      'Home Consoles',
      'Portable Consoles',
      'Hybrid Consoles',
      'Adventure Games',
      'Strategy Games',
      'Simulation Games',
      'Controllers',
      'Audio Accessories',
      'Storage Accessories'
    ],
    'Wearable Technology': [
      'Fitness Smartwatches',
      'Luxury Smartwatches',
      'Everyday Smartwatches',
      'Basic Fitness Trackers',
      'Advanced Fitness Trackers',
      'Specialty Fitness Trackers',
      'Audio Headsets',
      'VR Headsets',
      'Communication Headsets'
    ],
    'Nutrition & Supplement': [
      'Daily Vitamins',
      'Specialized Vitamins',
      'Kids Vitamins',
      'Whey Protein Powder',
      'Plant-Based Protein Powder',
      'Casein Protein Powder',
      'Protein Bars',
      'Nuts',
      'Fruit-Based Snacks',
      'Protein Supplements',
      'Creatine Supplements',
      'Amino Acids',
      'Thermogenic Supplements',
      'Appetite Suppressants',
      'Fat Blockers',
      'Caffeine Supplements',
      'Herbal Supplements',
      'Pre-Workout Supplements'
    ],
  };

  static List<String> allBrands = [
    // Men's and Women's Wear
    'Nike', 'Adidas', 'Under Armour', 'Levi\'s', 'Ralph Lauren',
    'Tommy Hilfiger',
    'Gucci', 'Chanel', 'Prada', 'Versace', 'Armani',
    'Dolce & Gabbana', 'Burberry', 'Hermès', 'Calvin Klein', 'Valentino',

    // Kids' Wear
    'Carter\'s', 'OshKosh B\'gosh', 'Gap Kids', 'Janie and Jack', 'Gymboree',
    'Mini Boden', 'Zara Kids', 'H&M Kids', 'Uniqlo Kids', 'Old Navy Kids',

    // Bags and Luggage
    'Samsonite', 'American Tourister', 'Tumi', 'Herschel', 'Victorinox',
    'Travelpro', 'Briggs & Riley', 'Delsey', 'Eagle Creek', 'Osprey',

    // Footwear
    'Puma', 'Skechers', 'Clarks', 'Dr. Martens', 'New Balance',
    'Vans', 'Converse', 'Timberland', 'Merrell', 'Brooks',

    // Accessories
    'Ray-Ban', 'Rolex', 'Casio', 'Seiko', 'Fossil',
    'Omega', 'Tag Heuer', 'Swatch', 'Montblanc', 'Tissot',

    // Electronics
    'Apple', 'Samsung', 'Sony', 'Dell', 'Lenovo',
    'HP', 'Asus', 'Acer', 'Panasonic', 'LG',

    // Gaming
    'Nintendo', 'Sony PlayStation', 'Microsoft Xbox', 'Razer', 'Logitech',
    'Corsair', 'Alienware', 'Asus ROG', 'SteelSeries', 'HyperX',

    // Wearable Technology
    'Fitbit', 'Garmin', 'Huawei', 'Polar', 'Suunto',
    'Samsung', 'Apple Watch', 'Xiaomi', 'Fossil', 'TicWatch',

    // Nutrition and Supplements
    'Optimum Nutrition', 'Garden of Life', 'Nature\'s Bounty', 'Centrum',
    'MuscleTech',
    'Cellucor', 'BSN', 'Nature Made', 'GNC', 'Vitamin Shoppe',
    'MyProtein', 'Quest Nutrition', 'Universal Nutrition', 'NOW Foods',
    'MusclePharm',
    'Red Rex', 'Olimp' // Newly added
  ];

  static Map<String, String> dashBoardOrderInfo = {
    'Completed Orders': 'assets/icons/completed_order.svg',
    'Pending Orders': 'assets/icons/pending_order.svg',
    'Rejected Orders': 'assets/icons/rejected_order.svg',
    'Total Items': 'assets/icons/total_item.svg',
    'Low Stock Items': 'assets/icons/low_stock_item.svg'
  };

  // Dummy Images
  static List<String> products = [
    'assets/imgs/image1.png',
    'assets/imgs/image2.png',
    'assets/imgs/image3.png',
    'assets/imgs/image4.png',
    'assets/imgs/image5.png',
    'assets/imgs/image6.png',
    'assets/imgs/image7.png',
    'assets/imgs/image8.png',
  ];

  static List<String> shopTypes = [
    'Clothing and Apparel',
    'Electronics',
    'Home and Living',
    'Beauty and Personal Care',
    'Sports and Outdoors',
    'Toys and Games',
    'Books and Stationery',
    'Health and Wellness',
    'Food and Grocery',
    'Jewelry and Accessories',
    'Pet Supplies',
    'Automotive',
    'Arts and Crafts',
    'Music and Entertainment',
    'Travel and Luggage',
    'Baby Products',
    'Sustainable and Eco-friendly Products',
    'Collectibles and Memorabilia',
    'Furniture and Home Improvement',
    'Gifts and Special Occasions',
  ];

  static List<String> clothingSizes = [
    'XS', // Extra Small
    'S', // Small
    'M', // Medium
    'L', // Large
    'XL', // Extra Large
    'XXL', // Double Extra Large
    'XXXL', // Triple Extra Large
  ];

  static List<String> locations = [
    'Hawler',
    'Sulaymania',
    'Duhok',
    'Kirkuk',
    'Zakho',
  ];

  // Shared Key
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
}
