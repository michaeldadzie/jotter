import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var jots = [Jot]()
    
    init() {
        Task { try await fetchJots() }
    }
    
    func fetchJots() async throws {
        self.jots = try await FeedService.fetchJots()
        try await fetchUserForJot()
    }
    
    private func fetchUserForJot() async throws {
        for i in 0 ..< jots.count {
            let jot = jots[i]
            let ownerUid = jot.ownerUid
            let jotUser = try await UserService.fetchUser(withUid: ownerUid)
            
            jots[i].user = jotUser
        }
    }
}
