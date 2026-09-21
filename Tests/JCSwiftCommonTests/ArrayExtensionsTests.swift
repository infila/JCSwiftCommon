import XCTest
import JCSwiftCommon

final class ArrayExtensionsTests: XCTestCase {
  func testRemoveOnlyFirstOccurrence() {
    var values = ["1", "2", "3", "2", "4", "2"]
    values.remove("2", onlyFirst: true)
    XCTAssertEqual(values, ["1", "3", "2", "4", "2"])
  }

  func testRemoveAllOccurrences() {
    var values = ["1", "2", "3", "2", "4", "2"]
    values.remove("2")
    XCTAssertEqual(values, ["1", "3", "4"])
  }
}
