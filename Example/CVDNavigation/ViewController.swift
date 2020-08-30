//
//  ViewController.swift
//  CVDNavigation
//
//  Created by Covitba on 08/29/2020.
//  Copyright (c) 2020 Covitba. All rights reserved.
//

import UIKit
import CVDNavigation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func presentViewControllerB(_ sender: Any) {
        let url = URL(string: "cvd://home/main")!
        let viewController = CVDNavigationRouter.shared.viewController(for: url)

        if let viewController = viewController {
            self.present(viewController, animated: true, completion: nil)
        } else {
            print("unable to load view controller")
        }

    }
}
