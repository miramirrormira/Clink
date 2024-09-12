//
//  float3x3+additions.swift
//
//
//  Created by Mira Yang on 9/11/24.
//

import Foundation
import simd

extension float3x3 {
    init(normalFrom4x4 matrix: float4x4) {
        self.init()
        columns = matrix.upperLeft.inverse.transpose.columns
    }
}
