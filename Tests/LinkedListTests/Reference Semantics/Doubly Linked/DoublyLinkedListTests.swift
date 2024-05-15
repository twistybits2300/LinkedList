import XCTest
import os
@testable import LinkedList

/// Validation of `DoublyLinkedList`.
final class DoublyLinkedListTests: XCTestCase {
    private let fixture = LinkedListFixture()

    /// Validates that `init()` returns an empty list.
    func test_init_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertNil(sut.head)
        XCTAssertNil(sut.tail)
    }

    /// Validates that `init(head:)` correctly captures the given `head` node.
    func test_initHead() throws {
        let expectedHeadValue = fixture.headNodeValue
        let headNode = fixture.makeHeadNode()

        let sut = DoublyLinkedList(head: headNode)

        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertNil(sut.tail)
    }

    /// Validates that `init(tail:)` correctly captures the given `tail` node.
    func test_initTail() throws {
        let expectedTailValue = fixture.tailNodeValue
        let tailNode = fixture.makeTailNode()

        let sut = DoublyLinkedList(tail: tailNode)

        XCTAssertEqual(sut.tail?.value, expectedTailValue)
        XCTAssertNil(sut.head)
    }

    /// Validates that `init(head:tail:)` correctly captures `head` and `tail`.
    func test_initHeadTail() throws {
        let expectedHeadValue = fixture.headNodeValue
        let headNode = fixture.makeHeadNode()

        let expectedTailValue = fixture.tailNodeValue
        let tailNode = fixture.makeTailNode()

        let sut = DoublyLinkedList(head: headNode, tail: tailNode)

        XCTAssertEqual(sut.head?.value, expectedHeadValue)
        XCTAssertEqual(sut.tail?.value, expectedTailValue)
    }

    /// Validates that `isEmpty` returns `true` for an empty list.
    func test_isEmpty_true() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `isEmpty` returns `false` when the list is not empty.
    func test_isEmpty_false() throws {
        let sut = fixture.makeHeadNodeSUT()
        XCTAssertFalse(sut.isEmpty)
    }

    /// Validates that `first` returns `nil` when the list is empty.
    func test_first_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.first)
    }

    /// Validates that `first` returns the expected value.
    func test_first() throws {
        let expectedValue = fixture.headNodeValue
        let sut = fixture.makeHeadNodeSUT()
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.first?.value, expectedValue)
    }

    /// Validates that `last` returns `nil` when the list is empty.
    func test_last_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)
        XCTAssertNil(sut.last)
    }

    /// Validates that `last` returns the expected value.
    func test_last() throws {
        let expectedValue = fixture.tailNodeValue
        let sut = fixture.makeSUT(value: expectedValue)
        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.last?.value, expectedValue)
    }

    /// Validates that `prepend(value:)` can successfully add at front into an empty list.
    func test_prepend_empty() throws {
        let expectedValue = "A"

        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)

        sut.prepend(expectedValue)

        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.head?.value, expectedValue)
        XCTAssertEqual(sut.tail?.value, expectedValue)
    }

    /// Validates that `prepend(value:)` can successfully added at front into a non-empty list.
    func test_prepend_not_empty() throws {
        let expectedValue = "A"
        let expectedNextValue = fixture.exampleValue

        let sut = fixture.makeExampleSUT()
        XCTAssertFalse(sut.isEmpty)

        sut.prepend(expectedValue)

        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
        XCTAssertEqual(sut.first?.value, expectedValue)
        XCTAssertEqual(sut.head?.next?.value, expectedNextValue)
    }

    /// Validates that `prepend(value:)` can add multiple values to the front of the list.
    func test_prepend() throws {
        let expectedForwardArray = fixture.letters
        let expectedBackwardArray = Array(fixture.letters.reversed())

        let sut = fixture.makePrependSUT(from: expectedBackwardArray)
        XCTAssertFalse(sut.isEmpty)

        let forwardArray = toArrayForward(list: sut)
        XCTAssertEqual(forwardArray, expectedForwardArray)

        let backwardArray = toArrayBackward(list: sut)
        XCTAssertEqual(backwardArray, expectedBackwardArray)
    }

    /// Validates that `append(value:)` can successfully append into an empty list.
    func test_append_empty() throws {
        let expectedValue = "A"

        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)

        sut.append(expectedValue)

        XCTAssertFalse(sut.isEmpty)
        XCTAssertEqual(sut.head?.value, expectedValue)
        XCTAssertEqual(sut.tail?.value, expectedValue)
    }

    /// Validates that `append(value:)` can successfully append into a non-empty list.
    func test_append_not_empty() throws {
        let expectedValue = "A"

        let sut = fixture.makeHeadNodeSUT()
        XCTAssertFalse(sut.isEmpty)

        sut.append(expectedValue)

        XCTAssertNotNil(sut.head)
        XCTAssertNotNil(sut.tail)
        XCTAssertEqual(sut.tail?.value, expectedValue)
    }

    /// Validates that `append(value:)` can append multiple values into the list.
    func test_append() throws {
        let expectedForwardArray = fixture.letters
        let expectedBackwardArray = Array(fixture.letters.reversed())

        let sut = fixture.makeAppendSUT(from: expectedForwardArray)
        XCTAssertFalse(sut.isEmpty)

        let forwardArray = toArrayForward(list: sut)
        XCTAssertEqual(forwardArray, expectedForwardArray)

        let backwardArray = toArrayBackward(list: sut)
        XCTAssertEqual(backwardArray, expectedBackwardArray)
    }

    /// Validates that `remove(node:)` returns the given `node`'s `value` when
    /// the list is empty.
    func test_remove_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)

        let targetNode = fixture.makeHeadNode()
        let expectedValue = targetNode.value
        let removedValue = sut.remove(targetNode)

        XCTAssertEqual(removedValue, expectedValue)
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `remove(node:)` returns the given `node`'s `value` when
    /// the node is not contained in the list.
    func test_remove_node_not_in_list() throws {
        let expectedValue = "👻"
        let expectedArray = fixture.letters
        let targetNode = DoublyLinkedNode(value: expectedValue)

        let sut = fixture.makeLettersSUT()
        XCTAssertFalse(sut.isEmpty)

        let removedValue = sut.remove(targetNode)
        XCTAssertEqual(removedValue, expectedValue)

        let resultArray = toArrayForward(list: sut)
        XCTAssertFalse(resultArray.isEmpty)
        XCTAssertEqual(resultArray, expectedArray)
    }

    /// Validates that `remove(node:)` can remove the only node in a one-item list.
    func test_remove_from_single_item_list() throws {
        let expectedValue = fixture.headNodeValue

        let sut = fixture.makeSUT(value: expectedValue)
        XCTAssertFalse(sut.isEmpty)

        let targetNode = try XCTUnwrap(sut.first)

        let removedValue = sut.remove(targetNode)
        XCTAssertEqual(removedValue, expectedValue)
        XCTAssertTrue(sut.isEmpty)
    }

    /// Validates that `remove(node:)` can successful remove a node from the start of the list.
    func test_remove_from_head() throws {
        let expectedValue = fixture.letters[0]
        let expectedArray = Array(fixture.letters.dropFirst())

        let sut = fixture.makeLettersSUT()
        XCTAssertFalse(sut.isEmpty)

        let targetNode = try XCTUnwrap(sut.first)

        let removedValue = sut.remove(targetNode)
        XCTAssertEqual(removedValue, expectedValue)

        let resultArray = toArrayForward(list: sut)
        XCTAssertEqual(resultArray, expectedArray)
    }

    /// Validates that `remove(node:)` can correctly remove a node from the middle of the list.
    func test_remove() throws {
        let targetIndex = fixture.letters.count / 2
        let expectedValue = fixture.letters[targetIndex]
        var expectedArray = fixture.letters
        expectedArray.remove(at: targetIndex)

        let sut = fixture.makeLettersSUT()
        XCTAssertFalse(sut.isEmpty)

        var currentNode: DoublyLinkedNode<String>? = sut.head

        for _ in 0..<targetIndex {
            currentNode = currentNode?.next
        }

        let targetNode = try XCTUnwrap(currentNode)
        XCTAssertEqual(targetNode.value, expectedValue)

        let removedValue = sut.remove(targetNode)
        XCTAssertEqual(removedValue, expectedValue)

        let resultArray = toArrayForward(list: sut)
        XCTAssertEqual(resultArray, expectedArray)
    }

    /// Validates that `remove(node:)` can successfully remove a node from the end of the list.
    func test_remove_from_tail() throws {
        let targetIndex = fixture.letters.count - 1
        let expectedValue = fixture.letters[targetIndex]
        let expectedArray = Array(fixture.letters.dropLast())

        let sut = fixture.makeLettersSUT()
        XCTAssertFalse(sut.isEmpty)

        let targetNode = try XCTUnwrap(sut.tail)

        let removedValue = sut.remove(targetNode)
        XCTAssertEqual(removedValue, expectedValue)

        let resultArray = toArrayForward(list: sut)
        XCTAssertEqual(resultArray, expectedArray)
    }

    /// Validates that `contains(node:)` returns `false` when the list is empty.
    func test_contains_empty() throws {
        let sut = fixture.makeSUT()
        XCTAssertTrue(sut.isEmpty)

        let targetNode = fixture.makeHeadNode()
        XCTAssertFalse(sut.contains(node: targetNode))
    }

    /// Validates that `contains(node:)` returns `false` when the target node is not in the list.
    func test_contains_node_not_in_list() throws {
        let sut = fixture.makeLettersSUT()
        XCTAssertFalse(sut.isEmpty)

        let targetValue = "👽"
        let targetNode = fixture.makeNode(value: targetValue)
        XCTAssertFalse(sut.contains(node: targetNode))
    }

    /// Validates that `contains(node:)` returns `true` when the node is in the list.
    func test_contains_true() throws {
        let sut = fixture.makeLettersSUT()
        XCTAssertFalse(sut.isEmpty)

        let targetIndex = fixture.letters.count / 2
        let targetValue = fixture.letters[targetIndex]
        let targetNode = fixture.makeNode(value: targetValue)

        XCTAssertTrue(sut.contains(node: targetNode))
    }

    /// Validates that `IteratorProtocol` compliance works as expected.
    func test_iteratorProtocol() throws {
        let sut = fixture.makeLettersSUT()
        let iterator = DoublyLinkedListIterator(node: sut.head)

        for letter in fixture.letters {
            let iteratedLetter = try XCTUnwrap(iterator.next())
            XCTAssertEqual(iteratedLetter.value, letter)
        }
    }

    /// Validates that `Sequence` compliance works as expected.
    func test_sequence() throws {
        let expectedArray = fixture.letters
        let sut = fixture.makeLettersSUT()

        let array = Array(sut).map { $0.value }
        XCTAssertEqual(array, expectedArray)
    }

    /// Validates that `Equatable` conformance returns `false` when different instances
    /// of `head` and `tail` are compared.
    func test_equatable_false_different_instances() throws {
        let sutA = fixture.makeLettersSUT()
        let sutB = fixture.makeLettersSUT()
        XCTAssertNotEqual(sutA, sutB)
    }

    /// Validates that `Equatable` conformance returns `true` when same instances of
    /// `head` and `tail` are compared.
    func test_equatable_false_different_head_instances() throws {
        let sutA = fixture.makeHeadNodeSUT()
        let sutB = sutA
        XCTAssertEqual(sutA, sutB)
    }
}

