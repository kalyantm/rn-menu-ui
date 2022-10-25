
/**
 * This code was generated by [react-native-codegen](https://www.npmjs.com/package/react-native-codegen).
 *
 * Do not edit this file as changes may cause incorrect behavior and will be lost
 * once the code is regenerated.
 *
 * @generated by codegen project: GenerateEventEmitterCpp.js
 */

#include <react/renderer/components/RNMenuSpecs/EventEmitters.h>

namespace facebook {
namespace react {

void RNMenuEventEmitter::onPressAction(OnPressAction event) const {
  dispatchEvent("pressAction", [event=std::move(event)](jsi::Runtime &runtime) {
    auto payload = jsi::Object(runtime);
    payload.setProperty(runtime, "identifier", event.identifier);
    return payload;
  });
}

} // namespace react
} // namespace facebook