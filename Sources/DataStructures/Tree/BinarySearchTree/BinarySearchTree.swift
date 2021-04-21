//
//  BinarySearchTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Davide Sibilio on 22/04/21.
//

import Foundation

class BinarySearchTree<T: Comparable>: Tree {

    private let root: TreeNode<T>

    init(_ rootValue: T) {
        self.root = TreeNode(rootValue)
    }
    
    init?(_ values: [T]) {
        guard !values.isEmpty else {
            return nil
        }
        var values = values
        self.root = TreeNode(values.removeFirst())
        values.forEach { insert($0) }
    }
    
    var height: Int {
        root.count
    }
    
    public func insert(_ value: T) {
        add(value, to: root)
    }
    
    public func contains(_ value: T) -> Bool {
        nodeContains(root, value: value)
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

    // MARK: - Contains Methods
    
    private func nodeContains(_ node: TreeNode<T>, value: T) -> Bool {
        if value > node.value {
            return childNodeContains(node.right, value: value)
        } else if value < node.value {
            return childNodeContains(node.left, value: value)
        } else {
            return true
        }
    }
    
    private func childNodeContains(_ childNode: TreeNode<T>?, value: T) -> Bool {
        if let childNode = childNode {
            return nodeContains(childNode, value: value)
        } else {
            return false
        }
    }
    
    // MARK: - Add Methods
    
    private func add(_ value: T, to node: TreeNode<T>) {
        add(value, toChildPath: value > node.value ? \.right : \.left, forNode: node)
    }
    
    private func add(_ value: T, toChildPath path: ReferenceWritableKeyPath<TreeNode<T>, TreeNode<T>?>, forNode node: TreeNode<T>) {
        if let child = node[keyPath: path] {
            add(value, to: child)
        } else {
            node[keyPath: path] = TreeNode(value)
        }
    }
    
    // MARK: - Traverse Methods

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
    
    // MARK: - Utility Methods

    private func unwrap(_ childNode: TreeNode<T>?, completion: (TreeNode<T>) -> Void) {
        guard let childNode = childNode else {
            return
        }
        completion(childNode)
    }
}
