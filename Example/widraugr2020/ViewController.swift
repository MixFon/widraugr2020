//
//  ViewController.swift
//  widraugr2020
//
//  Created by MixFon on 12/03/2020.
//  Copyright (c) 2020 MixFon. All rights reserved.
//

import UIKit
import CoreData
import widraugr2020

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let articleManager = ArticleManager()
        let articles = articleManager.getAllArticles()
        if (articles.isEmpty) {
            print("article is empty")
        }else {
            for article in articles {
                print(article)
            }
        }
        //let newArticle = articleManager.newArticle()
        //print(newArticle)


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

