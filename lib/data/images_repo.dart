import 'package:catterest/data/data_service.dart';
import 'package:catterest/data/image_model.dart';

class ImagesRepository {
  List images = [];

  final DataService dataService;

  ImagesRepository(this.dataService);

  void fetchImages(int amount) async {
    List<ImageURL> image = await dataService.getImages(amount);
    images.add(image);
  }
}
