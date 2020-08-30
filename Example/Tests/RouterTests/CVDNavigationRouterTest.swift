import Quick
import Nimble
@testable import CVDNavigation

class CVDNavigationRouterTest: QuickSpec {
    override func spec() {
        describe("NavigationRouter is the main app's router. It's in charge of handling deeplinks navigation, so...") {
            it("can only be accesed through the shared class variable") {
                expect(CVDNavigationRouter.shared).to(beAnInstanceOf(CVDNavigationRouter.self))
            }

            it("should be able to add a valid host manager") {
                // Given
                let router = CVDNavigationRouter.shared
                let hostManager = CVDNavigationHostManager()
                let viewControllerMock = UIViewController.self
                hostManager.registerDeeplink(CVDNavigationDeeplink(urlPath: "/path", viewController: viewControllerMock))

                // When
                router.register(hostManager: hostManager, forHost: "host")

                // Then
                let url = URL(string: "cvd://host/path")!
                expect(router.hasViewController(for: url)).to(beTrue())
            }

            it("should be able to identify the view controllers correctly") {
                // Given
                let router = CVDNavigationRouter.shared
                let hostManager = CVDNavigationHostManager()
                let viewControllerMock = UIViewController.self
                hostManager.registerDeeplink(CVDNavigationDeeplink(urlPath: "/path", viewController: viewControllerMock))

                // When
                router.register(hostManager: hostManager, forHost: "host")

                // Then
                let url = URL(string: "cvd://host/path")!
                expect(router.hasViewController(for: url)).to(beTrue())
                let urlWithWrongPath = URL(string: "cvd://host/path1")!
                expect(router.hasViewController(for: urlWithWrongPath)).to(beFalse())
                let urlWithWrongHost = URL(string: "cvd://host1/path")!
                expect(router.hasViewController(for: urlWithWrongHost)).to(beFalse())
            }

            it("should return the correct view controller for the deeplink") {
                // Given
                let router = CVDNavigationRouter.shared
                let hostManager = CVDNavigationHostManager()
                let viewControllerMock = MockViewController.self
                hostManager.registerDeeplink(CVDNavigationDeeplink(urlPath: "/mock", viewController: viewControllerMock))
                router.register(hostManager: hostManager, forHost: "hostForMock")
                let url = URL(string: "cvd://hostForMock/mock")!

                // When
                let viewControllerFromRouter = router.viewController(for: url)

                // Then
                expect(viewControllerFromRouter).notTo(beNil())
                expect(type(of: viewControllerFromRouter!) == viewControllerMock).to(beTrue())
            }

            it("should validate the deeplink scheme is correct") {
                // Given
                let router = CVDNavigationRouter.shared
                let hostManager = CVDNavigationHostManager()
                let viewControllerMock = MockViewController.self
                hostManager.registerDeeplink(CVDNavigationDeeplink(urlPath: "/mock", viewController: viewControllerMock))
                router.register(hostManager: hostManager, forHost: "hostForMock")

                // When
                let url = URL(string: "wrong://hostForMock/mock")!

                // Then
                expect(router.hasViewController(for: url)).to(beFalse())
                expect(router.viewController(for: url)).to(beNil())
            }

            it("should validate the host is present") {
                // Given
                let router = CVDNavigationRouter.shared
                let hostManager = CVDNavigationHostManager()
                let viewControllerMock = MockViewController.self
                hostManager.registerDeeplink(CVDNavigationDeeplink(urlPath: "/mock", viewController: viewControllerMock))
                router.register(hostManager: hostManager, forHost: "hostForMock")

                // When
                let url = URL(string: "cvd://wrongHost/mock")!

                // Then
                expect(router.hasViewController(for: url)).to(beFalse())
                expect(router.viewController(for: url)).to(beNil())
            }

        }
    }
}
