//
//  WordCupViewController.swift
//  CampeoesDaCopa
//
//  Copyright © 2019 Rafaela Galdino. All rights reserved.
//

import UIKit

class WordCupViewController: UIViewController {

    var worldCup: WorldCup!
    
    @IBOutlet weak var ivWinner: UIImageView!
    @IBOutlet weak var ivVice: UIImageView!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbWinner: UILabel!
    @IBOutlet weak var lbVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "World Cup \(worldCup.year)"
        ivWinner.image = UIImage(named: worldCup.winner)
        ivVice.image = UIImage(named: worldCup.vice)
        lbWinner.text = worldCup.winner
        lbVice.text = worldCup.vice
        lbScore.text = "\(worldCup.winnerScore) x \(worldCup.viceScore)"
    }
}

extension WordCupViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
        cell.prepare(with: game)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
}

extension WordCupViewController: UITableViewDelegate {
    
}
