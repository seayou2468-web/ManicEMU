import UIKit
import Foundation
import BetterSegmentedControl
import UniformTypeIdentifiers
import ProHUD
import SnapKit

public class SkinSettingsView: BaseView {
    public weak var dataSource: LibSkinDataSource?
    public weak var delegate: LibSkinDelegate?

    public var gameType: GameType
    public var game: LibSkinGameProtocol?

    private var allSkins: [LibSkinModel] = []
    private var isLandscape: Bool = false

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.dataSource = self
        view.delegate = self
        view.register(SkinCollectionViewCell.self, forCellWithReuseIdentifier: "SkinCell")
        view.register(AddSkinCollectionViewCell.self, forCellWithReuseIdentifier: "AddSkinCell")
        return view
    }()

    public init(gameType: GameType, game: LibSkinGameProtocol? = nil) {
        self.gameType = gameType
        self.game = game
        super.init(frame: .zero)
        setupUI()
        reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    public func reloadData() {
        allSkins = LibSkin.dataSource?.skins(for: gameType) ?? []
        collectionView.reloadData()
    }
}

extension SkinSettingsView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allSkins.count + 1
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < allSkins.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkinCell", for: indexPath) as! SkinCollectionViewCell
            cell.configure(with: allSkins[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddSkinCell", for: indexPath) as! AddSkinCollectionViewCell
            return cell
        }
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item < allSkins.count {
            let skin = allSkins[indexPath.item]
            delegate?.libSkinDidSelectSkin(skin)
        } else {
            // Handle add skin
        }
    }
}
