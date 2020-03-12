class Product {
    List<Data> data;
    int status;

    Product({this.data, this.status});

    factory Product.fromJson(Map<String, dynamic> json) {
        return Product(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            status: json['status'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['status'] = this.status;
        if (this.data != null) {
            data['`data`'] = this.data.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Data {
    int cost;
    String created;
    String description;
    int id;
    String modified;
    String name;
    String producer;
    int product_category_id;
    String product_images;
    int rating;
    int view_count;

    Data({this.cost, this.created, this.description, this.id, this.modified, this.name, this.producer, this.product_category_id, this.product_images, this.rating, this.view_count});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            cost: json['cost'],
            created: json['created'],
            description: json['description'],
            id: json['id'],
            modified: json['modified'],
            name: json['name'],
            producer: json['producer'],
            product_category_id: json['product_category_id'],
            product_images: json['product_images'],
            rating: json['rating'],
            view_count: json['view_count'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cost'] = this.cost;
        data['created'] = this.created;
        data['description'] = this.description;
        data['id'] = this.id;
        data['modified'] = this.modified;
        data['name'] = this.name;
        data['producer'] = this.producer;
        data['product_category_id'] = this.product_category_id;
        data['product_images'] = this.product_images;
        data['rating'] = this.rating;
        data['view_count'] = this.view_count;
        return data;
    }
}