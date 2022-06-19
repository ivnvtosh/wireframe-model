//
//  UICanvasView.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 18.06.2022.
//

import UIKit

class UICanvasView: UIView {
 
	private func drawBackground(_ rect: CGRect) {
		let path = UIBezierPath(rect: CGRect(x: 0, y: 0,
											 width: rect.width, height: rect.height))

		UIColor.systemBackground.setFill()
		path.fill()
		path.close()
	}

	private func calculate(point: CGPoint, matrix: Matrix) -> CGPoint {
		let tempX = point.x - CGFloat(scene.center.x)
		let tempY = point.y - CGFloat(scene.center.y)
		let tempZ = CGFloat(Float(scene.map.height[Int(point.y)][Int(point.x)]) - scene.center.z)

		var x: CGFloat
		x =  CGFloat(matrix.a(1, 1)) * tempX
		x += CGFloat(matrix.a(1, 2)) * tempY
		x += CGFloat(matrix.a(1, 3)) * tempZ

		var y: CGFloat
		y =  CGFloat(matrix.a(2, 1)) * tempX
		y += CGFloat(matrix.a(2, 2)) * tempY
		y += CGFloat(matrix.a(2, 3)) * tempZ

		x += CGFloat(matrix.a(4, 1))
		y += CGFloat(matrix.a(4, 2))

		let new = CGPoint(x: x, y: y)

		return new
	}

	private func drawLine(path: UIBezierPath, matrix: Matrix, start: CGPoint, end: CGPoint) {
		let newStart = calculate(point: start, matrix: matrix)
		let newEnd   = calculate(point: end,   matrix: matrix)

		path.move(to: newStart)
		path.addLine(to: newEnd)
		path.close()

	}

	private func setUIColor() {
		switch traitCollection.userInterfaceStyle {
		case .dark:
			UIColor.white.setStroke()
		default:
			UIColor.black.setStroke()
		}
	}

	private func drawFrame() {
		let path = UIBezierPath()
		let matrix = Matrix(scene: scene)

		for y in 0..<scene.map.size.y {
			for x in 0..<scene.map.size.x {

				if x + 1 < scene.map.size.x {
					drawLine(path: path,
							 matrix: matrix,
							 start: CGPoint(x: x, y: y),
							 end: CGPoint(x: x + 1, y: y))
				}

				if y + 1 < scene.map.size.y {
					drawLine(path: path,
							 matrix: matrix,
							 start: CGPoint(x: x, y: y),
							 end: CGPoint(x: x, y: y + 1))
				}
			}
		}

		setUIColor()
		path.stroke()

	}

	override func draw(_ rect: CGRect) {
		drawBackground(rect)
		drawFrame()

		// Only override draw() if you perform custom drawing.
		// An empty implementation adversely affects performance during animation.
	}


}

