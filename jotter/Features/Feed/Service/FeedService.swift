import Firebase
import FirebaseFirestoreSwift

struct FeedService {
    
    static func fetchJots() async throws -> [Jot] {
        let snapshot = try await Firestore
            .firestore()
            .collection("jots")
            .order(by: "timestamp", descending: true)
            .getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Jot.self) })
    }
}
