// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:oyt_front_menu/enum/topping_options_type.dart';

class ProductDetailModel extends Equatable {
  factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        id: json['_id'],
        name: json['name'],
        price: json['price'],
        description: json['description'],
        uuid: json['uuid'],
        imgUrl: json['img'],
        toppings: List<Topping>.from(json['toppings'].map((x) => Topping.fromJson(x))),
        isAvaliable: json['isAvaliable'],
        categoryId: json['categoryId'],
        note: json['note'],
        totalWithToppings: json['totalWithToppings'],
      );

  const ProductDetailModel({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.imgUrl,
    required this.toppings,
    required this.isAvaliable,
    required this.categoryId,
    this.note,
    this.uuid,
    this.totalWithToppings,
  });

  final String id;
  final String name;
  final int price;
  final String description;
  final String imgUrl;
  final List<Topping> toppings;
  final bool isAvaliable;
  final String categoryId;

  final String? note;
  final num? totalWithToppings;
  final String? uuid;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'price': price,
        'description': description,
        'img': imgUrl,
        'toppings': List<dynamic>.from(toppings.map((x) => x.toJson())),
        'isAvaliable': isAvaliable,
        'categoryId': categoryId,
        'uuid': uuid,
        'note': note,
        'totalWithToppings': totalWithToppings,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      price,
      description,
      imgUrl,
      toppings,
      isAvaliable,
      categoryId,
      uuid,
      note,
      totalWithToppings,
    ];
  }

  ProductDetailModel copyWith({
    String? id,
    String? name,
    int? price,
    String? description,
    String? imgUrl,
    List<Topping>? toppings,
    bool? isAvaliable,
    String? categoryId,
    String? note,
    String? uuid,
    num? totalWithToppings,
  }) {
    return ProductDetailModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      toppings: toppings ?? this.toppings,
      isAvaliable: isAvaliable ?? this.isAvaliable,
      categoryId: categoryId ?? this.categoryId,
      uuid: uuid ?? this.uuid,
      note: note ?? this.note,
      totalWithToppings: totalWithToppings ?? this.totalWithToppings,
    );
  }
}

class Topping extends Equatable {
  factory Topping.fromJson(Map<String, dynamic> json) => Topping(
        id: json['_id'],
        name: json['name'],
        type: ToppingOptionsType.fromString(json['type']),
        options: List<ToppingOption>.from(json['options'].map((x) => ToppingOption.fromJson(x))),
        maxOptions: json['maxOptions'],
        minOptions: json['minOptions'],
      );

  const Topping({
    required this.id,
    required this.name,
    required this.type,
    required this.options,
    required this.minOptions,
    required this.maxOptions,
  });

  final String id;
  final String name;
  final ToppingOptionsType? type;
  final List<ToppingOption> options;
  final int minOptions;
  final int maxOptions;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'type': type?.widgetLabel,
        'options': List<dynamic>.from(options.map((x) => x.toJson())),
        'maxOptions': maxOptions,
        'minOptions': minOptions,
      };

  Map<String, dynamic> toMapCRUD() => {
        'name': name,
        'type': type?.widgetLabel,
        'maxOptions': maxOptions,
        'minOptions': minOptions,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      type,
      options,
      minOptions,
      maxOptions,
    ];
  }

  Topping copyWith({
    String? id,
    String? name,
    ToppingOptionsType? type,
    List<ToppingOption>? options,
    int? minOptions,
    int? maxOptions,
  }) {
    return Topping(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      options: options ?? this.options,
      minOptions: minOptions ?? this.minOptions,
      maxOptions: maxOptions ?? this.maxOptions,
    );
  }

  @override
  bool get stringify => true;
}

class ToppingOption extends Equatable {
  factory ToppingOption.fromJson(Map<String, dynamic> json) => ToppingOption(
        id: json['_id'],
        name: json['name'],
        price: json['price'],
        imgUrl: json['img'],
      );
  const ToppingOption({
    required this.id,
    required this.name,
    required this.price,
    required this.imgUrl,
  });

  final String id;
  final String name;
  final int price;
  final String imgUrl;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'price': price,
        'img': imgUrl,
      };

  Map<String, dynamic> toMapCRUD() => {
        'name': name,
        'price': price,
        if (imgUrl.isNotEmpty) 'img': imgUrl,
      };

  @override
  List<Object> get props => [id, name, price, imgUrl];

  ToppingOption copyWith({
    String? id,
    String? name,
    int? price,
    String? imgUrl,
  }) {
    return ToppingOption(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
    );
  }
}
