import Foundation

extension EnumListNode {
    /// Returns the number of items in the list.
    public var count: Int {
        var count = 0
        self.traverse { _ in
            count += 1
        }
        return count
    }
}
