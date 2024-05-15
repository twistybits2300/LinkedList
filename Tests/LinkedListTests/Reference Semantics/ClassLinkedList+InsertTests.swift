import XCTest
import os
@testable import LinkedList

/// Validation of `ClassLinkedList+Insert`.
final class ClassLinkedList_InsertTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `append(:)` works when appending into an empty list.
    func test_append_empty() throws {
        let expectedValue = fixture.randomNumber
        let sut = fixture.makeEmptyListSUT()
        sut.append(expectedValue)
        XCTAssertEqual(sut.head?.value, expectedValue)
    }
    
    /// Validates that `append(_:)` correctly appends into a list with one node.
    func test_append() throws {
        let randomNumber = fixture.randomNumber
        let sut = fixture.makeListSUT(randomNumber)
        let expectedValue = fixture.randomNumber
        let expectedArray = [randomNumber, expectedValue]
        sut.append(expectedValue)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `append(_:)` can correctly append at the end of a list with multiple nodes.
    func test_append_multiple_nodes() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        var expectedArray = numbers
        expectedArray.append(expectedValue)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        sut.append(expectedValue)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:at:)` works correctly when inserting into an empty list.
    func test_insertAt_empty() throws {
        let expectedValue = fixture.randomNumber
        let sut = fixture.makeEmptyListSUT()
        sut.insert(expectedValue, at: 999)
        XCTAssertEqual(sut.head?.value, expectedValue)
    }
    
    /// Validates that `insert(:at:)` works correctly when inserting at the head of the list.
    func test_insertAt_head() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()
        var expectedArray = [expectedValue]
        expectedArray.append(contentsOf: numbers)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        sut.insert(expectedValue, at: -3)
        XCTAssertEqual(sut.head?.value, expectedValue)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:at:)` can successfuly insert at the list tail.
    func test_insertAt_tail() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()

        /* intentionlly making index well past the tail, to enuser `insert(_:at:)` handles it */
        let index = numbers.count + 99
        var expectedArray = numbers
        expectedArray.append(expectedValue)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        sut.insert(expectedValue, at: index)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:at:)` can insert into the middle of the list.
    func test_insertAt_middle() throws {
        let expectedValue = fixture.randomNumber
        let numbers = fixture.randomNumbers()

        let index = numbers.count / 2
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: index)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        sut.insert(expectedValue, at: index)
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:after:)` throws and error when trying to
    /// insert into an empty list.
    func test_insertAfter_empty() throws {
        let expectedValue = fixture.randomNumber
        let bogusNode = fixture.makeBogusListNode()
        let sut = fixture.makeEmptyListSUT()
        XCTAssertThrowsError(try sut.insert(expectedValue, after: bogusNode))
    }
    
    /// Validates that `insert(_:after:)` can insert into the head of the list.
    func test_insertAfter_head() throws {
        let expectedValue = fixture.randomNumber
        print("expectedValue: \(expectedValue)")
        let numbers = fixture.randomNumbers()
        print("      numbers: \(numbers)")

        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: 1)
        print("expectedArray: \(expectedArray)")
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let head = try XCTUnwrap(sut.head)
        try sut.insert(expectedValue, after: head)
        print("  sut.asArray: \(sut.asArray)")
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:after:)` can insert at the tail of the list.
    func test_insertAfter_tail() throws {
        let expectedValue = fixture.randomNumber
        print("expectedValue: \(expectedValue)")
        let numbers = fixture.randomNumbers()
        print("      numbers: \(numbers)")

        var expectedArray = numbers
        expectedArray.append(expectedValue)
        print("expectedArray: \(expectedArray)")
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let tail = try XCTUnwrap(sut.tail)
        //print("         tail: \(tail.value)")
        try sut.insert(expectedValue, after: tail)
        print("  sut.asArray: \(sut.asArray)")
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `insert(_:after:)` can insert into the middle of the list.
    func test_insertAfter_middle() throws {
        let expectedValue = fixture.randomNumber
        print("expectedValue: \(expectedValue)")
        let numbers = fixture.randomNumbers()
        print("      numbers: \(numbers)")

        let index = numbers.count / 2
        print("   numbers[\(index)]: \(numbers[index])")
        var expectedArray = numbers
        expectedArray.insert(expectedValue, at: index + 1)
        print("expectedArray: \(expectedArray)")
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let middle = try XCTUnwrap(sut.node(at: index))
        print("      middle: \(middle.value)")
        try sut.insert(expectedValue, after: middle)
        print("  sut.asArray: \(sut.asArray)")
        XCTAssertEqual(sut.asArray, expectedArray)
    }
}
