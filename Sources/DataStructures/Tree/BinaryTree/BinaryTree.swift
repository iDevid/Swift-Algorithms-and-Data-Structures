//
//  BinaryTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Davide Sibilio on 20/04/21.
//

import Foundation

class BinaryTree<T>: Tree {

    let root: TreeNode<T>

    init(_ root: TreeNode<T>) {
        self.root = root
    }

    init(_ rootValue: T) {
        self.root = TreeNode(rootValue)
    }

    public func traverse(type: TreeTraverseType, completion: (T) -> Void) {
        switch type {
        case .inorder:
            traverseInOrder(root, completion)
        case .preorder:
            traversePreOrder(root, completion)
        case .postorder:
            traversePostOrder(root, completion)
        }
    }

    // MARK: - Private Methods

    private func traverseInOrder(_ node: TreeNode<T>, _ completion: (T) -> Void) {
        unwrap(node.left) { traverseInOrder($0, completion) }
        completion(node.value)
        unwrap(node.right) { traverseInOrder($0, completion) }
    }

    private func traversePreOrder(_ node: TreeNode<T>, _ completion: (T) -> Void) {
        completion(node.value)
        unwrap(node.left) { traversePreOrder($0, completion) }
        unwrap(node.right) { traversePreOrder($0, completion) }
    }

    private func traversePostOrder(_ node: TreeNode<T>, _ completion: (T) -> Void) {
        unwrap(node.left) { traversePostOrder($0, completion) }
        unwrap(node.right) { traversePostOrder($0, completion) }
        completion(node.value)
    }

    private func unwrap(_ childNode: TreeNode<T>?, completion: (TreeNode<T>) -> Void) {
        guard let childNode = childNode else {
            return
        }
        completion(childNode)
    }
}
