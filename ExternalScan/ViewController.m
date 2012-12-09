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

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self addExternalScanSupport];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addExternalScanSupport) name:UIApplicationDidBecomeActiveNotification object:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];
    
    [_scanController removeExternalSupport];
    _scanController.delegate = nil;
    self.scanController = nil;
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
    [_scanController removeExternalSupport];
    
    self.scanController.delegate = nil;
    self.scanController = nil;
    
    ExternalScanController *exController = [[ExternalScanController alloc]initWithParentView:self.view];
    exController.delegate = self;
    self.scanController = exController;
    [self.scanController becomeFirstResponder];
}


#pragma mark - ExternalScanControllerDelegate

-(void)didScanContent:(NSString*)content {
    NSLog(@"content: %@", content);
    _textField.text = content;
}


@end
