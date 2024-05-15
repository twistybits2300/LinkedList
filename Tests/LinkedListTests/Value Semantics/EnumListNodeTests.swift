import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode`.
final class EnumListNodeTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `ListNode(_value:)` sets `next` to `nil`.
    func test_init_sets_next_nil() throws {
        let expectedValue = fixture.randomNumber
        let sut = EnumListNode(expectedValue)
        
        XCTAssertEqual(sut.currentValue, expectedValue)
        XCTAssertNil(sut.next)
    }
    
    /// Validates that `init(_ value:next:)` correctly captures the
    /// provided parameters.
    func test_init_value_next() throws {
        let nextValue = fixture.randomNumber
        let nextNode = EnumListNode(nextValue)
        XCTAssertEqual(nextNode.currentValue, nextValue)
        XCTAssertNil(nextNode.next)
        
        let expectedValue = fixture.randomNumber
        let sut = EnumListNode(expectedValue, next: nextNode)
        
        XCTAssertEqual(sut.currentValue, expectedValue)
        XCTAssertEqual(sut.next?.currentValue, nextValue)
    }
    
    /// Validates that `insert(_ value:)` into an empty list works as 
    /// expected.
    func test_insert_empty_list_success() throws {
        let expectedValue = fixture.randomNumber
        var sut = EnumListNode(expectedValue)

        XCTAssertEqual(sut.currentValue, expectedValue)
        XCTAssertNil(sut.next)
        
        let expectedNextValue = fixture.randomNumber
        sut.insert(expectedNextValue)
        
        let nextNode = try XCTUnwrap(sut.next)
        XCTAssertEqual(nextNode.currentValue, expectedNextValue)
        XCTAssertNil(nextNode.next)
    }
    
    /// Validates that `insert(_ value:)` into a non-empty list works as 
    /// expected.
    func test_insert_success() throws {
        let firstNumber = fixture.randomNumber
        let secondNumber = fixture.randomNumber
        let thirdNumber = fixture.randomNumber
        
        var sut = EnumListNode(firstNumber)
        XCTAssertEqual(sut.currentValue, firstNumber)
        XCTAssertNil(sut.next)
        
        sut.insert(secondNumber)
        XCTAssertEqual(sut.next?.currentValue, secondNumber)
        XCTAssertNotNil(sut.next)
        XCTAssertNil(sut.next?.next)
        
        sut.insert(thirdNumber)
        XCTAssertEqual(sut.next?.next?.currentValue, thirdNumber)
        XCTAssertNotNil(sut.next?.next)
        XCTAssertNil(sut.next?.next?.next)
    }
}
