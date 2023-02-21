import 'dart:io';
import 'dart:typed_data';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/add_data_controller.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class ScanController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController _cameraController;
  final RxBool _isInitialized = RxBool(false);
  CameraImage? _cameraImage;
  CameraController get cameraController => _cameraController;
  bool get isInitialized => _isInitialized.value;
  late Uint8List catureImage;
  final adddataController = Get.find<AddDataController>();



  @override
  void dispose() {
    _isInitialized.value = false;
    _cameraController.dispose();
    super.dispose();
  }
   @override
  void onInit() async {
    super.onInit();
  }


  Future<void> initCamera() async {
    _cameras = await availableCameras();
    _cameraController =
        CameraController(_cameras[0], ResolutionPreset.high, imageFormatGroup: ImageFormatGroup.bgra8888);
    _cameraController.initialize().then((value) {
      _isInitialized.value = true;
      _cameraController.startImageStream((image) => _cameraImage = image);
      // print(DateTime.now().microsecondsSinceEpoch)
      _isInitialized.refresh();
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }

 
  void capture()async {
    var xFile = await _cameraController.takePicture();
    var path = xFile.path;
    print(path);
    adddataController.catureImage(path);
  }
}
