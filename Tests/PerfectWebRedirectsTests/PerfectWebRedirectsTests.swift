import XCTest
@testable import PerfectWebRedirects

class PerfectWebRedirectsTests: XCTestCase {
//	var workingDirectory = "/Users/jonathanguthrie/Documents/Perfect-Collection/Perfect-WebRedirects"


    func testExample() {

		//        XCTAssertEqual(Perfect_WebRedirects().text, "Hello, World!")

		RedirectsConfig.load()
    }


    static var allTests : [(String, (PerfectWebRedirectsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
