#import <React/RCTLog.h>
#import <React/RCTUIManager.h>
#import <React/RCTViewManager.h>

@interface RNMenuManager : RCTViewManager

@end

@implementation RNMenuManager

RCT_EXPORT_MODULE(RNMenu)

RCT_EXPORT_VIEW_PROPERTY(text, NSString)
RCT_EXPORT_VIEW_PROPERTY(title, NSString)
RCT_EXPORT_VIEW_PROPERTY(actions, NSArray)
RCT_EXPORT_VIEW_PROPERTY(onPressAction, RCTDirectEventBlock);
@end