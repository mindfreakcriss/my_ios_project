import SwiftUI

struct WallpaperGridView: View {

    @State private var wallpapers: [Wallpaper] = []
    let unsplashURL: String = "http://localhost:8002/site/test"

    //网络请求
    func fetchPhotos() {
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: URL(string: unsplashURL)!) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode

                if statusCode == 200, let data = data {
                    do {
                        let decoder = JSONDecoder()
                        print(decoder)
                        let decodePhotos = try decoder.decode([Wallpaper].self, from: data)
                        DispatchQueue.main.async {
                            self.wallpapers = decodePhotos
                        }
                    } catch {
                        print("Error decoding JSON:\(error)")
                    }
                } else {
                    print("HTTP 错误码 \(statusCode)")
                }
            } else if let error = error {
                print("错误信息： \(error.localizedDescription)")
            } else {
                print("未知错误")
            }
        }
        task.resume()
    }

    //网格布局参数
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            //网格视图
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout, spacing: 10) {
                    ForEach(wallpapers, id: \.id) { wallpaper in
                        WebImageView(imageURL: wallpaper.urls.small)
                    }
                }
            }.padding(.horizontal).navigationTitle("壁纸推荐")
        }.onAppear {
            fetchPhotos()
        }
    }
}

#Preview() {
    WallpaperGridView()
}
