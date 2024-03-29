import SwiftUI

struct JotterTabView: View {
    @State private var selectedTab = 0
    @State private var previousTab = 0
    @State private var showSheet = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear { selectedTab = 0 }
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear { selectedTab = 1 }
                .tag(1)
            
            Text("")
                .tabItem {
                    Image(systemName: selectedTab == 2 ? "plus.app.fill" : "plus.app")
                        .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                }
                .onAppear {
                    showSheet.toggle()
                    selectedTab = previousTab
                }
                .tag(2)
            
            Text("Activity")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear { selectedTab = 3 }
                .tag(3)
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear { selectedTab = 4 }
                .tag(4)
            
        }
        .onChange(of: selectedTab) {
            if selectedTab != 2 {
                previousTab = selectedTab
            }
        }
        .sheet(isPresented: $showSheet, onDismiss: {}, content: {
            CreateJotView()
        })
        .tint(Theme.primary)
    }
}

#Preview {
    JotterTabView()
}