private extension LinkedListFixture {
    var letters: [String] { ["L", "I", "S", "T"] }
    var exampleValue: String { "doubly-linked list text" }

    func makeSUT() -> DoublyLinkedList<String> {
        DoublyLinkedList()
    }

    func makeHeadNodeSUT() -> DoublyLinkedList<String> {
        let headNode = makeHeadNode()
        return DoublyLinkedList(head: headNode)
    }

    func makeSUT(value: String) -> DoublyLinkedList<String> {
        let sut = makeSUT()
        sut.append(value)
        return sut
    }

    func makeExampleSUT() -> DoublyLinkedList<String> {
        makeSUT(value: exampleValue)
    }

    func makeLettersSUT() -> DoublyLinkedList<String> {
        makeAppendSUT(from: letters)
    }

    func makeAppendSUT<T>(from array: [T]) -> DoublyLinkedList<T> {
        let sut = DoublyLinkedList<T>()

        for value in array {
            sut.append(value)
        }

        return sut
    }

    func makePrependSUT<T>(from array: [T]) -> DoublyLinkedList<T> {
        let sut = DoublyLinkedList<T>()

        for value in array {
            sut.prepend(value)
        }

        return sut
    }

    // MARK: - Node-related items
    var headNodeValue: String { "the HEAD node" }
    var tailNodeValue: String { "the TAIL node" }

    func makeHeadNode() -> DoublyLinkedNode<String> {
        DoublyLinkedNode(value: headNodeValue)
    }

    func makeTailNode() -> DoublyLinkedNode<String> {
        DoublyLinkedNode(value: tailNodeValue)
    }

    func makeNode<T>(value: T) -> DoublyLinkedNode<T> {
        DoublyLinkedNode(value: value)
    }
}
