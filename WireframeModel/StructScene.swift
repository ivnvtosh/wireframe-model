//
//  StructScene.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 18.06.2022.
//

import UIKit

var scene = Scene()

struct Scene {

	var map: Map

	var mapName: String

	struct Vector3 {
		var x: Float = 0
		var y: Float = 0
		var z: Float = 0
	}

	var centerRect = Vector3()
	var angle = Vector3()
	var offset = Vector3()
	var center = Vector3()
	var scale: Float = 0

	mutating func defaultSettings() {
		angle.x = 45
		angle.y = 0
		angle.z = 45

		offset.x = 0
		offset.y = 0
		offset.z = 0

		scale = 20
	}

	mutating func calculate(center: Map.Size) {
		self.center.x = Float(map.size.x / 2)
		self.center.y = Float(map.size.y / 2)
		self.center.z = Float(map.size.z / 2)
	}

	mutating func calculate(rect: CGRect) {
		self.centerRect.x = Float(rect.width / 2)
		self.centerRect.y = Float(rect.height / 2)
	}

	init() {
		self.map = Map()
		self.mapName = "Castle"
	}

}
