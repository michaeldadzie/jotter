import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0...2, id: \.self) {thread in
                        ThreadCellView()
                    }
                }
            }
            .refreshable {
                print("DEBUG: refresh")
            }
            .navigationTitle("Jotter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
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
