//
//  ViewController.swift
//  Example
//
//  Created by fuyoufang on 2018/5/19.
//  Copyright © 2018 fuyoufang. All rights reserved.
//

import UIKit
import FYFImagePicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let controller = ImagePickerNavigationController.init(maxImageCount: 9)
        present(controller, animated: true)
    }
}

