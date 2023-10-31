import Firebase
import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(
        id: NSUUID().uuidString,
        fullname: "Michael Dadzie",
        email: "michael@soulll.com",
        username: "michaeldadzie"
    )
    
    let jot = Jot(
        ownerUid: "000",
        jot: "This is a test jot :)",
        timestamp: Timestamp(),
        likes: 0
    )
}
