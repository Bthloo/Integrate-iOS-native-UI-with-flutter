import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let factory = SwiftUIViewFactory(messenger: controller.binaryMessenger)
        controller.registrar(forPlugin: "your_plugin_name")?.register(factory, withId: "home_screen")
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

