import 'package:laravel_echo/laravel_echo.dart';
import 'package:pusher_client/pusher_client.dart';

class LaravelEcho {
  static LaravelEcho? singleton;
  static late Echo echo;
  final String token;

  LaravelEcho._({required this.token}) {
    echo = createEcho(this.token);
  }
  factory LaravelEcho.init({
    required String token,
  }) {
    if (singleton == null || token != singleton) {
      singleton = LaravelEcho._(token: token);
    }
    return singleton!;
  }
  static Echo get instance => echo;
  static String get socketId => echo.socketId() ?? "11111.11111111";
}

class PusherConfig {
  static const appId = "1472166";
  static const key = "277ff24ebce4b36ad66e";
  static const secret = "feff48ba621eefd47ce0";
  static const cluster = "ap1";
  static const port = 6001;
  static const hostEndPoint = " https://e1c5-138-199-7-182.ngrok-free.app";
  static const hostAuthEndPoint = "$hostEndPoint/broadcasting/auth";
}

PusherClient createPusherClient(String token) {
  PusherOptions options = new PusherOptions(
    wsPort: PusherConfig.port,
    encrypted: true,
    host: PusherConfig.hostAuthEndPoint,
    cluster: PusherConfig.cluster,
    auth: PusherAuth(PusherConfig.hostAuthEndPoint, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
      'Accept': 'application/json'
    }),
  );
  PusherClient client = new PusherClient(
    PusherConfig.key,
    options,
    autoConnect: false,
    enableLogging: true,
  );
  return client;
}

Echo createEcho(String token) {
  return Echo(
      client: createPusherClient(token),
      broadcaster: EchoBroadcasterType.Pusher);
}
