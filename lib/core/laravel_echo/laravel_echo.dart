import 'package:laravel_echo/laravel_echo.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';

class PusherConfig {
  static const key = "21fe88719842ee7606a5";
  static const cluster = "ap2";
  static const port = 6001;
  static const hostEndPoint = "192.168.1.105";
  static const hostAuthEndPoint =
      "http://192.168.1.105:8000/api/broadcasting/auth";
  static var options = PusherOptions(
      auth: PusherAuth(
        PusherConfig.hostAuthEndPoint,
      ),
      host: PusherConfig.hostEndPoint,
      port: PusherConfig.port,
      encrypted: true,
      cluster: PusherConfig.cluster);
}

createEcho(String id, var pusher, var token, var options) {
  Echo echo = Echo(
    //broadcaster: EchoBroadcasterType.SocketIO,
    client: pusher,
  );
  //echo.join("Messenger.$id");
  echo.private("Messenger.${id}");
  // echo.private("Messenger.${id}").listen("MessageSent", (e) {
  //   print(
  //       "Received message:///////////////////////////////////////////////////////////////////////// ${e.toString()}"); // Example usage
  // });
  echo.connect();
}

class LaravelEcho {
  static LaravelEcho? _singleton;
  static late Echo _echo;
  final String token;

  LaravelEcho._({
    required this.token,
  }) {
    _echo = createLaravelEcho(token);
  }

  factory LaravelEcho.init({
    required String token,
  }) {
    if (_singleton == null || token != _singleton?.token) {
      _singleton = LaravelEcho._(token: token);
    }

    return _singleton!;
  }

  static Echo get instance => _echo;

  //static String get socketId => _echo!.socketId() ?? "11111.11111111";
}

PusherClient createPusherClient(String token) {
  PusherOptions options = PusherOptions(
    port: PusherConfig.port,
    encrypted: true,
    host: PusherConfig.hostEndPoint,
    cluster: PusherConfig.cluster,
    auth: PusherAuth(
      PusherConfig.hostAuthEndPoint,
      headers: {
        'Authorization': "Bearer $token",
      },
    ),
  );

  PusherClient pusherClient = PusherClient(
    PusherConfig.key,
    options,
    enableLogging: true,
  );

  return pusherClient;
}

Echo createLaravelEcho(String token) {
  print(PusherConfig.hostAuthEndPoint);
  return Echo(
    client: createPusherClient(token),
  );
}
