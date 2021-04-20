//
//  TreeNode.swift
//  AlgorithmsAndDataStructures
//
//  Created by Davide Sibilio on 20/04/21.
//

import Foundation

class TreeNode<T> {
    let value: T
    var left: TreeNode<T>?
    var right: TreeNode<T>?

    init(_ value: T) {
        self.value = value
    }

    var count: Int {
        (left?.count ?? 0) + (right?.count ?? 0) + 1
    }
}
