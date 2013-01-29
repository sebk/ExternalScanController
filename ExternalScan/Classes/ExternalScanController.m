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
        _hiddenTextField.tag = 1000;
        [_hiddenTextField setInputView:[[UIView alloc]init]];
        _hiddenTextField.hidden = YES;
        _hiddenTextField.clearsOnBeginEditing = NO;
        _hiddenTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        [holder addSubview:_hiddenTextField];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidDisappear:) name:UIKeyboardDidHideNotification object:nil];
        
        _holderView = holder;
    }
    
    return self;
}

-(void)removeExternalSupport {
    [_hiddenTextField removeFromSuperview];
    _hiddenTextField = nil;
}

-(void)becomeFirstResponder {
    if (_hiddenTextField && ![_hiddenTextField isFirstResponder]) {
        [_hiddenTextField becomeFirstResponder];
    }
}

-(void)resignFirstResponder {
    if (_hiddenTextField && [_hiddenTextField isFirstResponder]) {
        [_hiddenTextField resignFirstResponder];
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
