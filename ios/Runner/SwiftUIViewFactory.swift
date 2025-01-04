import Flutter
import UIKit


class SwiftUIViewFactory: NSObject, FlutterPlatformViewFactory {
    
    private var messenger: FlutterBinaryMessenger
    init(messenger: FlutterBinaryMessenger) {
           self.messenger = messenger
           super.init()
       }
    
    
    func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        print("Received text from Flutter: \(args ?? "jj")")
        
        let arguments = args as? [String: Any]
        print("Received text from Flutter: \(String(describing: arguments))")
        
       
        
        let postsData = arguments?["posts"] as? [[String: Any]] ?? []
        let posts = postsData.map { postData -> PostModel in
            let userName = postData["userName"] as? String ?? "Unknown"
            let profileImage = postData["profileImage"] as? String ?? "person.fill"
            let postText = postData["postText"] as? String ?? "No text"
            return PostModel(userName: userName, profileImage: profileImage, postText: postText)
            
            
        }
               return SwiftUIViewWrapper(
                frame: frame,
                viewIdentifier: viewId,
                arguments: args,
                posts: posts,
                binaryMessenger: messenger
               )
    }
    
    public func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
             return FlutterStandardMessageCodec.sharedInstance()
       }
}

class SwiftUIViewWrapper: NSObject, FlutterPlatformView {
    private var _view: UIView

    init(
        frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?,
        posts: [PostModel],
        binaryMessenger messenger: FlutterBinaryMessenger?
    ) {
        let controller = SwiftUIViewController(posts: posts)
        _view = controller.view
        _view.frame = frame
        super.init()
    }

    func view() -> UIView {
        return _view
    }
}

