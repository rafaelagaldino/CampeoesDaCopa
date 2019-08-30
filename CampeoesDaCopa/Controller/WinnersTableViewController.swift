//
//  WinnersTableViewController.swift
//  CampeoesDaCopa
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class WinnersTableViewController: UITableViewController {

    var worldCups: [WorldCup] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadWorldCups()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! WordCupViewController
        let worldCup = worldCups[tableView.indexPathForSelectedRow!.row]
        vc.worldCup = worldCup
    }
    
    func loadWorldCups() {
        let fileURL = Bundle.main.url(forResource: "winners.json", withExtension: nil)!
        let jsonData = try! Data(contentsOf: fileURL)
        do {
            worldCups = try JSONDecoder().decode([WorldCup].self, from: jsonData)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return worldCups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WorldCupTableViewCell

        let worldCup = worldCups[indexPath.row]
        cell.prepare(with: worldCup)
        //cell.textLabel?.text = "Copa \(worldCup.year) - \(worldCup.country)"
        //cell.detailTextLabel?.text = "\(worldCup.winner) vs \(worldCup.vice)"
        //cell.imageView?.image = UIImage(named: "\(worldCup.winner)")
        return cell
    }
}
