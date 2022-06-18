//
//  StructMatrixTests.swift
//  WireframeModelTests
//
//  Created by Anton Ivanov on 18.06.2022.
//

import XCTest
@testable import WireframeModel
import simd

final class MatrixTests: XCTestCase {

	func testInit() {
		let a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1, 0, 0, 0),
												simd_float4(0, 1, 0, 0),
												simd_float4(0, 0, 1, 0),
												simd_float4(0, 0, 0, 1)]))

		XCTAssertEqual(a, b)
	}

	func testGeneralScale() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(0, 0, 0,  0),
												simd_float4(0, 0, 0,  0),
												simd_float4(0, 0, 0,  0),
												simd_float4(0, 0, 0, 10)]))

		a.generalScale(s: 10)
		XCTAssertEqual(a, b)
	}

	func testScale() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(10,  0,  0, 0),
												simd_float4( 0, 10,  0, 0),
												simd_float4( 0,  0, 10, 0),
												simd_float4( 0,  0,  0, 1)]))

		a.scale(sx: 10, sy: 10, sz: 10)
		XCTAssertEqual(a, b)
	}

	func testTransfer() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4( 1,  0,  0, 0),
												simd_float4( 0,  1,  0, 0),
												simd_float4( 0,  0,  1, 0),
												simd_float4(10, 10, 10, 1)]))

		a.transfer(dx: 10, dy: 10, dz: 10)
		XCTAssertEqual(a, b)
	}

	func testRotateX() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1,         0,         0, 0),
												simd_float4(0, 0.8660254,       0.5, 0),
												simd_float4(0,      -0.5, 0.8660254, 0),
												simd_float4(0,         0,         0, 1)]))

		a.rotate(x: 30)
		XCTAssertEqual(a, b)
	}

	func testRotateY() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(0.8660254, 0,      -0.5, 0),
												simd_float4(        0, 1,         0, 0),
												simd_float4(      0.5, 0, 0.8660254, 0),
												simd_float4(        0, 0,         0, 1)]))

		a.rotate(y: 30)
		XCTAssertEqual(a, b)
	}

	func testRotateZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(0.8660254,       0.5, 0, 0),
												simd_float4(     -0.5, 0.8660254, 0, 0),
												simd_float4(        0,         0, 1, 0),
												simd_float4(        0,         0, 0, 1)]))

		a.rotate(z: 30)
		XCTAssertEqual(a, b)
	}

	func testRotateXY() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(0.8660254,       0.25, -0.4330127, 0),
												simd_float4(        0,  0.8660254,        0.5, 0),
												simd_float4(      0.5, -0.4330127,       0.75, 0),
												simd_float4(        0,          0,          0, 1)]))

		a.rotate(x: 30, y: 30)
		XCTAssertEqual(a, b)
	}

	func testRotateXZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(0.8660254, 0.4330127,      0.25, 0),
												simd_float4(     -0.5,      0.75, 0.4330127, 0),
												simd_float4(        0,      -0.5, 0.8660254, 0),
												simd_float4(        0,         0,         0, 1)]))

		a.rotate(x: 30, z: 30)
		XCTAssertEqual(a, b)
	}

	func testRotateYZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(      0.75,       0.5, -0.4330127, 0),
												simd_float4(-0.4330127, 0.8660254,       0.25, 0),
												simd_float4(       0.5,         0,  0.8660254, 0),
												simd_float4(         0,         0,          0, 1)]))

		a.rotate(y: 30, z: 30)
		XCTAssertEqual(a, b)
	}

	func testRotateXYZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(      0.75,   0.649519,   -0.125, 0),
												simd_float4(-0.4330127,      0.625, 0.649519, 0),
												simd_float4(       0.5, -0.4330127,     0.75, 0),
												simd_float4(         0,          0,        0, 1)]))

		a.rotate(x: 30, y: 30, z: 30)
		XCTAssertEqual(a, b)
	}


}

