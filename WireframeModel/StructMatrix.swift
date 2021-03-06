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

	mutating func multiply(matrix: matrix_float4x4) {
		self.matrix = simd.simd_mul(self.matrix, matrix)
	}

	mutating func rotate(x angle: Float) {
		let a: Float = Float.pi / 180 * angle

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1,       0,      0, 0),
									  simd_float4(0,  cos(a), sin(a), 0),
									  simd_float4(0, -sin(a), cos(a), 0),
									  simd_float4(0,       0,      0, 1)])
		multiply(matrix: matrix)
	}

	mutating func rotate(y angle: Float) {
		let a: Float = Float.pi / 180 * angle

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(cos(a), 0, -sin(a), 0),
									  simd_float4(     0, 1,       0, 0),
									  simd_float4(sin(a), 0,  cos(a), 0),
									  simd_float4(     0, 0,       0, 1)])
		multiply(matrix: matrix)
	}

	mutating func rotate(z angle: Float) {
		let a: Float = Float.pi / 180 * angle

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4( cos(a), sin(a), 0, 0),
									  simd_float4(-sin(a), cos(a), 0, 0),
									  simd_float4(      0,      0, 1, 0),
									  simd_float4(      0,      0, 0, 1)])
		multiply(matrix: matrix)
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
		rotate(z: z)
		rotate(x: x)
		rotate(y: y)
	}

	mutating func rotate(angle: Scene.Vector3) {
		rotate(x: -angle.x, y: -angle.y, z: -angle.z)
	}

	mutating func scale(sx: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(sx, 0, 0, 0),
									  simd_float4( 0, 1, 0, 0),
									  simd_float4( 0, 0, 1, 0),
									  simd_float4( 0, 0, 0, 1)])
		multiply(matrix: matrix)
	}

	mutating func scale(sy: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1,  0, 0, 0),
									  simd_float4(0, sy, 0, 0),
									  simd_float4(0,  0, 1, 0),
									  simd_float4(0,  0, 0, 1)])
		multiply(matrix: matrix)
	}

	mutating func scale(sz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1, 0,  0, 0),
									  simd_float4(0, 1,  0, 0),
									  simd_float4(0, 0, sz, 0),
									  simd_float4(0, 0,  0, 1)])
		multiply(matrix: matrix)
	}

	mutating func scale(sx: Float, sy: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(sx,  0, 0, 0),
									  simd_float4( 0, sy, 0, 0),
									  simd_float4( 0,  0, 1, 0),
									  simd_float4( 0,  0, 0, 1)])
		multiply(matrix: matrix)
	}

	mutating func scale(sx: Float, sz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(sx, 0,  0, 0),
									  simd_float4( 0, 1,  0, 0),
									  simd_float4( 0, 0, sz, 0),
									  simd_float4( 0, 0,  0, 1)])
		multiply(matrix: matrix)
	}

	mutating func scale(sy: Float, sz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1,  0,  0, 0),
									  simd_float4(0, sy,  0, 0),
									  simd_float4(0,  0, sz, 0),
									  simd_float4(0,  0,  0, 1)])
		multiply(matrix: matrix)
	}

	mutating func scale(sx: Float, sy: Float, sz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(sx,  0,  0, 0),
									  simd_float4( 0, sy,  0, 0),
									  simd_float4( 0,  0, sz, 0),
									  simd_float4( 0,  0,  0, 1)])
		multiply(matrix: matrix)
	}

	mutating func scale(s: Float) {
		scale(sx: s, sy: s, sz: s)
	}

	mutating func generalScale(s: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1, 0, 0, 0),
									  simd_float4(0, 1, 0, 0),
									  simd_float4(0, 0, 1, 0),
									  simd_float4(0, 0, 0, s)])
		multiply(matrix: matrix)
	}

	mutating func transfer(dx: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4( 1, 0, 0, 0),
									  simd_float4( 0, 1, 0, 0),
									  simd_float4( 0, 0, 1, 0),
									  simd_float4(dx, 0, 0, 1)])
		multiply(matrix: matrix)
	}

	mutating func transfer(dy: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1,  0, 0, 0),
									  simd_float4(0,  1, 0, 0),
									  simd_float4(0,  0, 1, 0),
									  simd_float4(0, dy, 0, 1)])
		multiply(matrix: matrix)
	}

	mutating func transfer(dz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1, 0,  0, 0),
									  simd_float4(0, 1,  0, 0),
									  simd_float4(0, 0,  1, 0),
									  simd_float4(0, 0, dz, 1)])
		multiply(matrix: matrix)
	}

	mutating func transfer(dx: Float, dy: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4( 1,  0, 0, 0),
									  simd_float4( 0,  1, 0, 0),
									  simd_float4( 0,  0, 1, 0),
									  simd_float4(dx, dy, 0, 1)])
		multiply(matrix: matrix)
	}

	mutating func transfer(dx: Float, dz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4( 1, 0,  0, 0),
									  simd_float4( 0, 1,  0, 0),
									  simd_float4( 0, 0,  1, 0),
									  simd_float4(dx, 0, dz, 1)])
		multiply(matrix: matrix)
	}

	mutating func transfer(dy: Float, dz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4(1,  0,  0, 0),
									  simd_float4(0,  1,  0, 0),
									  simd_float4(0,  0,  1, 0),
									  simd_float4(0, dy, dz, 1)])
		multiply(matrix: matrix)
	}

	mutating func transfer(dx: Float, dy: Float, dz: Float) {

		// swift-format-ignore
		let matrix = matrix_float4x4([simd_float4( 1,  0,  0, 0),
									  simd_float4( 0,  1,  0, 0),
									  simd_float4( 0,  0,  1, 0),
									  simd_float4(dx, dy, dz, 1)])
		multiply(matrix: matrix)
	}

	mutating func transfer(offset: Scene.Vector3) {
		transfer(dx: offset.x, dy: offset.y, dz: offset.z)
	}

	func a(_ y: Int, _ x: Int) -> Float {
		return self.matrix[y - 1][x - 1]
	}

	init(scene: Scene) {
		self.init()
		let offset = Scene.Vector3(x: scene.centerRect.x + scene.offset.x,
								   y: scene.centerRect.y + scene.offset.y,
								   z: scene.centerRect.z + scene.offset.z)
		transfer(offset: offset)
		scale(s: scene.scale)
		rotate(angle: scene.angle)
	}

	init(matrix: matrix_float4x4) {
		self.matrix = matrix
	}

	init() {
		self.matrix = matrix_float4x4([simd_float4(1, 0, 0, 0),
									   simd_float4(0, 1, 0, 0),
									   simd_float4(0, 0, 1, 0),
									   simd_float4(0, 0, 0, 1)])
	}

}

extension Matrix: Equatable {
	static func == (lhs: Matrix, rhs: Matrix) -> Bool {
		return lhs.matrix == rhs.matrix
	}
}
