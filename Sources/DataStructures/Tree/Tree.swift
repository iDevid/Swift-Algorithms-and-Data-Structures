//
//  Tree.swift
//  AlgorithmsAndDataStructures
//
//  Created by Davide Sibilio on 20/04/21.
//

import Foundation

protocol Tree {
    associatedtype T

    var height: Int { get }

    func traverse(type: TreeTraverseType, completion: (T) -> Void)
}
