import UIKit
import SnapKit

class RecentsViewController: UIViewController {
    
    var topBar = getTopBar(withTitle: "Recents")
        
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
        
        topBar.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }

        recentOutfitsContainer.snp.makeConstraints { make in
            make.top.equalTo(topBar.snp.bottom)
            make.left.equalToSuperview()
            make.right.bottom.equalToSuperview()
        }
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
