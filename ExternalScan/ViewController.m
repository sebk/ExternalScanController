//
//  ViewController.m
//  ExternalScan
//
//  Created by Sebastian Kruschwitz on 03.11.12.
//  Copyright (c) 2012 Gobas. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	[self addExternalScanSupport];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate {
    return YES;
}

-(void)addExternalScanSupport {
    self.scanController.delegate = nil;
    self.scanController = nil;
    
    ExternalScanController *exController = [[ExternalScanController alloc]initWithParentView:self.view];
    exController.delegate = self;
    self.scanController = exController;
}


#pragma mark - ExternalScanControllerDelegate

-(void)didScanContent:(NSString*)content {
    NSLog(@"content: %@", content);
    _textField.text = content;
}


@end
