//
//  ViewController.swift
//  WireframeModel
//
//  Created by Anton Ivanov on 16.06.2022.
//

import UIKit

class ViewController: UIViewController {

	var canvas: UICanvasView!

	override func viewDidLoad() {
		super.viewDidLoad()

		let mapName = "Hemisphere"
		let map: Map
		do {
			map = try Map(forResource: mapName)
		} catch let error {
			print(error: error as! Map.MapError, mapName: mapName)
			return
		}
		map.printHeight()
		map.printSize()

		scene = Scene(map: map, rect: self.view.bounds)

		canvas = UICanvasView(frame: self.view.bounds)
		self.view.addSubview(canvas)

		gestureControl()

		// Do any additional setup after loading the view.
	}


}

