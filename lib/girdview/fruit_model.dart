List<Fruit> listSP = [
  Fruit("Nho","25.000","https://product.hstatic.net/1000282430/product/nhoxanh-sea_c5ab2f2350e8487b996cceb12bded862_large.jpg"),
  Fruit("Cóc Thái","55.000","https://cayantraidetrong.com/wp-content/uploads/2021/06/cay-coc-thai-4.jpg"),
  Fruit("Cam", "50.000", "https://files.giaoducthoidai.vn/Uploaded/thuyvt/2018-07-07/cammau4_FTWM.jpg"),
  Fruit("Bưởi","30.000","https://product.hstatic.net/200000393725/product/buoi-da-xanh-1_54bad63c1557443ea4b3726eee074088_large.jpeg"),
  Fruit("Táo xanh", "40.000","http://bizweb.dktcdn.net/thumb/grande/100/433/860/products/tao-xanh-phan-rang-471f63161c5f4fac8b390a263b78ad62-large.jpg?v=1629773447010"),
  Fruit("Mận Bắc", "35.000", "https://product.hstatic.net/1000282430/product/man-my_large.jpg"),
  Fruit("Bơ", "30.000", "https://webtraicay.com/wp-content/uploads/2018/03/bo-dac-lac1.jpg"),
  Fruit("Xoài", "40.000", "https://product.hstatic.net/200000325223/product/xoai-01_e1334c093fb64fa7afc4b505b7d0586a_master.png"),
  Fruit("Quít","30.000","https://bizweb.dktcdn.net/thumb/large/100/036/299/products/quyt.jpg"),
  Fruit("Sầu riêng", "320.000","https://product.hstatic.net/200000416189/product/trai_ri6_9fbb8a6efb704d908a4a0d0e1fd1ace4_large.jpg"),
  Fruit("Nhãn", "45.000", "https://bizweb.dktcdn.net/thumb/large/100/324/966/products/nhanido-0150ba98-b91c-4def-a1c3-7d186575dfe3.jpg?v=1624982756000"),
  Fruit("Chôm chôm","45.000","https://yakaravn.com/wp-content/uploads/2020/07/chom-chom_master.jpg")
];

class Fruit {
  late String? ten;
  late String gia;
  late String url;

  Fruit(this.ten, this.gia, this.url);
}