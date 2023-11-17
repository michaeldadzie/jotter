import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    @Published var isLoggingIn = false
    @Published var showingAlert = false
    
    @MainActor
    func login() async throws {
        isLoggingIn = true
        do {
            try await AuthService.shared.login(
                withEmail: email,
                password: password
            )
        } catch {
            showingAlert = true
            errorMessage = error.localizedDescription
            print("DEBUG: \(String(describing: errorMessage))")
        }
        isLoggingIn = false
    }
}

