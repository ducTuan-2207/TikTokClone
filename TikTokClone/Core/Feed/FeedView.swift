import SwiftUI

struct FeedView: View {
    @State private var currentIndex: Int = 0
    let numberOfPosts = 10 // Số lượng bài đăng
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { scrollViewProxy in
                LazyVStack(spacing: 0) {
                    ForEach(0..<numberOfPosts, id: \.self) { postIndex in
                        FeedPostView(postIndex: postIndex)
                            .id(postIndex)
                            .frame(maxWidth: .infinity)
                            .overlay {
                                Text("Post: \(postIndex)")
                                    .foregroundColor(.white)
                                    .padding(8)
                                    .background(Color.black.opacity(0.5))
                                    .cornerRadius(8)
                                    .offset(x: 16, y: 16)
                            }
                            .onAppear {
                                if postIndex == currentIndex && !isPostVisible(postIndex, scrollViewProxy: scrollViewProxy) {
                                    currentIndex += 1 // Chỉ tăng currentIndex khi post hiện tại không hiển thị trên màn hình
                                }
                            }
                    }
                }
                .padding()
                .onChange(of: currentIndex) { newIndex in
                    // Cuộn đến post tiếp theo
                    scrollViewProxy.scrollTo(newIndex)
                }
            }
        }
    }
    
    func isPostVisible(_ index: Int, scrollViewProxy: ScrollViewProxy) -> Bool {
        // Tạo một ID cho post để scrollTo
        let postID = "Post_\(index)"
        
        // Cuộn đến post để xác định vị trí của nó trên màn hình
        scrollViewProxy.scrollTo(postID, anchor: .top)
        
        // Chờ cho việc cuộn đến hoàn thành
        DispatchQueue.main.async {
            // Kiểm tra xem phần tử có hiển thị trên màn hình không
            if let postFrame = try? scrollViewProxy.frame(for: postID) {
                let isVisible = UIScreen.main.bounds.intersects(postFrame)
                print("Post \(index) is visible: \(isVisible)")
                return isVisible
            } else {
                print("Failed to get frame for Post \(index)")
                return false
            }
        }
        return false
    }

}

struct FeedPostView: View {
    let postIndex: Int
    
    var body: some View {
        Rectangle()
            .fill(Color.pink)
            .frame(height: 750)
            .cornerRadius(10)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
