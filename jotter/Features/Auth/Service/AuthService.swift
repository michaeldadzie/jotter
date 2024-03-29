import FirebaseAuth
import FirebaseFirestore

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        self.userSession = result.user
        try await UserService.shared.fetchCurrentUser()
    }
    
    @MainActor
    func signup(
        withEmail email: String,
        password: String,
        fullname: String,
        username: String
    ) async throws {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        self.userSession = result.user
        try await uploadUserData(withEmail: email, fullname: fullname, username: username , id: result.user.uid)
    }
    
    @MainActor
    func uploadUserData(
        withEmail email: String,
        fullname: String,
        username: String,
        id: String
    ) async throws {
        let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return}
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
    
     func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
         UserService.shared.reset()
    }
}
