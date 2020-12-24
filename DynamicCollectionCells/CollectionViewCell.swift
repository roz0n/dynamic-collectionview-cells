//
//  CollectionViewCell.swift
//  DynamicCollectionCells
//
//  Created by Arnaldo Rozon on 12/24/20.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "Cell"
    
    var text: String? {
        didSet {
            textView.text = text ?? "No data present"
        }
    }
    
    let textView: UITextView = {
        let text = UITextView(frame: .zero)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        text.isScrollEnabled = false
        text.textColor = Data.colors["text"]
        text.backgroundColor = Data.colors["foreground"]
        text.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        return text
    }()
    
    // 2. Create a width constraint to eventually apply to the cell
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        
        width.isActive = true
        return width
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        prepareViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 3. Set the width of the cell equal to the width constraint from before and set height of all cells to some size
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
    
    private func prepareViews() {
        contentView.addSubview(textView)
        NSLayoutConstraint.activate([
            textView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            textView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            textView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            // 4. The most important step, set the bottom anchor of the content view to the bottom anchor of the bottom-most view
            contentView.bottomAnchor.constraint(equalTo: textView.bottomAnchor)
        ])
    }
    
}
