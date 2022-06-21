//
//  ParseMap.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 16.06.2022.
//

import Foundation

extension Map {

	func isMapPoint(_ height: [[Int]]) -> Bool {
		if height.count == 1, height[0].count == 1 {
			return true
		}
		return false
	}

	func parseMap(forResource: String) throws -> [[Int]] {
		guard let path = Bundle.main.path(forResource: forResource, ofType: "txt") else {
			throw MapError.fileNotFound
		}

		guard let dataFromFile = try? String(contentsOfFile: path) else {
			throw MapError.somethingWrong
		}

		if isInvalidMap(dataFromFile) == true {
			throw MapError.invalidMap
		}

		let height = parser(dataFromFile)

		if height.isEmpty {
			throw MapError.fileEmpty
		}

		if isMapPoint(height) == true {
			throw MapError.invalidMap
		}

		if isMapRect(height) == false {
			throw MapError.invalidMap
		}

		return height
	}

	func calculate(_ height: [[Int]]) -> Size {
		var x: Int = 0
		for _ in height[0] {
			x += 1
		}

		var y: Int = 0
		for _ in height {
			y += 1
		}

		var minZ = 0
		var maxZ = 0
		for y in height {
			for x in y {
				if x < minZ {
					minZ = x
				}
				if x > maxZ {
					maxZ = x
				}
			}
		}

		let size = Size(x: x, y: y, z: abs(minZ) + abs(maxZ))
		return size
	}

	private func getHeightY(_ dataFromString: String) -> [Int] {
		var heightY = [Int]()

		for string in dataFromString.components(separatedBy: " ") {

			if let x = Int(string) {
				heightY.append(x)
			}

		}

		return heightY
	}

	private func parser(_ dataFromFile: String) -> [[Int]] {
		var height = [[Int]]()

		for dataFromString in dataFromFile.components(separatedBy: "\n") {
			let heightY = getHeightY(dataFromString)

			if heightY.isEmpty {
				break
			}

			height.append(heightY)
		}

		return height
	}

}
