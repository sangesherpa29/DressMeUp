import UIKit

class FavouritesViewController: UIViewController {
    
    var topBar = getTopBar(withTitle: "Favourites")

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.backgroundColor = UIColor.mainBackgroundColor
        view.addSubview(topBar)
        
        topBar.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(80)
        }
    }
    
}
