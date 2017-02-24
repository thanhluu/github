//
//  SettingsController.swift
//  GithubDemo
//
//  Created by LVMBP on 2/24/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    @IBOutlet weak var starView: UIView!
    @IBOutlet weak var starLabel: UILabel!
    var newStarValue = 0
    @IBAction func onStarChanged(_ sender: UISlider) {
        newStarValue = Int(sender.value)
        starLabel.text = String(newStarValue)
        let preferences = UserDefaults.standard
        preferences.set(sender.value, forKey: "minimum_star")
    }
    
    @IBOutlet weak var starSlider: UISlider!
    
    var previousStarSaved = 0
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func onCancel(_ sender: UIBarButtonItem) {
        let preferences = UserDefaults.standard
        preferences.set(previousStarSaved, forKey: "minimum_star")
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func onSave(_ sender: UIBarButtonItem) {
//        dismiss(animated: true, completion: nil)
//    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        tableView.delegate = self
        tableView.dataSource = self
        
        let preferences = UserDefaults.standard
        previousStarSaved = preferences.integer(forKey: "minimum_star") ?? 0
        if previousStarSaved > 0 {
            starLabel.text = String(previousStarSaved)
            starSlider.value = Float(previousStarSaved)
            newStarValue = previousStarSaved
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension SettingsController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell") as! SwitchCell
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
