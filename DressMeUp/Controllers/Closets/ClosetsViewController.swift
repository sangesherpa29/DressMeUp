//
//  ClosetsViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 18/05/2023.
//

import UIKit
import SnapKit

class ClosetsViewController: UIViewController {
    
    var topBar = getTopBar(withTitle: "Closets")
    
    lazy var table: UITableView = {
        var table = UITableView()
        table.layer.cornerRadius = 5
        table.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        table.delegate = self
        table.dataSource = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = UIColor.mainBackgroundColor
        view.addSubview(topBar)
        view.addSubview(table)
        
        topBar.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        
        table.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }

}


extension ClosetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = "Hello !"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
