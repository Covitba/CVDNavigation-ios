//
//  CVDNavigationDeeplink.swift
//  CVDNavigation
//
//  Created by Martin Victory on 29/08/2020.
//

import Foundation
import UIKit

/// This struct is a model containing a deeplink url associated with a UIViewController
public struct CVDNavigationDeeplink {

    // URL path used to display the associated view Controller
    let urlPath: String

    // UIViewController to be shown with the associated URL
    let viewController: UIViewController.Type

    public init(urlPath: String, viewController: UIViewController.Type) {
        self.urlPath = urlPath
        self.viewController = viewController
    }
}
