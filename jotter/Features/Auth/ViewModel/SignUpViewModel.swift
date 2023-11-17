import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    @Published var errorMessage: String?
    @Published var isSigningIn = false
    @Published var showingAlert = false
    
    @MainActor
    func createUser() async throws {
        isSigningIn = true
        do {
            try await AuthService.shared.signup(
                withEmail: email,
                password: password,
                fullname: fullname,
                username: username
            )
        } catch {
            showingAlert = true
            errorMessage = error.localizedDescription
            print("DEBUG: \(String(describing: errorMessage))")
        }
        isSigningIn = false
    }
}
