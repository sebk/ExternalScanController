//
//  ExternalScanController.m
//  Eumetsat
//
//  Created by Sebastian Kruschwitz on 29.09.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import "ExternalScanController.h"


@interface ExternalScanController ()

@property(nonatomic, strong) UITextField *hiddenTextField;

@property(nonatomic, weak) UIView *holderView;

@end


@implementation ExternalScanController

@synthesize hiddenTextField = _hiddenTextField;
@synthesize holderView = _holderView;

-(id)initWithParentView:(UIView*)holder {
    if (self = [super init]) {
        _hiddenTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 1, 1)];
        _hiddenTextField.delegate = self;
        [_hiddenTextField setInputView:[[UIView alloc]init]];
        _hiddenTextField.hidden = YES;
        [holder addSubview:_hiddenTextField];
        
        //[_hiddenTextField becomeFirstResponder];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidDisappear:) name:UIKeyboardDidHideNotification object:nil];
        
        _holderView = holder;
    }
    
    return self;
}

-(void)becomeFirstResponder {
    if (_hiddenTextField && ![_hiddenTextField isFirstResponder]) {
        [_hiddenTextField becomeFirstResponder];
    }
}

-(void)keyboardDidDisappear:(NSNotification*)notification {
    [self becomeFirstResponder];
}


#pragma mark - UITextFieldDelegate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == _hiddenTextField) {
        [_delegate didScanContent:_hiddenTextField.text];
        _hiddenTextField.text = @"";
    }
    return YES;
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
}

@end
