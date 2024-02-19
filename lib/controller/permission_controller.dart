import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionController extends GetxController{
  final Rx<PermissionStatus> _cameraPermissionStatus =
      PermissionStatus.denied.obs;
  PermissionStatus get cameraPermissionStatus => _cameraPermissionStatus.value;
  Future<void> checkCameraPermissionStatus() async {
    try {
      PermissionStatus statusCamera = await Permission.camera.status;
      _cameraPermissionStatus.value = statusCamera;
      update();
     // updatePermissionStatusInList(PermissionType.camera, statusCamera);

    } on Exception catch (_) {}
  }

  Future<PermissionStatus> requestCameraPermission() async {
    var status = await Permission.camera.request();
    _cameraPermissionStatus.value = status;
   // updatePermissionStatusInList(PermissionType.camera, status);
    return status;
  }

  void updatePermissionStatusInList(camera, PermissionStatus status) {}



}