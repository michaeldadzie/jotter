import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @EnvironmentObject var launchViewModel: LaunchScreenViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                JotterTabView()
            } else {
                LoginView()
            }
        }
        .onAppear {
            DispatchQueue
                .main
                .asyncAfter(deadline: .now() + 2) {
                    launchViewModel.dismiss()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LaunchScreenViewModel())
    }
}
