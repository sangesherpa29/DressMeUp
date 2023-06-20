import UIKit
import SnapKit

class RecentsViewController: UIViewController {
    
    var topBar = TopBarView()
    
    lazy var recentOutfitsContainer: UITableView = {
        var recentOutfitsContainer = UITableView()
        recentOutfitsContainer.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.identifier)
        recentOutfitsContainer.backgroundColor = UIColor.mainBackgroundColor
        return recentOutfitsContainer
    }()

    // MARK: Main Calling Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.mainBackgroundColor
        view.addSubview(topBar)
        view.addSubview(recentOutfitsContainer)
        
        recentOutfitsContainer.dataSource = self
        recentOutfitsContainer.delegate = self
        
        // MARK: Constraints
        topBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
        
        recentOutfitsContainer.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
        }
    }
    
    
    @objc private func cameraTapped(_ sender: UIImageView) {
        present(TestViewController(), animated: true)
    }
    
}


extension RecentsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        cell.backgroundColor = UIColor.mainBackgroundColor
        return cell
    }
}
