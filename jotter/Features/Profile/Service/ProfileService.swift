import Firebase
import FirebaseFirestoreSwift

struct ProfileService {
    
    static func fetchJots(uid: String) async throws -> [Jot] {
        let snapshot = try await Firestore
            .firestore()
            .collection("jots")
            .whereField("ownerUid", isEqualTo: uid)
            .getDocuments()
        
        let jots = snapshot.documents.compactMap({ try? $0.data(as: Jot.self) })
        return jots.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() })
    }
}

