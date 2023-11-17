import SwiftUI

struct ThreadCell: View {
    let jot: Jot
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImage(user: jot.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        // NavigationLink(value: jot.user) {}
                        Text(jot.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(jot.timestamp.timeStampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        }
                    }
                    
                    Text(jot.jot)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "text.bubble")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.2.squarepath")
                        }
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .foregroundColor(Theme.primary)
                    .padding(.vertical, 8)
                }
            }
            
            Divider()
        }
        .padding()
        //        .navigationDestination(for: User.self, destination: { user in
        //            UserProfileView(user: user)
        //        })
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(jot: dev.jot)
    }
}
