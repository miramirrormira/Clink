//
//  Node.swift
//
//
//  Created by Mira Yang on 9/11/24.
//

import Foundation

protocol Node: AnyObject {
    var parent: Node? { get set }
    var children: [Node] { get set }
}

extension Node {
    
    func removeNode(_ child: Node) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        
        child.parent = nil
        child.children = []
        children.remove(at: index)
        
        for grandChild in child.children {
            grandChild.parent = self
            children.append(grandChild)
        }
    }
    
    func removeChildBranch(_ child: Node) {
        guard let index = children.firstIndex(where: { $0 === child }) else {
            return
        }
        
        child.parent = nil
        children.remove(at: index)
        
        for grandChild in child.children {
            child.removeChildBranch(grandChild)
        }
    }
    
    func addChild(_ child: Node) {
        if let _ = children.firstIndex(where: { $0 === child }) { return }
        children.append(child)
        child.parent = self
    }

}
