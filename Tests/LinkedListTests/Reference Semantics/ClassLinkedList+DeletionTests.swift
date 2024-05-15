import XCTest
import os
@testable import LinkedList

/// Validation of `ClassLinkedList+Deletion`.
final class ClassLinkedList_DeletionTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `remove(at:)` throws an error when `remove` is called on an empty list.
    func test_removeAt_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        XCTAssertThrowsError(try sut.remove(at: 0))
    }
    
    /// Validates that `remove(at:)` throws an error when the given `index` is less than zero.
    func test_removeAt_index_below_zero() throws {
        let numbers = fixture.randomNumbers()
        let index = -1
        let sut = fixture.makeListSUT(numbers: numbers)
        XCTAssertThrowsError(try sut.remove(at: index))
        XCTAssertEqual(sut.head?.asArray, numbers)
    }
    
    /// Validates that `remove(at:)` throws an error when the given `index` is invalid.
    func test_removeAt_index_invalid() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count + 1
        let sut = fixture.makeListSUT(numbers: numbers)
        XCTAssertThrowsError(try sut.remove(at: index))
        XCTAssertEqual(sut.head?.asArray, numbers)
    }
    
    /// Validates that `remove(at:)` leaves an empty list after removing the only node in a list.
    func test_removeAt_leaves_empty_list() throws {
        let expectedReturnedValue = fixture.randomNumber
        let sut = fixture.makeListSUT(expectedReturnedValue)
        let returnedValue = try sut.remove(at: 0)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(at:)` can remove the head in a two-node list.
    func test_removeAt_head_two_nodes() throws {
        let numbers = fixture.randomNumbers(count: 2)
        let expectedReturnedValue = numbers[0]
        let expectedHeadValue = numbers[1]
        let index = 0
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.remove(at: index)
        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertEqual(sut.head, sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(at:)` can remove the tail in a two-node list.
    func test_removeAt_tail_two_nodes() throws {
        let numbers = fixture.randomNumbers(count: 2)
        let expectedHeadValue = numbers[0]
        let expectedReturnedValue = numbers[1]
        let index = 1
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.remove(at: index)
        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertEqual(sut.head, sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(at:)` can remove the head of a multi-node list.
    func test_removeAt_head() throws {
        let numbers = fixture.randomNumbers()
        let expectedReturnedValue = numbers[0]
        let expectedHeadValue = numbers[1]
        let expectedTailValue = numbers[numbers.count - 1]
        let index = 0
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.remove(at: index)
        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertEqual(sut.tail?.value, expectedTailValue)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(at:)` can remove from the middle of a list.
    func test_removeAt_middle() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        let expectedReturnedValue = numbers[index]

        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.remove(at: index)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(at:)` can remove the tail of a list.
    func test_removeAt_tail() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count - 1
        let expectedTailValue = numbers[index - 1]
        let expectedReturnedValue = numbers[index]

        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.remove(at: index)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
        XCTAssertEqual(sut.tail?.value, expectedTailValue)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }

    /// Validates that `remove(node:)` throws an error when `remove` is called on an empty list.
    func test_removeNode_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        let bogusNode = fixture.makeBogusListNode()
        XCTAssertThrowsError(try sut.remove(node: bogusNode))
    }
    
    /// Validates that `remove(node:)` throws an error when the given `node` isn't in the list.
    func test_removeNode_node_not_found() throws {
        let numbers = fixture.randomNumbers()
        let bogusNode = fixture.makeBogusListNode()
        let sut = fixture.makeListSUT(numbers: numbers)
        XCTAssertThrowsError(try sut.remove(node: bogusNode))
        XCTAssertEqual(sut.head?.asArray, numbers)
    }

    /// Validates that `remove(node:)` leaves an empty list after removing the only node in a list.
    func test_removeNode_leaves_empty_list() throws {
        let expectedReturnedValue = fixture.randomNumber
        let sut = fixture.makeListSUT(expectedReturnedValue)
        let targetNode = try XCTUnwrap(sut.node(at: 0))
        let returnedValue = try sut.remove(node: targetNode)
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(node:)` can remove the head in a two-node list.
    func test_removeNode_head_two_nodes() throws {
        let numbers = fixture.randomNumbers(count: 2)
        let expectedReturnedValue = numbers[0]
        let expectedValue = numbers[1]
        let index = 0
        let sut = fixture.makeListSUT(numbers: numbers)
        let targetNode = try XCTUnwrap(sut.node(at: index))
        let returnedValue = try sut.remove(node: targetNode)
        XCTAssertEqual(sut.head?.value, expectedValue)
        XCTAssertEqual(sut.head, sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(node:)` can remove the tail in a two-node list.
    func test_removeNode_tail_two_nodes() throws {
        let numbers = fixture.randomNumbers(count: 2)
        let expectedValue = numbers[0]
        let expectedReturnedValue = numbers[1]
        let index = 1
        let sut = fixture.makeListSUT(numbers: numbers)
        let targetNode = try XCTUnwrap(sut.node(at: index))
        let returnedValue = try sut.remove(node: targetNode)
        XCTAssertEqual(sut.head?.value, expectedValue)
        XCTAssertEqual(sut.head, sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(node:)` can remove the head of a multi-node list.
    func test_removeNode_head() throws {
        let numbers = fixture.randomNumbers()
        let expectedReturnedValue = numbers[0]
        let expectedHeadValue = numbers[1]
        let expectedTailValue = numbers[numbers.count - 1]
        let sut = fixture.makeListSUT(numbers: numbers)
        let head = try XCTUnwrap(sut.head)
        let returnedValue = try sut.remove(node: head)
        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertEqual(sut.tail?.value, expectedTailValue)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(node:)` can remove from the middle of a list.
    func test_removeNode_middle() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        let expectedReturnedValue = numbers[index]

        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let targetNode = try XCTUnwrap(sut.node(at: index))
        let returnedValue = try sut.remove(node: targetNode)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `remove(node:)` can remove the tail of a list.
    func test_removeNode_tail() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count - 1
        let expectedTailValue = numbers[index - 1]
        let expectedReturnedValue = numbers[index]
        
        var expectedArray = numbers
        expectedArray.remove(at: index)
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let targetNode = try XCTUnwrap(sut.node(at: index))
        let returnedValue = try sut.remove(node: targetNode)
        XCTAssertEqual(sut.head?.asArray, expectedArray)
        XCTAssertEqual(sut.tail?.value, expectedTailValue)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `removeFirst()` throws as error if the list is empty.
    func test_removeFirst_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        XCTAssertThrowsError(try sut.removeFirst())
    }
    
    /// Validates that `removeFirst()` leaves an empty list after removing the only node in a list.
    func test_removeFirst_leaves_empty_list() throws {
        let expectedReturnedValue = fixture.randomNumber
        let sut = fixture.makeListSUT(expectedReturnedValue)
        let returnedValue = try sut.removeFirst()
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `removeFirst()` can remove the head in a two-node list.
    func test_removeFirst_two_nodes() throws {
        let numbers = fixture.randomNumbers(count: 2)
        let expectedReturnedValue = numbers[0]
        let expectedHeadValue = numbers[1]
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.removeFirst()
        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertEqual(sut.head, sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `removeFirst` can remove the head of a multi-node list.
    func test_removeFirst() throws {
        let numbers = fixture.randomNumbers()
        let expectedReturnedValue = numbers[0]
        let expectedHeadValue = numbers[1]
        let expectedTailValue = numbers[numbers.count - 1]
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.removeFirst()
        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertEqual(sut.tail?.value, expectedTailValue)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `removeLast()` throws as error if the list is empty.
    func test_removeLast_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        XCTAssertThrowsError(try sut.removeLast())
    }
    
    /// Validates that `removeLast()` leaves an empty list after removing the only node in a list.
    func test_removeLast_leaves_empty_list() throws {
        let expectedReturnedValue = fixture.randomNumber
        let sut = fixture.makeListSUT(expectedReturnedValue)
        let returnedValue = try sut.removeLast()
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `removeLast()` can remove the head in a two-node list.
    func test_removeLast_two_nodes() throws {
        let numbers = fixture.randomNumbers(count: 2)
        let expectedReturnedValue = numbers[1]
        let expectedTailValue = numbers[0]
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.removeLast()
        XCTAssertEqual(sut.head?.value, expectedTailValue)
        XCTAssertEqual(sut.head, sut.tail)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `removeLast` can remove the head of a multi-node list.
    func test_removeLast() throws {
        let numbers = fixture.randomNumbers()
        let expectedReturnedValue = numbers[numbers.count - 1]
        let expectedTailValue = numbers[numbers.count - 2]
        let sut = fixture.makeListSUT(numbers: numbers)
        let returnedValue = try sut.removeLast()
        XCTAssertEqual(sut.tail?.value, expectedTailValue)
        XCTAssertEqual(returnedValue, expectedReturnedValue)
    }
    
    /// Validates that `removeAll()` does nothing with an empty list.
    func test_removeAll_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        sut.removeAll()
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    /// Validates that `removeAll()` leaves an empty list when removing the only node of a one-node
    /// list.
    func test_removeAll_one_node() throws {
        let sut = fixture.makeListSUT(nodeCount: 1)
        sut.removeAll()
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
    
    /// Validates that `removeAll()` removes all of the nodes in the list.
    func test_removeAll() throws {
        let sut = fixture.makeListSUT()
        sut.removeAll()
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }
}
