//
//  PrintMap.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 17.06.2022.
//

import Foundation

func print(error: Map.MapError, mapName: String) {
	switch error {
	case .fileNotFound:
		Swift.print(mapName, "file not found", separator: ": ")
	case .fileEmpty:
		Swift.print(mapName, "file empty", separator: ": ")
	case .invalidMap:
		Swift.print(mapName, "invalid map", separator: ": ")
	default:
		Swift.print(mapName, ": something wrong", separator: ": ")
	}
}

extension Map {

	func printHeight() {
		var maxLenght = 0

		for y in self.height {
			for x in y {
				let string = String(x)

				if string.count > maxLenght {
					maxLenght = string.count
				}
			}
		}

		var message = "\n"
		for y in self.height {
			for x in y {
				let string = String(x)

				if string.count <= maxLenght {
					for _ in 0...(maxLenght - string.count) {
						message += " "
					}
				}
				message += string
			}
			message += "\n"
		}
		
		Swift.print(message)
	}

	func printSize() {
		Swift.print("size.x:", self.size.x)
		Swift.print("size.y:", self.size.y)
		Swift.print("size.z:", self.size.z)
	}


}

