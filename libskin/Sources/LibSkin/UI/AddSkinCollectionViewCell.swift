import UIKit
import Foundation
import SnapKit

class AddSkinCollectionViewCell: UICollectionViewCell {
    private let plusImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(plusImageView)
        contentView.backgroundColor = UIColor.systemGray6
        contentView.layer.cornerRadius = 8

        plusImageView.image = UIImage(systemName: "plus")
        plusImageView.tintColor = .systemBlue
        plusImageView.contentMode = .center

        plusImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
