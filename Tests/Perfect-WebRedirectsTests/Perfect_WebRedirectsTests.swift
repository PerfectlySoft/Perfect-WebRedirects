import XCTest
@testable import Perfect_WebRedirects

class Perfect_WebRedirectsTests: XCTestCase {
//	var workingDirectory = "/Users/jonathanguthrie/Documents/Perfect-Collection/Perfect-WebRedirects"


    func testExample() {

		//        XCTAssertEqual(Perfect_WebRedirects().text, "Hello, World!")

		RedirectsConfig.load()
    }


    static var allTests : [(String, (Perfect_WebRedirectsTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
