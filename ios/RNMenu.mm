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
          ->onPressAction(facebook::react::RNMenuEventEmitter::OnPressAction{.identifier = std::string([identifier UTF8String])});
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
    _view = [[UIView alloc] init];
    _view.backgroundColor = [UIColor redColor];
     _actions = [[NSMutableArray alloc] init];
      _button = [[UIButton alloc] init];
      [_button setTitle:@"Initial Title" forState:UIControlStateNormal];
      _button.backgroundColor = [UIColor blackColor];
      [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
      [_button sizeToFit];
      _button.showsMenuAsPrimaryAction = YES;
      [_view addSubview:_button];
      
    self.contentView = _view;
  }

  return self;

}

- (void)updateProps:(Props::Shared const &)props oldProps:(Props::Shared const &)oldProps
{
  const auto &oldViewProps = *std::static_pointer_cast<RNMenuProps const>(_props);
  const auto &newViewProps = *std::static_pointer_cast<RNMenuProps const>(props);

  if (oldViewProps.title != newViewProps.title) {
      [_button setTitle:[[NSString alloc] initWithCString:newViewProps.title.c_str() encoding:NSASCIIStringEncoding] forState:UIControlStateNormal];
  }

  if (oldViewProps.actions != newViewProps.actions) {
    for (auto act : newViewProps.actions) {
      id newAction = [NSString stringWithUTF8String:act.c_str()];
        [_actions addObject:[UIAction actionWithTitle:newAction image:nil identifier:newAction handler:^(__kindof UIAction* _Nonnull action) {[self notifyPressAction:newAction];}]];
      }
      
      for (int i=0; i<[_actions count]; i++) {
          NSLog(@"action:::%@", [_actions objectAtIndex:i]);
      }
      
      _menu = [UIMenu menuWithTitle:@"" children:_actions];
      _button.menu = _menu;
      
    }

  [super updateProps:props oldProps:oldProps];
}

@end

Class<RCTComponentViewProtocol> RNMenuCls(void)
{
  return RNMenu.class;
}
