//
//  ReusableCells.swift
//  ArielsJourney
//
//  Created by Eduardo Oliveira on 03/09/23.
//

import UIKit

public protocol ReusableView { }

protocol DisplayableCell {
    var mainInformation: String? { get }
    var descriptionInformation: String? { get }
    var dateString: String? { get }
}

extension ReusableView where Self: UITableViewCell {

    static var cellIdentifier: String {
        return "\(Self.self)"
    }

    static func registerClass(for tableView: UITableView) {
        tableView.register(self.classForCoder(), forCellReuseIdentifier: cellIdentifier)
    }

    static func registerNib(for tableView: UITableView) {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
    }
    
    static func registerNibHeader(for tableView: UITableView) {
        let nib = UINib(nibName: headerIdentifier, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: headerIdentifier)
    }

    static func dequeueCell(from tableView: UITableView?, for indexPath: IndexPath? = nil) -> Self {
        if let indexPath = indexPath,
            let cell = tableView?.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Self {
            return cell
        } else if let cell = tableView?.dequeueReusableCell(withIdentifier: cellIdentifier) as? Self {
            return cell
        } else {
            return Self()
        }
    }
}

extension UIView: ReusableView { }

extension ReusableView where Self: UICollectionViewCell {

    static var cellIdentifier: String {
        return "\(Self.self)"
    }

    static func registerNib(for collection: UICollectionView) {
        let nib = UINib(nibName: cellIdentifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    static func dequeueCell(from collection: UICollectionView?, for indexPath: IndexPath) -> Self {
        let cell = collection?.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? Self
        return cell ?? Self()
    }
}

extension ReusableView where Self: UIView {
    static var headerIdentifier: String {
        return "\(Self.self)"
    }

    static func registerNib(for tableView: UITableView) {
        let nib = UINib(nibName: headerIdentifier, bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: headerIdentifier)
    }

    static func dequeueHeader(from tableView: UITableView?) -> Self {
        if let cell = tableView?.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as? Self {
            return cell
        } else {
            return Self()
        }
    }
}
