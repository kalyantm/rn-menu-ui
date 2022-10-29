import type { ViewProps } from 'ViewPropTypes';
import type { HostComponent } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';
import { BubblingEventHandler, WithDefault } from 'react-native/Libraries/Types/CodegenTypes';

type Action = Readonly<{
  id: string;
  title: string;
  image?: string;
  // TODO: Add subactions here
}>;

type Event = Readonly<{id: string}>;

export interface NativeProps extends ViewProps {
  title: string;
  onPressAction: BubblingEventHandler<Event>;
  actions: ReadonlyArray<Action>;
}

export default codegenNativeComponent<NativeProps>(
  'RNMenu'
) as HostComponent<NativeProps>;