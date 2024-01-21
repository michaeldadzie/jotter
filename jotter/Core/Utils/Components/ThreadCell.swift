import SwiftUI

struct ThreadCell: View {
    let jot: Jot
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImage(user: jot.user, size: .small)
                
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(jot.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text(jot.timestamp.timeStampString())
                            .font(.caption)
                            #if !os(visionOS)
                            .foregroundColor(Color(.systemGray3))
                            #endif
                            #if os(visionOS)
                            .foregroundColor(Color(.systemGray))
                            #endif
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                #if !os(visionOS)
                                .foregroundColor(Color(.darkGray))
                                #endif
                        }
                        #if os(visionOS)
                        .foregroundColor(Color(.systemGray))
                        .buttonStyle(.plain)
                        #endif
                    }
                    
                    Text(jot.jot)
                        .font(.footnote)
                        .lineLimit(3)
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
                    #if !os(visionOS)
                    .foregroundColor(Theme.primary)
                    .padding(.vertical, 2)
                    #endif
                    #if os(visionOS)
                    .foregroundColor(Color(.systemGray))
                    .buttonStyle(.plain)
                    #endif
                }
            }
            #if !os(visionOS)
            Divider()
            #endif
        }
        .padding()
        #if os(visionOS)
        .background()
        .cornerRadius(8)
        .padding(.horizontal)
        #endif
    }
}

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadCell(jot: dev.jot)
    }
}
