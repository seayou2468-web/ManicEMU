import UIKit

public class SkinSettingsViewController: UIViewController {
    private let skinSettingsView: SkinSettingsView

    public init(gameType: GameType, game: LibSkinGameProtocol? = nil) {
        self.skinSettingsView = SkinSettingsView(gameType: gameType, game: game)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(skinSettingsView)
        skinSettingsView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
