//
//  CVDNavigationHostManager.swift
//  CVDNavigation
//
//  Created by Martin Victory on 29/08/2020.
//

import Foundation
import UIKit

/// This is a host manager to add deeplinks from a library
public class CVDNavigationHostManager {

    // keep track of the deeplinks from this host manager
    private var pathsToViewController: [String: UIViewController.Type]

    // MARK: - Initializer
    public init() {
        self.pathsToViewController = [:]
    }

    // MARK: - Configuration

    /// Register a deeplink. If the path already exits, it's replaced
    public func registerDeeplink(_ deeplink: CVDNavigationDeeplink) {
        self.pathsToViewController[deeplink.urlPath] = deeplink.viewController
    }

    // MARK: - Obtain View Controllers

    /// Checks if the deeplink path is registered
    public func hasViewController(for deeplink: URL) -> Bool {
        if pathsToViewController[deeplink.path] == nil {
            return false
        }

        return true
    }

    /// Returns the view controller with the associated path for the current host manager
    public func viewController(for deeplink: URL) -> UIViewController? {
        guard let viewControllerType = pathsToViewController[deeplink.path] else {
            NSLog("Trying to load view controller from deeplink with incorrect path %@", deeplink.path)
            return nil
        }

        // parse parameters
        let params = parseParams(of: deeplink)

        // initialize view controller
        return viewControllerType.init()
    }

    private func parseParams(of url: URL) -> [String: String] {
        var params = [String: String]()

        if let components = URLComponents(url: url, resolvingAgainstBaseURL: false) {
            if let queryItems = components.queryItems {
                for item in queryItems {
                    params[item.name] = item.value ?? ""
                }
            }
        }

        return params
    }
}
