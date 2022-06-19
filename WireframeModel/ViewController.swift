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

		let mapName = "Hemisphere"
		do {
			let map = try Map(forResource: mapName)
			scene = Scene(map: map, rect: self.view.bounds)
		} catch let error {
			print(error: error as! Map.MapError, mapName: mapName)
			return
		}

		canvas = UICanvasView(frame: self.view.bounds)
		self.view.addSubview(canvas)

		dataDisplay(angle: labelAngle, offset: labelOffset, scale: labelScale)

		gestureControl()

		// Do any additional setup after loading the view.
	}


}

