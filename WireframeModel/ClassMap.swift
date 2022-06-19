//
//  ClassMap.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 16.06.2022.
//

import Foundation

class Map {

	var height: [[Int]]!
	var size:   Size!

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
		self.height = try parseMap(forResource: forResource)
		self.size = calculate(height)
	}

	init() {
		
	}


}

