import Foundation

class SignUpViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.signup(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    }
}
