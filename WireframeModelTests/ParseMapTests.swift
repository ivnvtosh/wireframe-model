//
//  ParseMapTests.swift
//  WireframeModelTests
//
//  Created by Anton Ivanov on 16.06.2022.
//

import XCTest
@testable import WireframeModel

final class MapTests: XCTestCase {

	func testFileNotFound() {
		let mapName = "NoFile"

		XCTAssertThrowsError(_ = try Map(forResource: mapName), "",
							 { error in XCTAssertEqual(error as? Map.MapError, .fileNotFound)
		})
	}

	func testFileEmpty() {
		let mapName = "FileEmpty"

		XCTAssertThrowsError(_ = try Map(forResource: mapName), "",
							 { error in XCTAssertEqual(error as? Map.MapError, .fileEmpty)
		})
	}

	func testFileOnlySpaces() {
		let mapName = "OnlySpaces"

		XCTAssertThrowsError(_ = try Map(forResource: mapName), "",
							 { error in XCTAssertEqual(error as? Map.MapError, .fileEmpty)
		})
	}

	func testInvalidMap() {
		let mapName = "InvalidMap"

		XCTAssertThrowsError(_ = try Map(forResource: mapName), "",
							 { error in XCTAssertEqual(error as? Map.MapError, .invalidMap)
		})
	}

	func testInvalidNotRectMap() {
		let mapName = "InvalidNotRectMap"

		XCTAssertThrowsError(_ = try Map(forResource: mapName), "",
							 { error in XCTAssertEqual(error as? Map.MapError, .invalidMap)
		})
	}

	func testInvalidPlane() {
		let mapName = "InvalidPlane"

		XCTAssertThrowsError(_ = try Map(forResource: mapName), "",
							 { error in XCTAssertEqual(error as? Map.MapError, .invalidMap)
		})
	}

	func testInvalidPoint() {
		let mapName = "InvalidPoint"

		XCTAssertThrowsError(_ = try Map(forResource: mapName), "",
							 { error in XCTAssertEqual(error as? Map.MapError, .invalidMap)
		})
	}

	func testPlane() {
		let mapName = "Plane"

		XCTAssertNoThrow(_ = try Map(forResource: mapName))

		let map = try! Map(forResource: mapName)

		let height = [[0, 0, 0],
					  [0, 0, 0],
					  [0, 0, 0]]

		XCTAssertEqual(map.height, height)

		XCTAssertEqual(map.size.x, 3)
		XCTAssertEqual(map.size.y, 3)
		XCTAssertEqual(map.size.z, 0)

	}

	func testTetrahedron() {
		let mapName = "Tetrahedron"

		XCTAssertNoThrow(_ = try Map(forResource: mapName))

		let map = try! Map(forResource: mapName)

		let height = [[0, 0, 0, 0, 0, 0, 0, 0, 0],
					  [0, 1, 1, 1, 1, 1, 1, 1, 0],
					  [0, 1, 2, 2, 2, 2, 2, 1, 0],
					  [0, 1, 2, 3, 3, 3, 2, 1, 0],
					  [0, 1, 2, 3, 4, 3, 2, 1, 0],
					  [0, 1, 2, 3, 3, 3, 2, 1, 0],
					  [0, 1, 2, 2, 2, 2, 2, 1, 0],
					  [0, 1, 1, 1, 1, 1, 1, 1, 0],
					  [0, 0, 0, 0, 0, 0, 0, 0, 0]]

		XCTAssertEqual(map.height, height)

		XCTAssertEqual(map.size.x, 9)
		XCTAssertEqual(map.size.y, 9)
		XCTAssertEqual(map.size.z, 4)

	}


}

