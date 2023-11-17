import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.jots) { jot in
                        ThreadCell(jot: jot)
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchJots() }
            }
            .navigationTitle("Jotter")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Image(systemName: "arrow.counterclockwise")
//                        .foregroundColor(.black)
//                }
//            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
