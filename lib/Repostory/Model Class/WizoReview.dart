class WizoReviewModel {
  WizoReviewModel({
      this.status, 
      this.requestId, 
      this.data,});

  WizoReviewModel.fromJson(dynamic json) {
    status = json['status'];
    requestId = json['request_id'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? status;
  String? requestId;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['request_id'] = requestId;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.asin, 
      this.totalReviews, 
      this.totalRatings, 
      this.country, 
      this.domain, 
      this.reviews,});

  Data.fromJson(dynamic json) {
    asin = json['asin'];
    totalReviews = json['total_reviews'];
    totalRatings = json['total_ratings'];
    country = json['country'];
    domain = json['domain'];
    if (json['reviews'] != null) {
      reviews = [];
      json['reviews'].forEach((v) {
        reviews?.add(Reviews.fromJson(v));
      });
    }
  }
  String? asin;
  int? totalReviews;
  int? totalRatings;
  String? country;
  String? domain;
  List<Reviews>? reviews;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['asin'] = asin;
    map['total_reviews'] = totalReviews;
    map['total_ratings'] = totalRatings;
    map['country'] = country;
    map['domain'] = domain;
    if (reviews != null) {
      map['reviews'] = reviews?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Reviews {
  Reviews({
      this.reviewId, 
      this.reviewTitle, 
      this.reviewComment, 
      this.reviewStarRating, 
      this.reviewLink, 
      this.reviewAuthor, 
      this.reviewAuthorAvatar, 
      this.reviewImages, 
      this.reviewVideo, 
      this.reviewDate, 
      this.isVerifiedPurchase, 
      this.helpfulVoteStatement, 
      this.reviewedProductAsin,});

  Reviews.fromJson(dynamic json) {
    reviewId = json['review_id'];
    reviewTitle = json['review_title'];
    reviewComment = json['review_comment'];
    reviewStarRating = json['review_star_rating'];
    reviewLink = json['review_link'];
    reviewAuthor = json['review_author'];
    reviewAuthorAvatar = json['review_author_avatar'];
    if (json['review_images'] != null) {
      reviewImages = [];
      json['review_images'].forEach((v) {
        reviewImages?.add(v);
      });
    }
    reviewVideo = json['review_video'];
    reviewDate = json['review_date'];
    isVerifiedPurchase = json['is_verified_purchase'];
    helpfulVoteStatement = json['helpful_vote_statement'];
    reviewedProductAsin = json['reviewed_product_asin'];
  }
  String? reviewId;
  String? reviewTitle;
  String? reviewComment;
  String? reviewStarRating;
  String? reviewLink;
  String? reviewAuthor;
  String? reviewAuthorAvatar;
  List<dynamic>? reviewImages;
  dynamic reviewVideo;
  String? reviewDate;
  bool? isVerifiedPurchase;
  String? helpfulVoteStatement;
  String? reviewedProductAsin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['review_id'] = reviewId;
    map['review_title'] = reviewTitle;
    map['review_comment'] = reviewComment;
    map['review_star_rating'] = reviewStarRating;
    map['review_link'] = reviewLink;
    map['review_author'] = reviewAuthor;
    map['review_author_avatar'] = reviewAuthorAvatar;
    if (reviewImages != null) {
      map['review_images'] = reviewImages?.map((v) => v.toJson()).toList();
    }
    map['review_video'] = reviewVideo;
    map['review_date'] = reviewDate;
    map['is_verified_purchase'] = isVerifiedPurchase;
    map['helpful_vote_statement'] = helpfulVoteStatement;
    map['reviewed_product_asin'] = reviewedProductAsin;
    return map;
  }

}