//
//  ProductListCell.swift
//  MVVMDemo
//
//  Created by Rishi Jha on 01/05/24.
//

import UIKit

class ProductListCell: UITableViewCell {

    
    @IBOutlet weak var productBackgroundView: UIView!
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productCatagory: UILabel!
    
    @IBOutlet weak var productRating: UIButton!
    
    @IBOutlet weak var productDesc: UILabel!
    
    @IBOutlet weak var productPrise: UILabel!
    
    var product: Product?{
        didSet{
            productDetailCoinfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImage.layer.cornerRadius = 10
        productBackgroundView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailCoinfiguration(){
        guard let product else{return}
        productTitle.text = product.title
        productCatagory.text = product.category
        productRating.setTitle("\(product.rating.rate)", for: .normal)
        productDesc.text = product.description
        productPrise.text = "$\(product.price)"
        productImage.setImage(with: product.image)
    }
    
}
