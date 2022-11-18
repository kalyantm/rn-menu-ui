# rn-menu-ui


A fabric native MenuUI component for iOS 13+ and PopupMenu component for Android


# Installation

```
npm install @react-native-menu/menu
```

# Usage

```
import Menu from 'rn-menu-ui';

<Menu title="Menu Title" actions={[{id: 'create', title: 'Create', image: 'create'}, {id: 'edit', title: 'Edit'}, {id: delete, title: 'Delete'}]} />

```

# Props

```
title: string;
actions: Array<{id: string; title: string; image?: string}> // Only images included in SF Symbol (iOS) and resources drawables (android)
onPressAction: (selectedId: string) => void;
```


# TODO
-[] Add types \
-[] Add support for `subactions` \ 
-[] Tests \ 
