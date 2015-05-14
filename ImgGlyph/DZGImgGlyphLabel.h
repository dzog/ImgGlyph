//
//  DZGImgGlyphLabel.m
//  ImgGlyph v1.0
//
//  Inline image-sourced text-sized glyphs.  Using new iOS 7 TextKit APIs.
//
//  Created by dzog on 1/11/14.
//  Copyright (c) 2014 dzog. All rights reserved.
//
//  http://dzog.io
//

#import <UIKit/UIKit.h>

@interface DZGImgGlyphLabel : UILabel

@property NSDictionary *imgMap; //map of string -> image name
@property NSString *imgMapString; //for setting in IB; form of {"%q","square.png", "[circle]","circle.png"}
@property (nonatomic, assign) CGFloat imgXOffset;
@property (nonatomic, assign) CGFloat imgYOffset;

@end
