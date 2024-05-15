import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode+Utility`.
final class EnumListNode_UtilityTests: XCTestCase {
    private let fixture = LinkedListFixture()
    
    /// Validates that `count` returns the expected value when there are multiple
    /// nodes in the list..
    func test_count_multiple_nodes() throws {
        let numbers = fixture.randomNumbers()
        let expectedCount = numbers.count
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        XCTAssertEqual(sut.count, expectedCount)
    }
    
    /// Validates that `count` returns the expected value when there's only a
    /// single node in the list.
    func test_count_one_node() throws {
        let expectedValue = fixture.randomNumber
        let sut = EnumListNode(expectedValue)
        XCTAssertEqual(sut.count, 1)
    }
 
    /// Validates that `reverse()` works correctly with a list that has a single node in it.
    func test_reverse_one_node() throws {
        let expectedValue = fixture.randomNumber
        var sut = EnumListNode(expectedValue)
        sut.reverse()
        XCTAssertEqual(sut.currentValue, expectedValue)
    }
    
    /// Validates that `reverse()` works as expected.
    func test_reverse() throws {
        let numbers = fixture.randomNumbers()
        let expectedArray = Array(numbers.reversed())
        var sut = fixture.makeEnumNodeSUT(numbers: numbers)
        sut.reverse()
        XCTAssertEqual(sut.asArray, expectedArray)
    }
}
