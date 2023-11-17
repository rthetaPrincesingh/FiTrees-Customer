import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class attendenceScreenController extends GetxController {

  MobileScannerController qrController = MobileScannerController(
    detectionSpeed: DetectionSpeed.normal,
    facing: CameraFacing.back,
  );

  RxBool flashLight = false.obs;

  RxString qrCode = "".obs;
  @override
  void onClose() {
    qrCode.value = "";
    qrController.dispose();
    super.onClose();
  }
}
