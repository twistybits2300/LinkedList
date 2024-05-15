import Foundation

extension EnumListNode {
    /// Traverse the list, starting from this node until the
    /// end invoking the `visit` closure at each node.
    /// - Parameter visit: Closure that's invoked when reaching a node in the list.
    public func traverse(visit: (EnumListNode) -> Void) {
        var current: EnumListNode<T>? = self
        
        while let currentNode = current {
            visit(currentNode)
            current = currentNode.next
        }
    }
}
