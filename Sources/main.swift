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

let rootNode = TreeNode("Root")
rootNode.left = TreeNode("Left")
rootNode.right = TreeNode("Right")
rootNode.left?.left = TreeNode("LeftLeft")
rootNode.left?.right = TreeNode("LeftRight")
rootNode.right?.left = TreeNode("RightLeft")
rootNode.right?.right = TreeNode("RightRight")
let tree = BinaryTree<String>(rootNode)

tree.traverse(type: .inorder) { value in
    print(value)
}
