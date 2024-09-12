//
//  matrix_float4x4+additions.swift
//
//
//  Created by Mira Yang on 9/11/24.
//

import Foundation
import simd

extension matrix_float4x4 {
    // Function to convert rad to deg
    var translation: SIMD3<Float> {
        get {
            return SIMD3<Float>(x: columns.3.x, y: columns.3.y, z: columns.3.z)
        }
    }
    // Retrieve euler angles from a quaternion matrix
    var eulerAngles: SIMD3<Float> {
        get {
            // Get quaternions
            let qw = sqrt(1 + self.columns.0.x + self.columns.1.y + self.columns.2.z) / 2.0
            let qx = (self.columns.2.y - self.columns.1.z) / (qw * 4.0)
            let qy = (self.columns.0.z - self.columns.2.x) / (qw * 4.0)
            let qz = (self.columns.1.x - self.columns.0.y) / (qw * 4.0)
            
            // Deduce euler angles
            /// yaw (z-axis rotation)
            let siny = +2.0 * (qw * qz + qx * qy)
            let cosy = +1.0 - 2.0 * (qy * qy + qz * qz)
            let yaw = atan2(siny, cosy)
            // pitch (y-axis rotation)
            let sinp = +2.0 * (qw * qy - qz * qx)
            var pitch: Float
            if abs(sinp) >= 1 {
                pitch = copysign(Float.pi / 2, sinp)
            } else {
                pitch = asin(sinp)
            }
            /// roll (x-axis rotation)
            let sinr = +2.0 * (qw * qx + qy * qz)
            let cosr = +1.0 - 2.0 * (qx * qx + qy * qy)
            let roll = atan2(sinr, cosr)
            /// return array containing ypr values
            return SIMD3<Float>(yaw, pitch, roll)
        }
    }
}
