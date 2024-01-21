import SwiftUI

struct UserCell: View {
    let user: User
    
    var body: some View {
        HStack {
            CircularProfileImage(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
            }
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray), lineWidth: 1)
                }
                .onTapGesture {
                    
                }
        }
        .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: dev.user)
    }
}
