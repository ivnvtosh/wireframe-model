//
//  GestureControl.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 19.06.2022.
//

import UIKit

extension ViewController {

	func gestureControl() {
		let rotationXYRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.gestureControlOfRotationXY))
		rotationXYRecognizer.minimumNumberOfTouches = 1
		rotationXYRecognizer.maximumNumberOfTouches = 1
		view.addGestureRecognizer(rotationXYRecognizer)

		let rotationZRecognizer = UIRotationGestureRecognizer(target: self, action: #selector(self.gestureControlOfRotationZ))
		view.addGestureRecognizer(rotationZRecognizer)

		let scaleRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(self.gestureControlOfScale))
		view.addGestureRecognizer(scaleRecognizer)

		let offsetRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.gestureControlOfOffset))
		offsetRecognizer.minimumNumberOfTouches = 2
		offsetRecognizer.maximumNumberOfTouches = 2
		view.addGestureRecognizer(offsetRecognizer)

		let resetRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.gestureControlOfReset))
		resetRecognizer.numberOfTapsRequired = 2
		view.addGestureRecognizer(resetRecognizer)
	}

	@objc private func gestureControlOfRotationXY(sender: UIPanGestureRecognizer) {
		guard let canvas = self.canvas else {
			return
		}

		scene.angle.y -= Float(sender.velocity(in: canvas).x) / 100
		scene.angle.x += Float(sender.velocity(in: canvas).y) / 100

		if scene.angle.x > 360 {
			scene.angle.x = -360
		}

		if scene.angle.x < -360 {
			scene.angle.x = 360
		}

		if scene.angle.y > 360 {
			scene.angle.y = -360
		}

		if scene.angle.y < -360 {
			scene.angle.y = 360
		}

		canvas.setNeedsDisplay()
	}

	@objc private func gestureControlOfRotationZ(sender: UIRotationGestureRecognizer) {
		guard let canvas = self.canvas else {
			return
		}

		scene.angle.z -= Float(sender.velocity)

		if scene.angle.z > 360 {
			scene.angle.z = -360
		}

		if scene.angle.z < -360 {
			scene.angle.z = 360
		}

		canvas.setNeedsDisplay()
	}

	@objc private func gestureControlOfScale(sender: UIPinchGestureRecognizer) {
		guard let canvas = self.canvas else {
			return
		}

		scene.zoom += Float(sender.velocity / 2)

		if scene.zoom >= 100 {
			scene.zoom = 100
		}

		if scene.zoom <= 10 {
			scene.zoom = 10
		}

		canvas.setNeedsDisplay()
	}

	@objc private func gestureControlOfOffset(sender: UIPanGestureRecognizer) {
		guard let canvas = self.canvas else {
			return
		}

		scene.offset.x += Float(sender.velocity(in: canvas).x) / 60
		scene.offset.y += Float(sender.velocity(in: canvas).y) / 60

		canvas.setNeedsDisplay()
	}

	@objc private func gestureControlOfReset(sender: UITapGestureRecognizer) {
		guard let canvas = self.canvas else {
			return
		}

		scene.angle.x = -45
		scene.angle.y =  15
		scene.angle.z = -30

		scene.offset.x = Float(view.bounds.width  / 2)
		scene.offset.y = Float(view.bounds.height / 2)

		scene.zoom = 15

		canvas.setNeedsDisplay()
	}


}

