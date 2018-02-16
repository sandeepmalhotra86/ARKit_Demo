//
//  SolarVC.swift
//  ArPart_Three
//
//  Created by Gaurav Sharma on 2/9/18.
//  Copyright © 2018 Gaurav Sharma. All rights reserved.
//

import UIKit
import ARKit

class SolarVC: UIViewController {

    @IBOutlet var solar_ScnView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        solar_ScnView.session.run(configuration)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func show_btnAction(_ sender: Any) {
        addNode()
    }
    
    
    @IBAction func back_btn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    
    func addNode1(){
        
        let node = SCNNode(geometry: SCNSphere(radius: 0.1))
        node.position = SCNVector3(0,0,0)
        node.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "EarthDay")
        node.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "EarthSpecular")
        node.geometry?.firstMaterial?.emission.contents = #imageLiteral(resourceName: "EarthCloud")
        
        
        
        


        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: 8)
        let runForever = SCNAction.repeatForever(action)
        node.runAction(runForever)
        solar_ScnView.scene.rootNode.addChildNode(node)
        
    }
    
    
    func addNode(){
        
        let sunNode = SCNNode(geometry: SCNSphere(radius: 0.2))
        sunNode.position = SCNVector3(0,0,-1)
        sunNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Sun")
        
        let earthparentnode = SCNNode()
        earthparentnode.position = SCNVector3(0,0,-1)
        
        let moonparentnode = SCNNode()
        moonparentnode.position = SCNVector3(1,0,0)
        
        let earthNode = SCNNode(geometry: SCNSphere(radius: 0.2))
        // MARK: Diffuse
        // to wrap around the whole surface
        
        earthNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "EarthDay")
        // MARK: specular
        // to wrap around the whole surface so that light reflects
        earthNode.geometry?.firstMaterial?.specular.contents = #imageLiteral(resourceName: "EarthSpecular")
        // MARK: emission
        // add color or contents to surface
        earthNode.geometry?.firstMaterial?.emission.contents = #imageLiteral(resourceName: "EarthCloud")
        earthNode.geometry?.firstMaterial?.normal.contents = #imageLiteral(resourceName: "EarthNormal")
        earthNode.position = SCNVector3(1,0,0)
        
        
        let venusNode = SCNNode(geometry: SCNSphere(radius: 0.2))
        venusNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Venus")
        venusNode.position = SCNVector3(0.6,0,0)
        
        let moonNode = SCNNode(geometry: SCNSphere(radius: 0.1))
        moonNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "Moon")
        moonNode.position = SCNVector3(0,0,-0.3)
        
        
        let action = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: 8)
        let runForever = SCNAction.repeatForever(action)
        sunNode.runAction(runForever)
        
         let EarthAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: 8)
        let rotateEarthParentNode = SCNAction.repeatForever(EarthAction)
        
        let moonAction = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: 1)
        let rotateMoonParentNode = SCNAction.repeatForever(moonAction)
        
        sunNode.runAction(runForever)
        earthparentnode.runAction(rotateEarthParentNode)
        moonparentnode.runAction(rotateMoonParentNode)
        
        sunNode.addChildNode(venusNode)
        earthparentnode.addChildNode(earthNode)
        earthparentnode.addChildNode(moonparentnode)
        earthNode.addChildNode(moonNode)
        moonparentnode.addChildNode(moonNode)


        solar_ScnView.scene.rootNode.addChildNode(sunNode)
        solar_ScnView.scene.rootNode.addChildNode(earthparentnode)

 
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


