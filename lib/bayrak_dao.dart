import 'package:bayrak_oyunu/bayrak.dart';
import 'package:bayrak_oyunu/db_erisim.dart';

class BayrakDao {
  Future<List<Bayrak>> BayrakGetir() async {
    var db = await DbErisim.dbErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("Select * from bayraklar order by random() limit  5");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Bayrak(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }

  Future<List<Bayrak>> YanlisGetir(int bayrak_id) async {
    var db = await DbErisim.dbErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "Select * from bayraklar where bayrak_id != $bayrak_id order by random() limit  5");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Bayrak(
          satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
    });
  }
}
