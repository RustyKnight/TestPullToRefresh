//
//  ViewController.swift
//  TestPullToRefresh
//
//  Created by Shane Whitehead on 28/11/18.
//  Copyright © 2018 Kaizen Enteripises. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var refreshView: RefreshView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    refreshView.startAnimating()
  }


}

