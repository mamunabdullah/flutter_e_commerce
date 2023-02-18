class ProductDetailsResponse {
  ProductDetailsResponse({
    this.status,
    this.statusCode,
    this.data,
    this.error,
  });

  ProductDetailsResponse.fromJson(dynamic json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    error = json['error'];
  }

  String? status;
  num? statusCode;
  Data? data;
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['statusCode'] = statusCode;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['error'] = error;
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.brand,
    this.image,
    this.charge,
    this.images,
    this.slug,
    this.productName,
    this.model,
    this.commissionType,
    this.amount,
    this.tag,
    this.description,
    this.note,
    this.embaddedVideoLink,
    this.maximumOrder,
    this.stock,
    this.isBackOrder,
    this.specification,
    this.warranty,
    this.preOrder,
    this.productReview,
    this.isSeller,
    this.isPhone,
    this.willShowEmi,
    this.badge,
    this.isActive,
    this.sackEquivalent,
    this.createdAt,
    this.updatedAt,
    this.language,
    this.seller,
    this.combo,
    this.createdBy,
    this.updatedBy,
    this.category,
    this.relatedProduct,
    this.filterValue,
    this.distributors,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    image = json['image'];
    charge = json['charge'] != null ? Charge.fromJson(json['charge']) : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    slug = json['slug'];
    productName = json['product_name'];
    model = json['model'];
    commissionType = json['commission_type'];
    amount = json['amount'];
    tag = json['tag'];
    description = json['description'];
    note = json['note'];
    embaddedVideoLink = json['embadded_video_link'];
    maximumOrder = json['maximum_order'];
    stock = json['stock'];
    isBackOrder = json['is_back_order'];
    specification = json['specification'];
    warranty = json['warranty'];
    preOrder = json['pre_order'];
    productReview = json['product_review'];
    isSeller = json['is_seller'];
    isPhone = json['is_phone'];
    willShowEmi = json['will_show_emi'];
    badge = json['badge'];
    isActive = json['is_active'];
    sackEquivalent = json['sack_equivalent'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    language = json['language'];
    seller = json['seller'];
    combo = json['combo'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    category = json['category'] != null ? json['category'].cast<num>() : [];
    relatedProduct = json['related_product'] != null
        ? json['related_product'].cast<String>()
        : [];
    filterValue =
        json['filter_value'] != null ? json['filter_value'].cast<String>() : [];
    distributors =
        json['distributors'] != null ? json['distributors'].cast<String>() : [];
  }

  num? id;
  Brand? brand;
  String? image;
  Charge? charge;
  List<Images>? images;
  String? slug;
  String? productName;
  String? model;
  String? commissionType;
  String? amount;
  String? tag;
  String? description;
  String? note;
  String? embaddedVideoLink;
  num? maximumOrder;
  num? stock;
  bool? isBackOrder;
  String? specification;
  String? warranty;
  bool? preOrder;
  num? productReview;
  bool? isSeller;
  bool? isPhone;
  bool? willShowEmi;
  String? badge;
  bool? isActive;
  String? sackEquivalent;
  String? createdAt;
  String? updatedAt;
  String? language;
  String? seller;
  String? combo;
  String? createdBy;
  String? updatedBy;
  List<num>? category;
  List<String>? relatedProduct;
  List<String>? filterValue;
  List<String>? distributors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['image'] = image;
    if (charge != null) {
      map['charge'] = charge?.toJson();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    map['slug'] = slug;
    map['product_name'] = productName;
    map['model'] = model;
    map['commission_type'] = commissionType;
    map['amount'] = amount;
    map['tag'] = tag;
    map['description'] = description;
    map['note'] = note;
    map['embadded_video_link'] = embaddedVideoLink;
    map['maximum_order'] = maximumOrder;
    map['stock'] = stock;
    map['is_back_order'] = isBackOrder;
    map['specification'] = specification;
    map['warranty'] = warranty;
    map['pre_order'] = preOrder;
    map['product_review'] = productReview;
    map['is_seller'] = isSeller;
    map['is_phone'] = isPhone;
    map['will_show_emi'] = willShowEmi;
    map['badge'] = badge;
    map['is_active'] = isActive;
    map['sack_equivalent'] = sackEquivalent;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['language'] = language;
    map['seller'] = seller;
    map['combo'] = combo;
    map['created_by'] = createdBy;
    map['updated_by'] = updatedBy;
    map['category'] = category;
    map['related_product'] = relatedProduct;
    map['filter_value'] = filterValue;
    map['distributors'] = distributors;
    return map;
  }
}

class Images {
  Images({
    this.id,
    this.image,
    this.isPrimary,
    this.product,
  });

  Images.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    isPrimary = json['is_primary'];
    product = json['product'];
  }

  num? id;
  String? image;
  bool? isPrimary;
  num? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    map['is_primary'] = isPrimary;
    map['product'] = product;
    return map;
  }
}

class Charge {
  Charge({
    this.bookingPrice,
    this.currentCharge,
    this.discountCharge,
    this.sellingPrice,
    this.profit,
    this.isEvent,
    this.eventId,
    this.highlight,
    this.highlightId,
    this.groupping,
    this.grouppingId,
    this.campaignSectionId,
    this.campaignSection,
    this.message,
  });

  Charge.fromJson(dynamic json) {
    bookingPrice = json['booking_price'];
    currentCharge = json['current_charge'];
    discountCharge = json['discount_charge'];
    sellingPrice = json['selling_price'];
    profit = json['profit'];
    isEvent = json['is_event'];
    eventId = json['event_id'];
    highlight = json['highlight'];
    highlightId = json['highlight_id'];
    groupping = json['groupping'];
    grouppingId = json['groupping_id'];
    campaignSectionId = json['campaign_section_id'];
    campaignSection = json['campaign_section'];
    message = json['message'];
  }

  num? bookingPrice;
  num? currentCharge;
  num? discountCharge;
  num? sellingPrice;
  num? profit;
  bool? isEvent;
  num? eventId;
  bool? highlight;
  num? highlightId;
  bool? groupping;
  num? grouppingId;
  num? campaignSectionId;
  bool? campaignSection;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['booking_price'] = bookingPrice;
    map['current_charge'] = currentCharge;
    map['discount_charge'] = discountCharge;
    map['selling_price'] = sellingPrice;
    map['profit'] = profit;
    map['is_event'] = isEvent;
    map['event_id'] = eventId;
    map['highlight'] = highlight;
    map['highlight_id'] = highlightId;
    map['groupping'] = groupping;
    map['groupping_id'] = grouppingId;
    map['campaign_section_id'] = campaignSectionId;
    map['campaign_section'] = campaignSection;
    map['message'] = message;
    return map;
  }
}

class Brand {
  Brand({
    this.name,
    this.image,
    this.headerImage,
    this.slug,
  });

  Brand.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    headerImage = json['header_image'];
    slug = json['slug'];
  }

  String? name;
  String? image;
  String? headerImage;
  String? slug;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    map['header_image'] = headerImage;
    map['slug'] = slug;
    return map;
  }
}
