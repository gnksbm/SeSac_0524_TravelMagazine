//
//  UIViewController+.swift
//  SeSac_0524_TravelMagazine
//
//  Created by gnksbm on 5/27/24.
//

import UIKit

extension UIViewController {
    func showAlert(message: String) {
        let alertController = UIAlertController(
            title: message,
            message: nil,
            preferredStyle: .alert
        )
        let ok = UIAlertAction(title: "확인", style: .default)
        alertController.addAction(ok)
        present(alertController, animated: true)
    }
    
    func showActionSheet(
        titleList: [String],
        handler: @escaping (String) -> Void
    ) {
        let alertController = UIAlertController(
            title: nil,
            message: nil,
            preferredStyle: .actionSheet
        )
        titleList.forEach { title in
            let action = UIAlertAction(title: title, style: .default) { _ in
                handler(title)
            }
            alertController.addAction(action)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    func setPlaceHolderView(message: String) {
        let label = UILabel()
        label.text = message
        label.font = .boldSystemFont(ofSize: 30)
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        view.backgroundColor = .systemBackground
    }
    
    func hideKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}
