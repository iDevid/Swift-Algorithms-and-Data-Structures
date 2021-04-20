//
//  main.swift
//  AlgorithmsAndDataStructures
//
//  Created by Davide Sibilio on 20/04/21.
//

import Foundation

let node = TreeNode("Prova")
node.left = TreeNode("Left")
node.right = TreeNode("Right")

let tree: BinaryTree<String> = BinaryTree(node)

tree.traverse(type: .inorder) { value in
    print(value)
}
