
class WizoModelSecond {
  String? status;
  String? requestId;
  Data? data;

  WizoModelSecond({this.status, this.requestId, this.data});

  WizoModelSecond.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    requestId = json["request_id"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["request_id"] = requestId;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  String? asin;
  String? productTitle;
  String? productPrice;
  dynamic productOriginalPrice;
  String? currency;
  String? country;
  String? productStarRating;
  int? productNumRatings;
  String? productUrl;
  String? productPhoto;
  int? productNumOffers;
  String? productAvailability;
  bool? isBestSeller;
  bool? isAmazonChoice;
  bool? isPrime;
  bool? climatePledgeFriendly;
  String? salesVolume;
  List<String>? aboutProduct;
  String? productDescription;
  ProductInformation? productInformation;
  //RatingDistribution? ratingDistribution;
  List<String>? productPhotos;
  ProductDetails? productDetails;
  String? customersSay;
  ReviewAspects? reviewAspects;
  List<CategoryPath>? categoryPath;
  ProductVariations? productVariations;

  Data({this.asin, this.productTitle, this.productPrice, this.productOriginalPrice, this.currency, this.country, this.productStarRating, this.productNumRatings, this.productUrl, this.productPhoto, this.productNumOffers, this.productAvailability, this.isBestSeller, this.isAmazonChoice, this.isPrime, this.climatePledgeFriendly, this.salesVolume, this.aboutProduct, this.productDescription, this.productInformation,  this.productPhotos, this.productDetails, this.customersSay, this.reviewAspects, this.categoryPath, this.productVariations});

  Data.fromJson(Map<String, dynamic> json) {
    asin = json["asin"];
    productTitle = json["product_title"];
    productPrice = json["product_price"];
    productOriginalPrice = json["product_original_price"];
    currency = json["currency"];
    country = json["country"];
    productStarRating = json["product_star_rating"];
    productNumRatings = json["product_num_ratings"];
    productUrl = json["product_url"];
    productPhoto = json["product_photo"];
    productNumOffers = json["product_num_offers"];
    productAvailability = json["product_availability"];
    isBestSeller = json["is_best_seller"];
    isAmazonChoice = json["is_amazon_choice"];
    isPrime = json["is_prime"];
    climatePledgeFriendly = json["climate_pledge_friendly"];
    salesVolume = json["sales_volume"];
    aboutProduct = json["about_product"] == null ? null : List<String>.from(json["about_product"]);
    productDescription = json["product_description"];
    productInformation = json["product_information"] == null ? null : ProductInformation.fromJson(json["product_information"]);
    //ratingDistribution = json["rating_distribution"] == null ? null : RatingDistribution.fromJson(json["rating_distribution"]);
    productPhotos = json["product_photos"] == null ? null : List<String>.from(json["product_photos"]);
    productDetails = json["product_details"] == null ? null : ProductDetails.fromJson(json["product_details"]);
    customersSay = json["customers_say"];
    reviewAspects = json["review_aspects"] == null ? null : ReviewAspects.fromJson(json["review_aspects"]);
    categoryPath = json["category_path"] == null ? null : (json["category_path"] as List).map((e) => CategoryPath.fromJson(e)).toList();
    productVariations = json["product_variations"] == null ? null : ProductVariations.fromJson(json["product_variations"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["asin"] = asin;
    _data["product_title"] = productTitle;
    _data["product_price"] = productPrice;
    _data["product_original_price"] = productOriginalPrice;
    _data["currency"] = currency;
    _data["country"] = country;
    _data["product_star_rating"] = productStarRating;
    _data["product_num_ratings"] = productNumRatings;
    _data["product_url"] = productUrl;
    _data["product_photo"] = productPhoto;
    _data["product_num_offers"] = productNumOffers;
    _data["product_availability"] = productAvailability;
    _data["is_best_seller"] = isBestSeller;
    _data["is_amazon_choice"] = isAmazonChoice;
    _data["is_prime"] = isPrime;
    _data["climate_pledge_friendly"] = climatePledgeFriendly;
    _data["sales_volume"] = salesVolume;
    if(aboutProduct != null) {
      _data["about_product"] = aboutProduct;
    }
    _data["product_description"] = productDescription;
    if(productInformation != null) {
      _data["product_information"] = productInformation?.toJson();
    }
    // if(ratingDistribution != null) {
    //   _data["rating_distribution"] = ratingDistribution?.toJson();
    // }
    if(productPhotos != null) {
      _data["product_photos"] = productPhotos;
    }
    if(productDetails != null) {
      _data["product_details"] = productDetails?.toJson();
    }
    _data["customers_say"] = customersSay;
    if(reviewAspects != null) {
      _data["review_aspects"] = reviewAspects?.toJson();
    }
    if(categoryPath != null) {
      _data["category_path"] = categoryPath?.map((e) => e.toJson()).toList();
    }
    if(productVariations != null) {
      _data["product_variations"] = productVariations?.toJson();
    }
    return _data;
  }
}

class ProductVariations {
  List<Size>? size;
  List<Color1>? color;
  List<ServiceProvider>? serviceProvider;

  ProductVariations({this.size, this.color, this.serviceProvider});

  ProductVariations.fromJson(Map<String, dynamic> json) {
    size = json["size"] == null ? null : (json["size"] as List).map((e) => Size.fromJson(e)).toList();
    color = json["color"] == null ? null : (json["color"] as List).map((e) => Color1.fromJson(e)).toList();
    serviceProvider = json["service_provider"] == null ? null : (json["service_provider"] as List).map((e) => ServiceProvider.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if(size != null) {
      _data["size"] = size?.map((e) => e.toJson()).toList();
    }
    if(color != null) {
      _data["color"] = color?.map((e) => e.toJson()).toList();
    }
    if(serviceProvider != null) {
      _data["service_provider"] = serviceProvider?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class ServiceProvider {
  String? asin;
  String? value;
  bool? isAvailable;

  ServiceProvider({this.asin, this.value, this.isAvailable});

  ServiceProvider.fromJson(Map<String, dynamic> json) {
    asin = json["asin"];
    value = json["value"];
    isAvailable = json["is_available"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["asin"] = asin;
    _data["value"] = value;
    _data["is_available"] = isAvailable;
    return _data;
  }
}

class Color1 {
  String? asin;
  String? value;
  String? photo;
  bool? isAvailable;

  Color1( i, {this.asin, this.value, this.photo, this.isAvailable});

  Color1.fromJson(Map<String, dynamic> json) {
    asin = json["asin"];
    value = json["value"];
    photo = json["photo"];
    isAvailable = json["is_available"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["asin"] = asin;
    _data["value"] = value;
    _data["photo"] = photo;
    _data["is_available"] = isAvailable;
    return _data;
  }
}

class Size {
  String? asin;
  String? value;
  bool? isAvailable;

  Size({this.asin, this.value, this.isAvailable});

  Size.fromJson(Map<String, dynamic> json) {
    asin = json["asin"];
    value = json["value"];
    isAvailable = json["is_available"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["asin"] = asin;
    _data["value"] = value;
    _data["is_available"] = isAvailable;
    return _data;
  }
}

class CategoryPath {
  String? id;
  String? name;
  String? link;

  CategoryPath({this.id, this.name, this.link});

  CategoryPath.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["link"] = link;
    return _data;
  }
}

class ReviewAspects {
  String? value;
  String? easeOfUse;
  String? quality;
  String? batteryLife;
  String? scratchResistance;
  String? charging;
  String? security;
  String? soundQuality;

  ReviewAspects({this.value, this.easeOfUse, this.quality, this.batteryLife, this.scratchResistance, this.charging, this.security, this.soundQuality});

  ReviewAspects.fromJson(Map<String, dynamic> json) {
    value = json["Value"];
    easeOfUse = json["Ease of use"];
    quality = json["Quality"];
    batteryLife = json["Battery life"];
    scratchResistance = json["Scratch resistance"];
    charging = json["Charging"];
    security = json["Security"];
    soundQuality = json["Sound quality"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Value"] = value;
    _data["Ease of use"] = easeOfUse;
    _data["Quality"] = quality;
    _data["Battery life"] = batteryLife;
    _data["Scratch resistance"] = scratchResistance;
    _data["Charging"] = charging;
    _data["Security"] = security;
    _data["Sound quality"] = soundQuality;
    return _data;
  }
}

class ProductDetails {
  String? brand;
  String? operatingSystem;
  String? ramMemoryInstalledSize;
  String? memoryStorageCapacity;
  String? screenSize;
  String? modelName;
  String? wirelessCarrier;
  String? cellularTechnology;
  String? connectivityTechnology;
  String? color;

  ProductDetails({this.brand, this.operatingSystem, this.ramMemoryInstalledSize, this.memoryStorageCapacity, this.screenSize, this.modelName, this.wirelessCarrier, this.cellularTechnology, this.connectivityTechnology, this.color});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    brand = json["Brand"];
    operatingSystem = json["Operating System"];
    ramMemoryInstalledSize = json["Ram Memory Installed Size"];
    memoryStorageCapacity = json["Memory Storage Capacity"];
    screenSize = json["Screen Size"];
    modelName = json["Model Name"];
    wirelessCarrier = json["Wireless Carrier"];
    cellularTechnology = json["Cellular Technology"];
    connectivityTechnology = json["Connectivity Technology"];
    color = json["Color"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Brand"] = brand;
    _data["Operating System"] = operatingSystem;
    _data["Ram Memory Installed Size"] = ramMemoryInstalledSize;
    _data["Memory Storage Capacity"] = memoryStorageCapacity;
    _data["Screen Size"] = screenSize;
    _data["Model Name"] = modelName;
    _data["Wireless Carrier"] = wirelessCarrier;
    _data["Cellular Technology"] = cellularTechnology;
    _data["Connectivity Technology"] = connectivityTechnology;
    _data["Color"] = color;
    return _data;
  }
}

// class RatingDistribution {
//   String? 1;
//   String? 2;
//   String? 3;
//   String? 4;
//   String? 5;
//
//   RatingDistribution({this.1, this.2, this.3, this.4, this.5});
//
// RatingDistribution.fromJson(Map<String, dynamic> json) {
// 1 = json["1"];
// 2 = json["2"];
// 3 = json["3"];
// 4 = json["4"];
// 5 = json["5"];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> _data = <String, dynamic>{};
// _data["1"] = 1;
// _data["2"] = 2;
// _data["3"] = 3;
// _data["4"] = 4;
// _data["5"] = 5;
// return _data;
// }
// }

class ProductInformation {
String? productDimensions;
String? itemWeight;
String? asin;
String? itemModelNumber;
String? batteries;
String? bestSellersRank;
String? os;
String? ram;
String? wirelessCommunicationTechnologies;
String? connectivityTechnologies;
String? gps;
String? specialFeatures;
String? otherDisplayFeatures;
String? humanInterfaceInput;
String? otherCameraFeatures;
String? formFactor;
String? color;
String? batteryPowerRating;
String? whatsInTheBox;
String? manufacturer;
String? dateFirstAvailable;
String? memoryStorageCapacity;
String? standingScreenDisplaySize;
String? ramMemoryInstalledSize;
String? weight;

ProductInformation({this.productDimensions, this.itemWeight, this.asin, this.itemModelNumber, this.batteries, this.bestSellersRank, this.os, this.ram, this.wirelessCommunicationTechnologies, this.connectivityTechnologies, this.gps, this.specialFeatures, this.otherDisplayFeatures, this.humanInterfaceInput, this.otherCameraFeatures, this.formFactor, this.color, this.batteryPowerRating, this.whatsInTheBox, this.manufacturer, this.dateFirstAvailable, this.memoryStorageCapacity, this.standingScreenDisplaySize, this.ramMemoryInstalledSize, this.weight});

ProductInformation.fromJson(Map<String, dynamic> json) {
productDimensions = json["Product Dimensions"];
itemWeight = json["Item Weight"];
asin = json["ASIN"];
itemModelNumber = json["Item model number"];
batteries = json["Batteries"];
bestSellersRank = json["Best Sellers Rank"];
os = json["OS"];
ram = json["RAM"];
wirelessCommunicationTechnologies = json["Wireless communication technologies"];
connectivityTechnologies = json["Connectivity technologies"];
gps = json["GPS"];
specialFeatures = json["Special features"];
otherDisplayFeatures = json["Other display features"];
humanInterfaceInput = json["Human Interface Input"];
otherCameraFeatures = json["Other camera features"];
formFactor = json["Form Factor"];
color = json["Color"];
batteryPowerRating = json["Battery Power Rating"];
whatsInTheBox = json["Whats in the box"];
manufacturer = json["Manufacturer"];
dateFirstAvailable = json["Date First Available"];
memoryStorageCapacity = json["Memory Storage Capacity"];
standingScreenDisplaySize = json["Standing screen display size"];
ramMemoryInstalledSize = json["Ram Memory Installed Size"];
weight = json["Weight"];
}

Map<String, dynamic> toJson() {
final Map<String, dynamic> _data = <String, dynamic>{};
_data["Product Dimensions"] = productDimensions;
_data["Item Weight"] = itemWeight;
_data["ASIN"] = asin;
_data["Item model number"] = itemModelNumber;
_data["Batteries"] = batteries;
_data["Best Sellers Rank"] = bestSellersRank;
_data["OS"] = os;
_data["RAM"] = ram;
_data["Wireless communication technologies"] = wirelessCommunicationTechnologies;
_data["Connectivity technologies"] = connectivityTechnologies;
_data["GPS"] = gps;
_data["Special features"] = specialFeatures;
_data["Other display features"] = otherDisplayFeatures;
_data["Human Interface Input"] = humanInterfaceInput;
_data["Other camera features"] = otherCameraFeatures;
_data["Form Factor"] = formFactor;
_data["Color"] = color;
_data["Battery Power Rating"] = batteryPowerRating;
_data["Whats in the box"] = whatsInTheBox;
_data["Manufacturer"] = manufacturer;
_data["Date First Available"] = dateFirstAvailable;
_data["Memory Storage Capacity"] = memoryStorageCapacity;
_data["Standing screen display size"] = standingScreenDisplaySize;
_data["Ram Memory Installed Size"] = ramMemoryInstalledSize;
_data["Weight"] = weight;
return _data;
}
}