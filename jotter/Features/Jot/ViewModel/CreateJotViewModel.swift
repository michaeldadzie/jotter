import Firebase

class CreateJotViewModel: ObservableObject {
    @Published var jot = ""
      
    func uploadJot() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let jot = Jot(
            ownerUid: uid,
            jot: jot,
            timestamp: Timestamp(),
            likes: 0
        )
        try await JotService.uploadJot(jot)
    }
}
