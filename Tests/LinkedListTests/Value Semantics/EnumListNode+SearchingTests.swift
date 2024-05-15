import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode+Searching`.
final class EnumListNode_SearchingTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `find(:)` returns `nil` if the value isn't in the list.
    func test_find_failure() throws {
        let numbers = fixture.randomNumbers()
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        XCTAssertNil(sut.find(fixture.bogusNumber))
    }
    
    /// Validates that `find(_:)` returns the expected value when searching for the first value
    /// in the list.
    func test_find_head() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = try XCTUnwrap(numbers.first)
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        let result = try XCTUnwrap(sut.find(_: expectedValue))
        XCTAssertEqual(result.currentValue, expectedValue)
    }

    /// Validates that `find(_:)` returns the expected value when searching for the last value
    /// in the list.
    func test_find_middle() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        let expectedValue = numbers[index]
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        let result = try XCTUnwrap(sut.find(_: expectedValue))
        XCTAssertEqual(result.currentValue, expectedValue)
    }

    /// Validates that `find(_:)` returns the expected value when searching for the last value
    /// in the list.
    func test_find_tail() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = try XCTUnwrap(numbers.last)
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        let result = try XCTUnwrap(sut.find(_: expectedValue))
        XCTAssertEqual(result.currentValue, expectedValue)
    }

    /// Validates that `contains(:)` returns `false` if the value isn't in the list.
    func test_contains_failure() throws {
        let numbers = fixture.randomNumbers()
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        XCTAssertFalse(sut.contains(fixture.bogusNumber))
    }

    /// Validates that `contains(_:)` returns the expected value when searching for the first value
    /// in the list.
    func test_contains_head() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = try XCTUnwrap(numbers.first)
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        XCTAssertTrue(sut.contains(_: expectedValue))
    }

    /// Validates that `contains(_:)` returns the expected value when searching for the last value
    /// in the list.
    func test_contains_middle() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        let expectedValue = numbers[index]
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        XCTAssertTrue(sut.contains(_: expectedValue))
    }

    /// Validates that `find(_:)` returns the expected value when searching for the last value
    /// in the list.
    func test_contains_tail() throws {
        let numbers = fixture.randomNumbers()
        let expectedValue = try XCTUnwrap(numbers.last)
        let sut = fixture.makeEnumNodeSUT(numbers: numbers)
        XCTAssertTrue(sut.contains(_: expectedValue))
    }
}
