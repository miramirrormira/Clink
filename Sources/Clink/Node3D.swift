//
//  3DNode.swift
//
//
//  Created by Mira Yang on 9/11/24.
//

import Foundation
import simd

class Node3D: Node {
    
    var name: String = ""
    
    var parent: Node?
    
    var children: [Node] = []
    
    var position = SIMD3<Float>(repeating: 0) {
        didSet {
            updateModelMatrix()
        }
    }
    
    var rotation = SIMD3<Float>(repeating: 0) {
        didSet {
            let rotationMatrix = float4x4(rotation: rotation)
            quaternion = simd_quatf(rotationMatrix)
            updateModelMatrix()
        }
    }
    
    var scale = SIMD3<Float>(repeating: 1) {
        didSet {
            updateModelMatrix()
        }
    }
    
    var quaternion = simd_quatf()
    
    var modelMatrix: float4x4 = float4x4.identity()
    
    var worldMatrix: float4x4 {
        if let parent = parent as? Node3D {
            return parent.worldMatrix * modelMatrix
        }
        return modelMatrix
    }
    
    func updateModelMatrix() {
        let translateMatrix = float4x4(translation: position)
        let rotateMatrix = float4x4(quaternion)
        let scaleMatrix = float4x4(scaling: scale)
        modelMatrix = translateMatrix * rotateMatrix * scaleMatrix
    }
    
}

