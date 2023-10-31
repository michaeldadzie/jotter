import Kingfisher
import SwiftUI

struct CircularProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
//    init(user: User?) {
//        self.user = user
//    }
    
    var body: some View {
        if let imageUrl = user?.imageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: size.dimension, height: size.dimension)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: size.dimension, height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircularProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImageView(user: dev.user, size: .medium)
    }
}
