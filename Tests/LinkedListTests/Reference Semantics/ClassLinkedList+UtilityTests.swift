import XCTest
import os
@testable import LinkedList

/// Validation of `ClassLinkedList+Utility`.
final class ClassLinkedList_UtilityTests: XCTestCase {
    private let fixture = LinkedListFixture()
    private var didCallVisitor = false
    private var visitorNodeCount = 0
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        didCallVisitor = false
        visitorNodeCount = 0
    }

    /// Validates that `tracerse(visit:)` does not call `visitor` when the list is empty.
    func test_traverse_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        sut.traverse(visit: nodeVisitor(node:))
        XCTAssertFalse(didCallVisitor)
        XCTAssertEqual(visitorNodeCount, 0)
    }
    
    /// Validates that `traverse(visit:)` calls `visitor` exactly once when there's one node in
    /// the list.
    func test_traverse_one_node() throws {
        let sut = fixture.makeListSUT(nodeCount: 1)
        sut.traverse(visit: nodeVisitor(node:))
        XCTAssertTrue(didCallVisitor)
        XCTAssertEqual(visitorNodeCount, 1)
    }
    
    /// Validates that `traverse(visit:)` visits each node in the list, calling each only once.
    func test_traverse() throws {
        let numbers = fixture.randomNumbers()
        let expectedCount = numbers.count
        let sut = fixture.makeListSUT(numbers: numbers)
        sut.traverse(visit: nodeVisitor(node:))
        XCTAssertTrue(didCallVisitor)
        XCTAssertEqual(visitorNodeCount, expectedCount)
    }
    
    /// Validates that `node(at:)` returns `nil` if the list is empty.
    func test_nodeAt_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        XCTAssertNil(sut.node(at: 0))
    }
    
    /// Validates that `node(at:)` returns the expected value in a single node list.
    func test_nodeAt_one_node() throws {
        let expectedValue = fixture.randomNumber
        let sut = fixture.makeListSUT(expectedValue)
        let foundNode = try XCTUnwrap(sut.node(at: 0))
        XCTAssertEqual(foundNode.value, expectedValue)
    }
    
    /// Validates that `node(at:)` returns the expected value.
    func test_nodeAt() throws {
        let numbers = fixture.randomNumbers()
        let index = numbers.count / 2
        let expectedValue = numbers[index]
        
        let sut = fixture.makeListSUT(numbers: numbers)
        let foundNode = try XCTUnwrap(sut.node(at: index))
        XCTAssertEqual(foundNode.value, expectedValue)
    }
    
    /// Validates that `count` returns zero when the list is empty.
    func test_count_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        XCTAssertEqual(sut.count, 0)
    }
    
    /// Validates that `count` returns the expected value.
    func test_count() throws {
        let numbers = fixture.randomNumbers()
        let expectedCount = numbers.count
        let sut = fixture.makeListSUT(numbers: numbers)
        XCTAssertEqual(sut.count, expectedCount)
    }
    
    /// Validates that `isEmpty` returns `true` when the list is empty.
    func test_isEmpty_true() throws {
        let sut = fixture.makeEmptyListSUT()
        XCTAssertTrue(sut.isEmpty)
    }
    
    /// Validates that `isEmpty` returns `false` when the list is not empty.
    func test_isEmpty_false() throws {
        let sut = fixture.makeListSUT(nodeCount: 1)
        XCTAssertFalse(sut.isEmpty)
    }
    
    /// Validates that `reverse()` does nothing with an empty list.
    func test_reverse_empty() throws {
        let sut = fixture.makeEmptyListSUT()
        sut.reverse()
        XCTAssertNil(sut.head)
    }
    
    /// Validates that `reverse()` does nothing when the list contains a single node.
    func test_reverse_one_node() throws {
        let expectedValue = fixture.randomNumber
        let sut = fixture.makeListSUT(expectedValue)
        sut.reverse()
        XCTAssertEqual(sut.head?.value, expectedValue)
    }
    
    /// Validates that `reverse()` works as expected with a single node list.
    func test_reverse_two_nodes() throws {
        let numbers = fixture.randomNumbers(count: 2)
        let expectedArray = Array(numbers.reversed())

        let sut = fixture.makeListSUT(numbers: numbers)
        sut.reverse()
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `reverse()` works as expected.
    func test_reverse() throws {
        let numbers = fixture.randomNumbers()
        let expectedArray = Array(numbers.reversed())

        let sut = fixture.makeListSUT(numbers: numbers)
        sut.reverse()
        XCTAssertEqual(sut.asArray, expectedArray)
    }
    
    /// Validates that `swap(left:right:)` works as expected.
    func test_swapValuesLeftRight() throws {
        let sut = fixture.makeListSUT(nodeCount: 2)
        
        let leftNode = try XCTUnwrap(sut.node(at: 0))
        let rightNode = try XCTUnwrap(sut.node(at: 1))
        
        /* after the swap, the expected values at nodes 0 and 1 */
        let expectedLeftValue = rightNode.value // node 0
        let expectedRightValue = leftNode.value // node 1
        
        sut.swapValues(left: leftNode, rightNode: rightNode)
        
        let swappedLeft = try XCTUnwrap(sut.node(at: 0))
        let swappedRight = try XCTUnwrap(sut.node(at: 1))
        XCTAssertEqual(swappedLeft.value, expectedLeftValue)
        XCTAssertEqual(swappedRight.value, expectedRightValue)
    }

    /*
    */
     /// Validates that `copy()` correctly makes a copy of a list.
    func test_copy() throws {
        let numbers = fixture.randomNumbers()
        let sut = fixture.makeListSUT(numbers: numbers)

        let clone = sut.copy()
        XCTAssertEqual(clone.asArray, sut.asArray)

        /* ensure we've made distinct clone nodes */
        for index in numbers.indices {
            let sutNode = try XCTUnwrap(sut.node(at: index))
            let cloneNode = try XCTUnwrap(clone.node(at: index))
            XCTAssertFalse(sutNode === cloneNode)
        }

        /* one further test that we've got distinct clones;
         update values in `clone` and check them against `sut` */
        for index in numbers.indices {
            let cloneNode = try XCTUnwrap(clone.node(at: index))
            cloneNode.value += 1
        }
        XCTAssertNotEqual(clone.asArray, sut.asArray)
    }

    // MARK: - Utilities
    private func nodeVisitor(node: ListNode<Int>) {
        didCallVisitor = true
        visitorNodeCount += 1
    }
}
