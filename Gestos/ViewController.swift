//
//  ViewController.swift
//  Gestos
//
//  Created by Thales Toniolo on 10/18/14.
//  Copyright (c) 2014 FIAP. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

	// No storyboard, a propriedade "User Interaction Enabled" deve ser marcada. Isso faz com que seja permitido interação do usuario na imagem, que por default nao permite!
	@IBOutlet weak var paisagemImageView: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Configura o gesto de tap via codigo
		let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.handleTap(_:)))
		tapGesture.delegate = self
		self.paisagemImageView.addGestureRecognizer(tapGesture)
	}

	//MARK: - Gesture recognizers handles
	func handleTap(recognizer:UITapGestureRecognizer) {
		print("Tap no objeto!")
	}

	@IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
		let translation:CGPoint = recognizer.translationInView(self.view)
		recognizer.view!.center = CGPointMake(recognizer.view!.center.x + translation.x, recognizer.view!.center.y + translation.y)
		recognizer.setTranslation(CGPointMake(0, 0), inView: self.view)
	}
	
	@IBAction func handlePinch(recognizer:UIPinchGestureRecognizer) {
		recognizer.view!.transform = CGAffineTransformScale(recognizer.view!.transform, recognizer.scale, recognizer.scale)
		recognizer.scale = 1
	}
	
	@IBAction func handleRotate(recognizer:UIRotationGestureRecognizer) {
		recognizer.view!.transform = CGAffineTransformRotate(recognizer.view!.transform, recognizer.rotation)
		recognizer.rotation = 0
	}

	//MARK: - UIGestureRecognizerDelegate
	// Permite com que todos gestos funcione simultaneamente
	func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		return true
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
