//
//  StructScene.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 18.06.2022.
//

import UIKit

var scene = Scene()

struct Scene {

	let map: Map

	struct Angle {
		var x: Float = -45
		var y: Float =  15
		var z: Float = -30
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

	init(map: Map, rect: CGRect) {
		self.map = map
		self.offset.x = Float(rect.width  / 2)
		self.offset.y = Float(rect.height / 2)
		self.center.x = Float(map.size.x  / 2)
		self.center.y = Float(map.size.y  / 2)
		self.center.z = Float(map.size.z  / 2)
	}

	init() {
		self.map = Map()
	}


}

