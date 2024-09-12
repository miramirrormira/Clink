//
//  Camera.swift
//  
//
//  Created by Mira Yang on 9/11/24.
//

import Foundation
import simd

class Camera: Node3D {
    
    var fov = radians(fromDegrees: 70)
    var near: Float = 0.01
    var far: Float = 100
    var aspect: Float = 1
    
    var viewMatrix: float4x4 {
        let translateMatrix = float4x4(translation: position)
        let rotateMatrix = float4x4(rotation: rotation)
        let scaleMatrix = float4x4(scaling: scale)
        return (translateMatrix * scaleMatrix * rotateMatrix).inverse
    }
    
    var projectionMatrix: float4x4 {
        return float4x4(projectionFov: fov,
                        near: near,
                        far: far,
                        aspect: aspect)
    }
    
    func zoom(delta: Float) {}
    func rotate(delta: SIMD2<Float>) {}
    
}
