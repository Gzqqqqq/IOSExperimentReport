//
//  ViewController.swift
//  test3
//
//  Created by Guozhouqian on 2018/11/7.
//  Copyright © 2018 Guozhouqian. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    
    @IBOutlet weak var scrollView1: UIScrollView!
    @IBOutlet weak var scrollView2: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...7{
            let imageViews = UIImageView(image: UIImage(named: "\(i)"))
            imageViews.contentMode = .scaleAspectFit
            imageViews.frame = CGRect(x: CGFloat(i-1) * scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
            
            scrollView1.addSubview(imageViews)
            scrollView1.isPagingEnabled = true
        }
        
        
        scrollView1.contentSize = CGSize(width: 7 * scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.delegate = self
        pageControl.currentPage = 0
        pageControl.numberOfPages = 7
        scrollView1.isUserInteractionEnabled = true
        scrollView1.showsHorizontalScrollIndicator = false
        
        
        let imageView = UIImageView(image: UIImage(named: "1"))
        scrollView2.addSubview(imageView)
        scrollView2.contentSize = imageView.bounds.size
        scrollView2.minimumZoomScale = 0.1
        scrollView2.maximumZoomScale = 5
        scrollView2.delegate = self
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView1.contentOffset.x / scrollView1.bounds.width)
    }
    
    
    @IBAction func pageControlClicked(_ sender: UIPageControl) {
        let rect = CGRect(x: CGFloat(pageControl.currentPage) * scrollView1.bounds.width, y: 0, width: scrollView1.bounds.width, height: scrollView1.bounds.height)
        scrollView1.scrollRectToVisible(rect, animated: true)
        
    }
    
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return scrollView2.subviews.first
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

