//
//  BinarySearchTreeTests.swift
//  AlgorithmsAndDataStructuresTests
//
//  Created by Davide Sibilio on 22/04/21.
//

import XCTest

class BinarySearchTreeTests: XCTestCase {

    private var tree: BinarySearchTree<Int>?

    override func setUp() {
        tree = BinarySearchTree([50, 25, 10, 30, 85, 70, 100])
    }

    override func tearDown() {
        self.tree = nil
    }
    
    func testArrayInit() {
        XCTAssertNotNil(tree)
        let nilTree = BinarySearchTree<Int>([])
        XCTAssertNil(nilTree)
    }
    
    func testHeight() {
        let height = tree?.height ?? 0
        XCTAssertEqual(height, 7)
    }
    
    func testContains() {
        do {
            let tree = try XCTUnwrap(tree)
            XCTAssertTrue(tree.contains(100))
            XCTAssertFalse(tree.contains(99))
        } catch {}
    }

    func testInOrderTraverse() {
        var values: [Int] = []
        self.tree?.traverse(type: .inorder, completion: { value in
            values.append(value)
        })
        XCTAssertEqual(values, [10, 25, 30, 50, 70, 85, 100])
    }

    func testPreOrderTraverse() {
        var values: [Int] = []
        self.tree?.traverse(type: .preorder, completion: { value in
            values.append(value)
        })
        XCTAssertEqual(values, [50, 25, 10, 30, 85, 70, 100])
    }

    func testPostOrderTraverse() {
        var values: [Int] = []
        self.tree?.traverse(type: .postorder, completion: { value in
            values.append(value)
        })
        XCTAssertEqual(values, [10, 30, 25, 70, 100, 85, 50])
    }

}
