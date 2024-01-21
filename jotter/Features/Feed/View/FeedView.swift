import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var showSheet = false
    
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
            .sheet(isPresented: $showSheet, onDismiss: {}, content: {
                CreateJotView()
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button { showSheet.toggle() } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
