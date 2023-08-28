//
//  SearchResultsCell.swift
//  WordDictonary
//
//  Created by 1979876 on 02/08/23.
//

import Foundation
import UIKit

class SearchResultsCell: UITableViewCell {
    
    @IBOutlet weak var labelWordUsed: UILabel!
    @IBOutlet weak var labelDefination: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(with meaning: Meaning) {
        labelWordUsed.text = meaning.partOfSpeech
        labelDefination.text = meaning.definations[0].defination
    }
}
