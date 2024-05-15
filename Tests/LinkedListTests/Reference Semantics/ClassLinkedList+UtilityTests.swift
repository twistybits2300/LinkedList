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
    
    // MARK: - Utilities
    private func nodeVisitor(node: ListNode<Int>) {
        didCallVisitor = true
        visitorNodeCount += 1
    }
}
