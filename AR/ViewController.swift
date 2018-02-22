//
//  ViewController.swift
//  AR
//
//  Created by Divyankitha Raghava Urs on 2/22/18.
//  Copyright © 2018 Divyankitha Raghava Urs. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView! //Represents the Scene View created to render the 3D objects
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        sceneView.delegate = self
        
        let scene = SCNScene(named: "art.scnassets/ship.scn")! // Creating a new scene with the object ship
        
        
        sceneView.scene = scene //Set the view to present the scene
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)

        //This takes the input from the sensors and the device's camera and builds a digital image of the device's surrounding and the position of the device.
        let configuration = ARWorldTrackingConfiguration()

        sceneView.session.run(configuration)
        // Once this called, that session's digital image of the device's surrounding is saved and we can place objects onto the real wolrd scene.
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause() //pause the scene
    }
}
