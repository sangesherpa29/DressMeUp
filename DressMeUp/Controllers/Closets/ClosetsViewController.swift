//
//  ClosetsViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 18/05/2023.
//

import UIKit
import SnapKit

struct Closet {
    var name: String
}

class ClosetsViewController: UIViewController {
    
    var closets = [String]()
    
    var topBar = getTopBar(withTitle: "Closets")
    
    lazy var table: UITableView = {
        var table = UITableView()
        table.layer.cornerRadius = 5
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        table.delegate = self
        table.dataSource = self
        table.isEditing = true
        return table
    }()
    
    var addClosetButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(systemName: "plus")?.withTintColor(UIColor.primaryLabelColor, renderingMode: .alwaysOriginal)
        btn.setBackgroundImage(image, for: .normal)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = UIColor.mainBackgroundColor
        view.addSubview(topBar)
        view.addSubview(table)
        view.addSubview(addClosetButton)
        
        addClosetButton.addTarget(self, action: #selector(addClosetTapped), for: .touchUpInside)
        
        topBar.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        addClosetButton.snp.makeConstraints { make in
            make.centerY.equalTo(topBar)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(30)
        }
        
        table.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc func addClosetTapped() {
        let alert = UIAlertController(title: "Add a Closet", message: "", preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.placeholder = "Closet Name"
        }
        
        alert.addAction(UIAlertAction(title: "Add", style: .default) { _ in
            // Get name of added closet
            if let closetName = alert.textFields?.first?.text {
                // Add to the closets array which then reflects changes onto the table
                self.closets.append(closetName)
                self.table.reloadData()
            }
        })
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true)
        })
        
        self.present(alert, animated: true)
    }

}


extension ClosetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { closets.count }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 70 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        cell.textLabel?.text = closets[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.ed
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
