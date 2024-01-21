import FirebaseCore
import SwiftUI
import os

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct JotterApp: App {
    @StateObject var viewModel = LaunchScreenViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
      
    var body: some Scene {
        WindowGroup {
            ZStack {
                ContentView()
                
                if viewModel.state != .completed {
                    LaunchScreenView()
                }
            }
            .environmentObject(viewModel)
        }
        #if os(visionOS)
        .defaultSize(CGSize(width: 600, height: 1000))
        #endif
    }
}
