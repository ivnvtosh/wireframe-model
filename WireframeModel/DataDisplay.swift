//
//  DataDisplay.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 19.06.2022.
//

import UIKit

extension ViewController {

	func dataDisplay(angle label: UILabel) {
		var text = ""

		text += "x: \(String(round(scene.angle.x * 10) / 10)) "
		text += "y: \(String(round(scene.angle.y * 10) / 10)) "
		text += "z: \(String(round(scene.angle.z * 10) / 10))"

		label.text = text
	}

	func dataDisplay(offset label: UILabel) {
		var text = ""

		text += "x: \(String(round(scene.offset.x))) "
		text += "y: \(String(round(scene.offset.y))) "
		text += "z: \(String(round(scene.offset.z)))"

		label.text = text
	}

	func dataDisplay(scale label: UILabel) {
		var text = ""

		text = "scale: \(String(round(scene.scale * 10) / 10))"

		label.text = text
	}

	func dataDisplay(angle: UILabel, offset: UILabel, scale: UILabel) {
		dataDisplay(angle: angle)
		dataDisplay(offset: offset)
		dataDisplay(scale: scale)
	}

}
