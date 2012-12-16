//
//  ExternalScanController.h
//  Eumetsat
//
//  Created by Sebastian Kruschwitz on 29.09.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Implement this protocol to receive the data.
 */
@protocol ExternalScanControllerDelegate <NSObject>

/**
 Barcode was scanned successfully.
 @param content Scanned string
 */
-(void)didScanContent:(NSString*)content;

@end


/**
 Controller to handle the support for an external barcode scanner (HID device).
 */
@interface ExternalScanController : NSObject <UITextFieldDelegate>

@property(nonatomic, weak) id<ExternalScanControllerDelegate> delegate;

/**
 Initialize the class and set the visible UIView from the calling class.
 @param holder UIView from the caller
 */
-(id)initWithParentView:(UIView*)holder;

-(void)becomeFirstResponder;

-(void)resignFirstResponder;

-(void)removeExternalSupport;

@end
