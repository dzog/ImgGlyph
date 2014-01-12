//
//  DZGImgGlyphTextView.h
//  ImgGlyph v1.0
//
//  Inline image-sourced font-sized glyphs.  Using new iOS 7 TextKit APIs.
//
//  Created by dzog on 1/12/14.
//  Copyright (c) 2014 dzog. All rights reserved.
//
//  http://dzog.io
//

#import <UIKit/UIKit.h>

@interface DZGImgGlyphTextView : UITextView

@property NSDictionary *imgMap; //map of string -> image name
@property NSString *imgMapString; //for setting in IB; form of {"%q","square.png", "[circle]","circle.png"}

@end
