import Foundation

class UserJotsViewModel: ObservableObject {
    @Published var jots = [Jot]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task { try await fetchJots() }
    }
    
    @MainActor
    func fetchJots() async throws {
        var jots = try await ProfileService.fetchJots(uid: user.id)
        
        for i in 0 ..< jots.count {
            jots[i].user = self.user
        }
        
        self.jots = jots
    }
}
