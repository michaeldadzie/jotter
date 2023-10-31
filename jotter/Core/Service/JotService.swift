import Firebase
import FirebaseFirestoreSwift
import Foundation

struct JotService {
    
    static func uploadJot(_ jot: Jot) async throws {
        guard let jotData = try? Firestore.Encoder().encode(jot) else { return }
        try await Firestore.firestore().collection("jots").addDocument(data: jotData)
    }
}
