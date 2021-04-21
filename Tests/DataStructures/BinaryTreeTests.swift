//
//  BinaryTreeTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Davide Sibilio on 20/04/21.
//

@testable import AlgorithmsAndDataStructures
import XCTest

class BinaryTreeTests: XCTestCase {

    private var tree: BinaryTree<String>?

    override func setUp() {
        let rootNode = TreeNode("Root")
        rootNode.left = TreeNode("Left")
        rootNode.right = TreeNode("Right")
        rootNode.left?.left = TreeNode("LeftLeft")
        rootNode.left?.right = TreeNode("LeftRight")
        rootNode.right?.left = TreeNode("RightLeft")
        rootNode.right?.right = TreeNode("RightRight")
        self.tree = BinaryTree(rootNode)
    }

    override func tearDown() {
        self.tree = nil
    }
    
    func testHeight() {
        let height = tree?.height ?? 0
        XCTAssertEqual(height, 7)
    }

    func testInOrderTraverse() {
        var values: [String] = []
        self.tree?.traverse(type: .inorder, completion: { value in
            values.append(value)
        })
        XCTAssertEqual(values, ["LeftLeft", "Left", "LeftRight", "Root", "RightLeft", "Right", "RightRight"])
    }

    func testPreOrderTraverse() {
        var values: [String] = []
        self.tree?.traverse(type: .preorder, completion: { value in
            values.append(value)
        })
        XCTAssertEqual(values, ["Root", "Left", "LeftLeft", "LeftRight", "Right", "RightLeft", "RightRight"])
    }

    func testPostOrderTraverse() {
        var values: [String] = []
        self.tree?.traverse(type: .postorder, completion: { value in
            values.append(value)
        })
        XCTAssertEqual(values, ["LeftLeft", "LeftRight", "Left", "RightLeft", "RightRight", "Right", "Root"])
    }

}
