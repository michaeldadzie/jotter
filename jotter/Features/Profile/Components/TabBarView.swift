import SwiftUI

struct TabBarView: View {
    @StateObject var viewModel: UserJotsViewModel
    @State private var selectedFilter: TabBarFilter = .jots
    @Namespace var animation
    
    private var filterBarWidth: CGFloat {
        let count = CGFloat(TabBarFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserJotsViewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(TabBarFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(Theme.primary)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                            
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                ForEach(viewModel.jots) { jot in
                    ThreadCell(jot: jot)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(user: dev.user)
    }
}
