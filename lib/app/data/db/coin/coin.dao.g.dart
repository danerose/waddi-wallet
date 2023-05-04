// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoinDaoAdapter extends TypeAdapter<CoinDao> {
  @override
  final int typeId = 1;

  @override
  CoinDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CoinDao(
      id: fields[0] as String,
      icon: fields[1] as String,
      name: fields[2] as String,
      symbol: fields[3] as String,
      rank: fields[4] as int,
      price: fields[5] as num,
      priceBtc: fields[6] as num,
      volume: fields[7] as num,
      marketCap: fields[8] as num,
      availableSupply: fields[9] as num,
      totalSupply: fields[10] as num,
      priceChange1h: fields[11] as num,
      priceChange1d: fields[12] as num,
      priceChange1w: fields[13] as num,
      websiteUrl: fields[14] as String,
      redditUrl: fields[15] as String,
      twitterUrl: fields[16] as String,
      liked: fields[17] as bool,
      exp: (fields[18] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, CoinDao obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.symbol)
      ..writeByte(4)
      ..write(obj.rank)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.priceBtc)
      ..writeByte(7)
      ..write(obj.volume)
      ..writeByte(8)
      ..write(obj.marketCap)
      ..writeByte(9)
      ..write(obj.availableSupply)
      ..writeByte(10)
      ..write(obj.totalSupply)
      ..writeByte(11)
      ..write(obj.priceChange1h)
      ..writeByte(12)
      ..write(obj.priceChange1d)
      ..writeByte(13)
      ..write(obj.priceChange1w)
      ..writeByte(14)
      ..write(obj.websiteUrl)
      ..writeByte(15)
      ..write(obj.redditUrl)
      ..writeByte(16)
      ..write(obj.twitterUrl)
      ..writeByte(17)
      ..write(obj.liked)
      ..writeByte(18)
      ..write(obj.exp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoinDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
