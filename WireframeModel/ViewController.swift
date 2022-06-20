//
//  ViewController.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 16.06.2022.
//

import UIKit

class ViewController: UIViewController {

	var canvas: UICanvasView!

	@IBOutlet weak var labelAngle:  UILabel!
	@IBOutlet weak var labelOffset: UILabel!
	@IBOutlet weak var labelScale:  UILabel!

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

		scene.angle.x = -45
		scene.angle.y =   0
		scene.angle.z = -45

		scene.scale = 15

		canvas = UICanvasView(frame: view.bounds)
		self.view.addSubview(canvas)
		self.view.addSubview(labelAngle)
		self.view.addSubview(labelOffset)
		self.view.addSubview(labelScale)

		dataDisplay(angle: labelAngle, offset: labelOffset, scale: labelScale)

		gestureControl()

		// Do any additional setup after loading the view.
	}


}

