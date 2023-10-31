import Firebase
import FirebaseFirestoreSwift

struct Jot: Identifiable, Codable {
    @DocumentID var jotId: String?
    
    let ownerUid: String
    let jot: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        return jotId ?? NSUUID().uuidString
    }
    
    var user: User?
}
