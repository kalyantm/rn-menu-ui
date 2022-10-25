import type { ViewProps } from 'ViewPropTypes';
import type { HostComponent } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import { BubblingEventHandler } from 'react-native/Libraries/Types/CodegenTypes';

// type Action = Readonly<{
//   identifier: string;
//   title: string;
// }>;

type Event = Readonly<{identifier: string}>;

export interface NativeProps extends ViewProps {
  text?: string;
  title?: string;
  onPressAction?: BubblingEventHandler<Event>;
  actions?: ReadonlyArray<string>;
}

export default codegenNativeComponent<NativeProps>(
  'RNMenu'
) as HostComponent<NativeProps>;