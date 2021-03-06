//
//  ImageSlideView.swift
//  SnapShop
//
//  Created by Ky Nguyen Coinhako on 10/4/18.
//  Copyright © 2018 Ky Nguyen. All rights reserved.
//

import UIKit

extension UIView {
    static let imageLoadingViewTag = 1938123987
    func showLoading(style: UIActivityIndicatorView.Style = .gray) {
        var loading = viewWithTag(UIImageView.imageLoadingViewTag) as? UIActivityIndicatorView
        if loading == nil {
            loading = UIActivityIndicatorView(style: style)
        }

        loading?.translatesAutoresizingMaskIntoConstraints = false
        loading!.startAnimating()
        loading!.hidesWhenStopped = true
        loading?.tag = UIImageView.imageLoadingViewTag
        addSubview(loading!)
        loading?.centerSuperView()
    }

    func stopLoading() {
        let loading = viewWithTag(UIImageView.imageLoadingViewTag) as? UIActivityIndicatorView
        loading?.stopAnimating()
    }
}

class knImageSlideCell: knGridCell<String> {
    override func setData(data: String) {
        self.data = data
        imgView.downloadImage(from: data)
    }
    let imgView = UIMaker.makeImageView(contentMode: .scaleAspectFit)
    override func setupView() {
        addSubviews(views: imgView)
        imgView.fillSuperView()
    }
}

class knImageSlideView: knGridView<knImageSlideCell, String> {
    let dots = UIPageControl()
    override var datasource: [String] { didSet {
        dots.numberOfPages = datasource.count
        dots.hidesForSinglePage = true
        }}
    
    override func setupView() {
        super.setupView()
        clipsToBounds = true
        layout.scrollDirection = .horizontal
        collectionView.isPagingEnabled = true

        dots.translatesAutoresizingMaskIntoConstraints = false
        dots.currentPageIndicatorTintColor = UIColor.gray
        dots.pageIndicatorTintColor = UIColor(value: 243)
        
        addSubviews(views: collectionView, dots)
        collectionView.fill(toView: self)

        dots.bottomSuperView()
        dots.centerX(toView: self)
        dots.transform = CGAffineTransform(scaleX: 0.85, y: 0.85)
    }
    
    @objc func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / screenWidth)
        dots.currentPage = page
    }
}
