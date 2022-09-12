//
//  ToDoTableViewCell.swift
//  ToDoList
//
//  Created by Fırat Kahvecioğlu on 11.09.2022.
//

import UIKit
import SnapKit

protocol ToDoTableViewCellProtocol: AnyObject {
    func checkButtonTapped(item: ToDo)
    func infoButtonTapped(item: ToDo)
}

class ToDoTableViewCell: UITableViewCell {

    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingHead
        return label
    }()
    
    private let dateLabel: UILabel = {
       let date = UILabel()
        date.font = UIFont.boldSystemFont(ofSize: 12)
        date.textColor = .lightGray
        return date
    }()
    
    private let contentLabel: UILabel = {
        let content = UILabel()
        content.font = UIFont.boldSystemFont(ofSize: 14)
        content.textColor = .gray
        content.numberOfLines = 2
        content.lineBreakMode = .byTruncatingTail
        return content
    }()
    
    
    private let checkButton: UIButton = {
       let check = UIButton()
        check.setImage(UIImage(systemName: "square"), for: .normal)
        check.setImage(UIImage(systemName: "checkmark.square"), for: .selected)
        check.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        return check
    }()
    
    private let infoButton: UIButton = {
       let info = UIButton()
        info.setImage(UIImage(systemName: "info.circle"), for: .normal)
        info.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        return info
    }()
    
    private var todoCell: ToDo?
    
     weak var delegate: ToDoTableViewCellProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTodoCell(item: ToDo) {
        self.titleLabel.text = item.title
        self.dateLabel.text = item.date
        self.contentLabel.text = item.content
        self.checkButton.isSelected = item.isCompleted
        self.todoCell = item
        
    }
    
    func configure() {
        addSubviews()
        makeAllConstraints()
    }
    
    
   @objc func checkButtonTapped(){
       delegate?.checkButtonTapped(item: todoCell ?? ToDo(title: "null", content: "null", date: "null"))
    }

    @objc func infoButtonTapped(){
        delegate?.infoButtonTapped(item: todoCell ?? ToDo(title: "null", content: "null", date: "null"))
    }
    

}
// MARK: Make Constraints and addSubviews
extension ToDoTableViewCell {
    func addSubviews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(checkButton)
        contentView.addSubview(infoButton)
        
    }
    func makeAllConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(10)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
        }
        
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.leading.equalTo(10)
            make.size.equalTo(24)
            
        }
        
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.trailing.equalTo(-10)
            make.size.equalTo(24)
        }
        
        
        
    }
}
