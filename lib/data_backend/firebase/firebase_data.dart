import 'package:cloud_firestore/cloud_firestore.dart';

class SinhVien
{
  String? id, ten, lop, queQuan, namSinh,anh;

  SinhVien({required this.id,required this.ten, this.lop, this.queQuan, this.namSinh, this.anh});
  factory SinhVien.fromJson(Map<String,dynamic> json)
  {
    return SinhVien(
        id: json["id"] as String,
        ten: json["ten"]as String,
        lop: json["lop"]as String,
        queQuan: json["queQuan"] as String,
        namSinh: json["namSinh"] as String,
        anh: json["anh"]
    );
  }
  Map<String, dynamic> toJson()
  {
    return
        {
          "id": this.id,
          "ten": this.ten,
          "lop": this.lop,
          "queQuan": this.queQuan,
          "namSinh": this.namSinh,
          "anh":this.anh,
        };
  }
}
class SinhVienSnapshot
{
  SinhVien? sinhVien;
  DocumentReference? docRef;

  SinhVienSnapshot({required this.sinhVien,required this.docRef});
   factory SinhVienSnapshot.fromSnapshot(DocumentSnapshot docSnap)
   {
     return SinhVienSnapshot(
         sinhVien: SinhVien.fromJson(docSnap.data() as Map<String, dynamic>),
         docRef: docSnap.reference,);
   }
   Future<void> capNhap(SinhVien sv) async
   {
     await docRef!.update(sv.toJson());
   }
   Future<void> delete() async
   {
     await docRef!.delete();
   }
   static Future<DocumentReference> addNew(SinhVien sv)
   async {
     return FirebaseFirestore.instance.collection("SinhVien").add(sv.toJson());
   }
   static Stream<List<SinhVienSnapshot>> getAllSinhVien()
   {
     Stream<QuerySnapshot> qs = FirebaseFirestore.instance.collection("SinhVien").snapshots();
     Stream<List<DocumentSnapshot>> listDocSnap = qs.map((qsnap) => qsnap.docs);
     return listDocSnap.map((lds) =>
         lds.map((docSnap) => SinhVienSnapshot.fromSnapshot(docSnap)).
         toList());
   }
}