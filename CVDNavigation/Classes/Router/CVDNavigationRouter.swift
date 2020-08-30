//
//  CVDNavigationRouter.swift
//  CVDNavigation
//
//  Created by Martin Victory on 29/08/2020.
//

import Foundation
import UIKit

/// This is the main app's router for loading view controllers
public class CVDNavigationRouter {

    public static let CVDSchemeForDeeplinks = "cvd"

    // MARK: - Internal properties

    // A dictionary mapping the hosts to the host manager
    private var hostMapper: [String: CVDNavigationHostManager]

    // MARK: - Singleton

    /// Singleton variable to get the instance
    public static let shared = CVDNavigationRouter()

    // MARK: - Initializer

    // Mark the initializer as private to make this class a singleton
    private init() {
        self.hostMapper = [:]
    }

    // MARK: - Router Configuration

    /// Register a new HostManager to the router
    /// @returns true if the host manager was added succesfully
    @discardableResult
    public func register(hostManager: CVDNavigationHostManager, forHost host: String) -> Bool {
        // check if we already have a host manager assigned to that host
        if hostMapper[host] != nil {
            return false
        }

        hostMapper[host] = hostManager

        return true
    }

    // MARK: - Router deeplink navigation

    /// Checks if the deeplink is registered
    public func hasViewController(for deeplink: URL) -> Bool {
        // check deeplink url to have the correct format
        guard let scheme = deeplink.scheme, let host = deeplink.host else {
            NSLog("Trying to load view controller from deeplink with incorrect format")
            return false
        }

        // check deeplink url matches for internal deeplink
        if scheme != CVDNavigationRouter.CVDSchemeForDeeplinks {
            NSLog("Trying to load view controller from deeplink with incorrect scheme %@", scheme)
            return false
        }

        if let hostManager = hostMapper[host] {
            return hostManager.hasViewController(for: deeplink)
        } else {
            NSLog("Trying to load view controller from deeplink with incorrect host %@", host)
            return false
        }
    }

    /// Returns the view controller for the deeplink
    public func viewController(for deeplink: URL) -> UIViewController? {
        // check the deeplink is valid
        if !hasViewController(for: deeplink) {
            return nil
        }

        guard let host = deeplink.host else {
            return nil
        }

        // get the view controller from the hostManager associated to the deeplink host
        if let hostManager = hostMapper[host] {
            return hostManager.viewController(for: deeplink)
        }

        return nil
    }
}
