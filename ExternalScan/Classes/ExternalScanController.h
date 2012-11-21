//
//  ExternalScanController.h
//  Eumetsat
//
//  Created by Sebastian Kruschwitz on 29.09.12.
//  Copyright (c) 2012 Sebastian Kruschwitz. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ExternalScanControllerDelegate <NSObject>

-(void)didScanContent:(NSString*)content;

@end


@interface ExternalScanController : NSObject <UITextFieldDelegate>

@property(nonatomic, weak) id<ExternalScanControllerDelegate> delegate;

-(id)initWithParentView:(UIView*)holder;

-(void)becomeFirstResponder;

-(void)resignFirstResponder;

-(void)removeExternalSupport;

@end
