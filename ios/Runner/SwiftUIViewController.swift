//
//  SwiftUIViewController.swift
//  Runner
//
//  Created by Bthloo on 04/01/2025.
//


import UIKit
import SwiftUI

class SwiftUIViewController: UIViewController {

    private var posts: [PostModel]

       init(posts: [PostModel]) {
           self.posts = posts
           super.init(nibName: nil, bundle: nil)
       }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

       
        let swiftUIView = PostsView(posts: posts)
        let hostingController = UIHostingController(rootView: swiftUIView)

        addChild(hostingController)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
    }
}



