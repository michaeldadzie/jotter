import Foundation

enum TabBarFilter: Int, CaseIterable, Identifiable {
case jots
case replies
    
    var title: String {
        switch self {
        case .jots: return "Jots"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
