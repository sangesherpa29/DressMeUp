//
//  ClosetsViewController.swift
//  DressMeUp
//
//  Created by Sange Sherpa on 18/05/2023.
//

import UIKit
import SnapKit

class ClosetsViewController: UIViewController {
    
    var closets = [String]()
    
    var topBar = getTopBar(withTitle: "Closets")
    
    lazy var table: UITableView = {
        var table = UITableView()
        table.register(ClosetTableViewCell.self, forCellReuseIdentifier: ClosetTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        table.isEditing = false
        return table
    }()
    
    var addClosetButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(systemName: "plus")?.withTintColor(UIColor.primaryLabelColor, renderingMode: .alwaysOriginal)
        btn.setBackgroundImage(image, for: .normal)
        return btn
    }()
    
    var editButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(systemName: "pencil")?.withTintColor(UIColor.primaryLabelColor, renderingMode: .alwaysOriginal)
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
        view.addSubview(editButton)
        
        addClosetButton.addTarget(self, action: #selector(addClosetTapped), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editTapped), for: .touchUpInside)
        
        topBar.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
        addClosetButton.snp.makeConstraints { make in
            make.centerY.equalTo(topBar)
            make.right.equalTo(editButton.snp.left).offset(-10)
            make.width.height.equalTo(30)
        }
        editButton.snp.makeConstraints { make in
            make.centerY.equalTo(topBar)
            make.right.equalToSuperview().offset(-20)
            make.width.height.equalTo(30)
        }
        
        table.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc func addClosetTapped(_ sender: UIButton) {
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
    
    @objc func editTapped(_ sender: UIButton) {
        if table.isEditing == false {
            table.isEditing = true
        } else {
            table.isEditing = false
        }
    }

}


extension ClosetsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { closets.count }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 70 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ClosetTableViewCell.identifier,
            for: indexPath) as! ClosetTableViewCell
        cell.nameLabel.text = closets[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool { true }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.closets.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}
