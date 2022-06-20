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

	struct Angle {
		var x: Float = -45
		var y: Float =   0
		var z: Float = -45
	}

	struct Offset {
		var x: Float = 0
		var y: Float = 0
		var z: Float = 0
	}

	struct Center {
		var x: Float = 0
		var y: Float = 0
		var z: Float = 0
	}

	var angle = Angle()
	var offset = Offset()
	var center = Center()
	var scale: Float = 15.0
	
	mutating func calculate(center: Map.Size) {
		self.center.x = Float(map.size.x / 2)
		self.center.y = Float(map.size.y / 2)
		self.center.z = Float(map.size.z / 2)
	}

	mutating func calculate(rect: CGRect) {
		self.offset.x = Float(rect.width  / 2)
		self.offset.y = Float(rect.height / 2)
	}

	init() {
		self.map = Map()
		self.mapName = "Castle"
	}


}

