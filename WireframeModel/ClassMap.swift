//
//  ClassMap.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 16.06.2022.
//

import Foundation

class Map {

//	let height: [[Int]]
//	let size:   Size

	var height: [[Int]] = [[Int]]()
	var size:   Size = Size(x: 0, y: 0, z: 0)

	enum MapError: Error {
		case fileNotFound
		case fileEmpty
		case invalidMap
		case somethingWrong

	}

	struct Size {
		let x: Int
		let y: Int
		let z: Int

	}

	init(forResource: String) throws {
		let height = try parseMap(forResource: forResource)
		let size = calculate(height)

		self.height = height
		self.size = size
	}

	init() {
		
	}

}

