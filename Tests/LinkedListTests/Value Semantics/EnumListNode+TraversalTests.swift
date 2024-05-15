import XCTest
import os
@testable import LinkedList

/// Validation of `EnumListNode+Traversal`.
final class EnumListNode_TraversalTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `traverse(visit:)` visits each node in the list.
    func test_traverse() throws {
        let expectedArray = fixture.randomNumbers()
        var receivedNumbers = [Int]()
        
        func visitor(node: EnumListNode<Int>) {
            receivedNumbers.append(node.currentValue)
        }
        
        let sut = fixture.makeNodeSUT(numbers: expectedArray)
        sut.traverse(visit: visitor)
        
        XCTAssertEqual(receivedNumbers, expectedArray)
    }
}
