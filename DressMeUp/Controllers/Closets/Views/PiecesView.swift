//
//  PiecesView.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 02/08/2023.
//

import Foundation
import UIKit
import SnapKit

class PiecesView: UIView {
    
    let piecesTable = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .green
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension PiecesView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "piecesCell", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    
}

extension PiecesView: UITableViewDelegate {
    
}
