#import "RNMenu.h"

#import <react/renderer/components/RNMenuSpecs/ComponentDescriptors.h>
#import <react/renderer/components/RNMenuSpecs/EventEmitters.h>
#import <react/renderer/components/RNMenuSpecs/Props.h>
#import <react/renderer/components/RNMenuSpecs/RCTComponentViewHelpers.h>

#import "RCTFabricComponentsPlugins.h"

using namespace facebook::react;

@interface RNMenu () <RCTRNMenuViewProtocol>
@end

@implementation RNMenu {
  UIView *_view;
  NSMutableArray *_actions;
  UIMenu *_menu;
  UIButton *_button;
}

-(void)notifyPressAction:(NSString*)identifier
{
    if (_eventEmitter != nullptr) {
      
      std::dynamic_pointer_cast<const facebook::react::RNMenuEventEmitter>(_eventEmitter)
          ->onPressAction(facebook::react::RNMenuEventEmitter::OnPressAction{.id = std::string([identifier UTF8String])});
    }
}
+ (ComponentDescriptorProvider)componentDescriptorProvider
{
  return concreteComponentDescriptorProvider<RNMenuComponentDescriptor>();
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    static const auto defaultProps = std::make_shared<const RNMenuProps>();
    _props = defaultProps;
//    _view = [[UIView alloc] init];
    _actions = [[NSMutableArray alloc] init];
    _button = [[UIButton alloc] init];
    _button.showsMenuAsPrimaryAction = YES;
//     [_view addSubview:_button];
     self.contentView = _button;
  }

  return self;

}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<RNMenuProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<RNMenuProps const>(props);

    if (oldViewProps.actions.size() != newViewProps.actions.size()) {
    // Init/update
    [_actions removeAllObjects];
    for (auto act : newViewProps.actions) {
      id newActionId = [NSString stringWithUTF8String:act.id.c_str()];
      id newActionTitle = [NSString stringWithUTF8String:act.title.c_str()];
      id newActionImage = [NSString stringWithUTF8String:act.image.c_str()];
      [_actions addObject:[UIAction actionWithTitle:newActionTitle image:[UIImage systemImageNamed:newActionImage] identifier:newActionId handler:^(__kindof UIAction* _Nonnull action) {
          [self notifyPressAction:newActionId];
        }
      ]];
        }
    } else {
        // Update
        for (int i=0; i<newViewProps.actions.size(); i++) {
            if (oldViewProps.actions[i].id != newViewProps.actions[i].id || oldViewProps.actions[i].title != newViewProps.actions[i].title || oldViewProps.actions[i].image != newViewProps.actions[i].image) {
                id newActionId = [NSString stringWithUTF8String:newViewProps.actions[i].id.c_str()];
                id newActionTitle = [NSString stringWithUTF8String:newViewProps.actions[i].title.c_str()];
                id newActionImage = [NSString stringWithUTF8String:newViewProps.actions[i].image.c_str()];
                [_actions replaceObjectAtIndex:i withObject:[UIAction actionWithTitle:newActionTitle image:[UIImage systemImageNamed:newActionImage] identifier:newActionId handler:^(__kindof UIAction* _Nonnull action) {
                    [self notifyPressAction:newActionId];
                }
               ]];
            }
        }
    }
    
      
    _menu = [UIMenu menuWithTitle:@"" children:_actions];
    _button.menu = _menu;

  [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> RNMenuCls(void)
{
  return RNMenu.class;
}

