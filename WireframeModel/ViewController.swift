//
//  ViewController.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 16.06.2022.
//

import UIKit

class ViewController: UIViewController {

	var canvas: UICanvasView!

	@IBOutlet weak var labelAngle: UILabel!
	@IBOutlet weak var labelOffset: UILabel!
	@IBOutlet weak var labelScale: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()

		let mapName = scene.mapName
		do {
			let map = try Map(forResource: mapName)
			scene.map = map
			scene.calculate(center: map.size)
			scene.calculate(rect: view.bounds)
		} catch let error {
			print(error: error as! Map.MapError, mapName: mapName)
			return
		}

		scene.defaultSettings()

		canvas = UICanvasView(frame: view.bounds)
		self.view.addSubview(canvas)
		self.view.addSubview(labelAngle)
		self.view.addSubview(labelOffset)
		self.view.addSubview(labelScale)

		dataDisplay(angle: labelAngle, offset: labelOffset, scale: labelScale)

		gestureControl()

		// Do any additional setup after loading the view.
	}

	override func viewWillTransition(to size: CGSize,
									 with coordinator: UIViewControllerTransitionCoordinator) {
		if UIDevice.current.orientation.isLandscape {
			print("Landscape")
			scene.offset.x = Float(size.width / 2)
			scene.offset.y = Float(size.height / 2)
			canvas.setNeedsDisplay()
		} else {
			print("Portrait")
			scene.offset.x = Float(size.width / 2)
			scene.offset.y = Float(size.height / 2)
			canvas.setNeedsDisplay()
		}
	}

}
