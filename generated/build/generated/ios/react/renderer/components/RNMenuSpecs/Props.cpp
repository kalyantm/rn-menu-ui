
/**
 * This code was generated by [react-native-codegen](https://www.npmjs.com/package/react-native-codegen).
 *
 * Do not edit this file as changes may cause incorrect behavior and will be lost
 * once the code is regenerated.
 *
 * @generated by codegen project: GeneratePropsCpp.js
 */

#include <react/renderer/components/RNMenuSpecs/Props.h>
#include <react/renderer/core/PropsParserContext.h>
#include <react/renderer/core/propsConversions.h>

namespace facebook {
namespace react {

RNMenuProps::RNMenuProps(
    const PropsParserContext &context,
    const RNMenuProps &sourceProps,
    const RawProps &rawProps): ViewProps(context, sourceProps, rawProps),

    text(convertRawProp(context, rawProps, "text", sourceProps.text, {})),
    title(convertRawProp(context, rawProps, "title", sourceProps.title, {})),
    actions(convertRawProp(context, rawProps, "actions", sourceProps.actions, {}))
      {}

} // namespace react
} // namespace facebook
