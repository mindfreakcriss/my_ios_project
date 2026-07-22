//

import SwiftUI

struct NetworkItemView: View {

    let imageUrl: String =
        "https://img2.baidu.com/it/u=1793612391,1405163243&fm=253&fmt=auto&app=138&f=JPEG?w=380&h=380"

    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case let .success(image):
                image.resizable().aspectRatio(contentMode: .fit).cornerRadius(8).padding()
            case .failure:
                Text("加载失败了")
            @unknown default:
                EmptyView()
            }
        }
    }
}

#Preview() {
    NetworkItemView()
}
