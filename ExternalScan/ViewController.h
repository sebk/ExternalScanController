//
//  ViewController.h
//  ExternalScan
//
//  Created by Sebastian Kruschwitz on 03.11.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExternalScanController.h"

@interface ViewController : UIViewController <ExternalScanControllerDelegate>

@property(nonatomic, strong) ExternalScanController *scanController;

@property(nonatomic, weak) IBOutlet UITextField *textField;

@end
