import SwiftUI

struct UserProfileView: View {
    let user: User
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
               ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(Theme.secondary)
                        .frame(width: 352, height: 32)
                        .background(Theme.primary)
                        .cornerRadius(8)
                }
                
                TabBarView(user: user)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(user: dev.user)
    }
}
