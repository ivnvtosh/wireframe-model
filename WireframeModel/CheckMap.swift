//
//  CheckMap.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 17.06.2022.
//

import Foundation

extension Map {

	func isInvalidMap(_ dataFromFile: String) -> Bool {
		for character in dataFromFile {
			switch character {
			case "0"..."9", "-":
				continue
			case " ", "\n", "\t":
				continue
			default:
				return true
			}
		}

		return false
	}

	func isMapRect(_ height: [[Int]]) -> Bool {
		var i = 0
		for _ in height[0] {
			i += 1
		}

		let x = i
		for y in height {
			i = 0
			for _ in y {
				i += 1
			}
			if x != i {
				return false
			}
		}

		return true
	}

}
