//
//  ClassMatrix.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 18.06.2022.
//

import Foundation
import simd

struct Matrix {

	private var matrix: matrix_float4x4

	mutating func rotate(x angle: Float) {
		let a: Float = Float.pi / 180 * angle;

		let matrix = matrix_float4x4([simd_float4(1,       0,      0, 0),
									  simd_float4(0,  cos(a), sin(a), 0),
									  simd_float4(0, -sin(a), cos(a), 0),
									  simd_float4(0,       0,      0, 1)])

		self.matrix = simd.simd_mul(self.matrix, matrix)
	}

	mutating func rotate(y angle: Float) {
		let a: Float = Float.pi / 180 * angle;

		let matrix = matrix_float4x4([simd_float4(cos(a), 0, -sin(a), 0),
									  simd_float4(     0, 1,       0, 0),
									  simd_float4(sin(a), 0,  cos(a), 0),
									  simd_float4(     0, 0,       0, 1)])

		self.matrix = simd.simd_mul(self.matrix, matrix)
	}

	mutating func rotate(z angle: Float) {
		let a: Float = Float.pi / 180 * angle;

		let matrix = matrix_float4x4([simd_float4( cos(a), sin(a), 0, 0),
									  simd_float4(-sin(a), cos(a), 0, 0),
									  simd_float4(      0,      0, 1, 0),
									  simd_float4(      0,      0, 0, 1)])

		self.matrix = simd.simd_mul(self.matrix, matrix)
	}

	mutating func rotate(x: Float, y: Float) {
		rotate(x: x)
		rotate(y: y)
	}

	mutating func rotate(x: Float, z: Float) {
		rotate(x: x)
		rotate(z: z)
	}

	mutating func rotate(y: Float, z: Float) {
		rotate(y: y)
		rotate(z: z)
	}

	mutating func rotate(x: Float, y: Float, z: Float) {
		rotate(x: x)
		rotate(y: y)
		rotate(z: z)
	}

	mutating func scale(sx: Float, sy: Float, sz: Float) {
		let matrix = matrix_float4x4([simd_float4(sx,  0,  0, 0),
									  simd_float4( 0, sy,  0, 0),
									  simd_float4( 0,  0, sz, 0),
									  simd_float4( 0,  0,  0, 1)])

		self.matrix = simd.simd_mul(self.matrix, matrix)
	}

	mutating func generalScale(s: Float) {
		let matrix = matrix_float4x4([simd_float4(0, 0, 0, 0),
									  simd_float4(0, 0, 0, 0),
									  simd_float4(0, 0, 0, 0),
									  simd_float4(0, 0, 0, s)])

		self.matrix = simd.simd_mul(self.matrix, matrix)
	}

	mutating func transfer(dx: Float, dy: Float, dz: Float) {
		let matrix = matrix_float4x4([simd_float4( 1,  0,  0, 0),
									  simd_float4( 0,  1,  0, 0),
									  simd_float4( 0,  0,  1, 0),
									  simd_float4(dx, dy, dz, 1)])

		self.matrix = simd.simd_mul(self.matrix, matrix)
	}

	func a(_ y: Int, _ x: Int) -> Float {
		return self.matrix[y - 1][x - 1]
	}

	init() {
		self.matrix = matrix_float4x4([simd_float4(1, 0, 0, 0),
									   simd_float4(0, 1, 0, 0),
									   simd_float4(0, 0, 1, 0),
									   simd_float4(0, 0, 0, 1)])
	}

	init(matrix: matrix_float4x4) {
		self.matrix = matrix
	}


}

extension Matrix: Equatable {
	static func == (lhs: Matrix, rhs: Matrix) -> Bool {
		return lhs.matrix == rhs.matrix
	}
}

