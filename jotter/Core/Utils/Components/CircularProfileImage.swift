import Kingfisher
import SwiftUI

struct CircularProfileImage: View {
    var user: User?
    let size: ProfileImageSize
    
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
                #if os(visionOS)
                .foregroundColor(.white)
                #endif
                .foregroundColor(Color(.systemGray4))
        }
    }
}

struct CircularProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        CircularProfileImage(user: dev.user, size: .medium)
    }
}
