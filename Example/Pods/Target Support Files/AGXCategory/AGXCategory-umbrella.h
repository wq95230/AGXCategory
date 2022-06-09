#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "AGCategory.h"
#import "NSDate+Tool.h"
#import "NSString+Predicate.h"
#import "UIButton+AG.h"
#import "UITextView+AGPlaceholder.h"
#import "UIView+AG.h"

FOUNDATION_EXPORT double AGXCategoryVersionNumber;
FOUNDATION_EXPORT const unsigned char AGXCategoryVersionString[];

