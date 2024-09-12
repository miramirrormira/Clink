//
//  pi.swift
//
//
//  Created by Mira Yang on 9/11/24.
//

import Foundation
import simd

let π = Float.pi
let tau = 2.0 * Float.pi
let π_sqrt = sqrt(π)
let tau_sqrt = sqrt(tau)

func radians(fromDegrees degrees: Float) -> Float {
    return (degrees / 180) * π
}

func degrees(fromRadians radians: Float) -> Float {
    return (radians / π) * 180
}
