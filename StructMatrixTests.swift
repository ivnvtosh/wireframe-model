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
		let b = Matrix(matrix: matrix_float4x4([simd_float4(     0.625,     0.649519, -0.4330127, 0),
												simd_float4(-0.4330127,         0.75,        0.5, 0),
												simd_float4(  0.649519, -0.124999985,       0.75, 0),
												simd_float4(         0,            0,          0, 1)]))

		a.rotate(x: 30, y: 30, z: 30)
		XCTAssertEqual(a, b)
	}

	func testRotateAngle() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(     0.625,     0.649519, -0.4330127, 0),
												simd_float4(-0.4330127,         0.75,        0.5, 0),
												simd_float4(  0.649519, -0.124999985,       0.75, 0),
												simd_float4(         0,            0,          0, 1)]))
		let angle = Scene.Angle(x: 30, y: 30, z: 30)

		a.rotate(angle: angle)
		XCTAssertEqual(a, b)
	}

	func testScaleX() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(10, 0, 0, 0),
												simd_float4( 0, 1, 0, 0),
												simd_float4( 0, 0, 1, 0),
												simd_float4( 0, 0, 0, 1)]))

		a.scale(sx: 10)
		XCTAssertEqual(a, b)
	}

	func testScaleY() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1,  0, 0, 0),
												simd_float4(0, 10, 0, 0),
												simd_float4(0,  0, 1, 0),
												simd_float4(0,  0, 0, 1)]))

		a.scale(sy: 10)
		XCTAssertEqual(a, b)
	}

	func testScaleZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1, 0,  0, 0),
												simd_float4(0, 1,  0, 0),
												simd_float4(0, 0, 10, 0),
												simd_float4(0, 0,  0, 1)]))

		a.scale(sz: 10)
		XCTAssertEqual(a, b)
	}

	func testScaleXY() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(10,  0, 0, 0),
												simd_float4( 0, 10, 0, 0),
												simd_float4( 0,  0, 1, 0),
												simd_float4( 0,  0, 0, 1)]))

		a.scale(sx: 10, sy: 10)
		XCTAssertEqual(a, b)
	}

	func testScaleXZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(10, 0,  0, 0),
												simd_float4( 0, 1,  0, 0),
												simd_float4( 0, 0, 10, 0),
												simd_float4( 0, 0,  0, 1)]))

		a.scale(sx: 10, sz: 10)
		XCTAssertEqual(a, b)
	}

	func testScaleYZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1,  0,  0, 0),
												simd_float4(0, 10,  0, 0),
												simd_float4(0,  0, 10, 0),
												simd_float4(0,  0,  0, 1)]))

		a.scale(sy: 10, sz: 10)
		XCTAssertEqual(a, b)
	}

	func testScaleXYZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(10,  0,  0, 0),
												simd_float4( 0, 10,  0, 0),
												simd_float4( 0,  0, 10, 0),
												simd_float4( 0,  0,  0, 1)]))

		a.scale(sx: 10, sy: 10, sz: 10)
		XCTAssertEqual(a, b)
	}

	func testScaleS() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(10,  0,  0, 0),
												simd_float4( 0, 10,  0, 0),
												simd_float4( 0,  0, 10, 0),
												simd_float4( 0,  0,  0, 1)]))

		a.scale(s: 10)
		XCTAssertEqual(a, b)
	}

	func testGeneralScale() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1, 0, 0,  0),
												simd_float4(0, 1, 0,  0),
												simd_float4(0, 0, 1,  0),
												simd_float4(0, 0, 0, 10)]))

		a.generalScale(s: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferX() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4( 1, 0, 0, 0),
												simd_float4( 0, 1, 0, 0),
												simd_float4( 0, 0, 1, 0),
												simd_float4(10, 0, 0, 1)]))

		a.transfer(dx: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferY() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1,  0, 0, 0),
												simd_float4(0,  1, 0, 0),
												simd_float4(0,  0, 1, 0),
												simd_float4(0, 10, 0, 1)]))

		a.transfer(dy: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1, 0,  0, 0),
												simd_float4(0, 1,  0, 0),
												simd_float4(0, 0,  1, 0),
												simd_float4(0, 0, 10, 1)]))

		a.transfer(dz: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferXY() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4( 1,  0, 0, 0),
												simd_float4( 0,  1, 0, 0),
												simd_float4( 0,  0, 1, 0),
												simd_float4(10, 10, 0, 1)]))

		a.transfer(dx: 10, dy: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferXZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4( 1, 0,  0, 0),
												simd_float4( 0, 1,  0, 0),
												simd_float4( 0, 0,  1, 0),
												simd_float4(10, 0, 10, 1)]))

		a.transfer(dx: 10, dz: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferYZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4(1, 0,  0, 0),
												simd_float4(0, 1,  0, 0),
												simd_float4(0, 0,  1, 0),
												simd_float4(0, 10, 10, 1)]))

		a.transfer(dy: 10, dz: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferXYZ() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4( 1,  0,  0, 0),
												simd_float4( 0,  1,  0, 0),
												simd_float4( 0,  0,  1, 0),
												simd_float4(10, 10, 10, 1)]))

		a.transfer(dx: 10, dy: 10, dz: 10)
		XCTAssertEqual(a, b)
	}

	func testTransferOffset() {
		var a = Matrix()
		let b = Matrix(matrix: matrix_float4x4([simd_float4( 1,  0,  0, 0),
												simd_float4( 0,  1,  0, 0),
												simd_float4( 0,  0,  1, 0),
												simd_float4(10, 10, 10, 1)]))

		let offset = Scene.Offset(x: 10, y: 10, z: 10)
		a.transfer(offset: offset)
		XCTAssertEqual(a, b)
	}


}

