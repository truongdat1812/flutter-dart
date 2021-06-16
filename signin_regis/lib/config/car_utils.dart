import 'package:signin_regis/models/car_item.dart';

class CarUtils {
  static List<CarItem>? cars;

  static List<CarItem> getCarList() {
    if (cars != null) {
      return cars!;
    }

    cars = [];
    cars!.add(CarItem("SEDAN", "assets/images/ic_pickup_sedan.png", 1.5));
    cars!.add(CarItem("SUV", "assets/images/ic_pickup_suv.png", 2));
    cars!.add(CarItem("VAN", "assets/images/ic_pickup_van.png", 2.5));
    cars!.add(CarItem("AUDI", "assets/images/ic_pickup_hatchback.png", 3));

    return cars!;
  }
}
