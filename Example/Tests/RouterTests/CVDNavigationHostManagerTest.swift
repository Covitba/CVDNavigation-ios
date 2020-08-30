//
//  CVDNavigationHostManagerTest.swift
//  CVDNavigation_Example
//
//  Created by Martin Victory on 30/08/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import CVDNavigation

class CVDNavigationHostManagerTest: QuickSpec {
    override func spec() {
        describe("NavigationHostManager allows to add deeplinks from each pod, so...") {
            it("should be able to register a deeplink") {
                // Given
                let deeplink = CVDNavigationDeeplink(urlPath: "/path", viewController: MockViewController.self)
                let hostManager = CVDNavigationHostManager()

                // When
                hostManager.registerDeeplink(deeplink)

                // Then
                let url = URL(string: "cvd://host/path")!
                expect(hostManager.hasViewController(for: url)).to(beTrue())
            }

            it("should be able to avoid unregistered deeplinks") {
                // Given
                let deeplink = CVDNavigationDeeplink(urlPath: "/path", viewController: MockViewController.self)
                let hostManager = CVDNavigationHostManager()

                // When
                hostManager.registerDeeplink(deeplink)

                // Then
                let url = URL(string: "cvd://host/path/somethingElse")!
                expect(hostManager.hasViewController(for: url)).to(beFalse())
            }

            it("should be able to return a view controller only for registerd deeplink") {
                // Given
                let deeplink = CVDNavigationDeeplink(urlPath: "/path", viewController: MockViewController.self)
                let hostManager = CVDNavigationHostManager()
                hostManager.registerDeeplink(deeplink)

                // When
                let registeredURL = URL(string: "cvd://host/path")!
                let registeredViewController = hostManager.viewController(for: registeredURL)
                let unregisteredURL = URL(string: "cvd://host/invalidPath")!
                let unregisteredViewController = hostManager.viewController(for: unregisteredURL)

                // Then
                expect(registeredViewController).notTo(beNil())
                expect(type(of: registeredViewController!) == MockViewController.self).to(beTrue())
                expect(unregisteredViewController).to(beNil())
            }
        }
    }
}
