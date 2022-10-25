package com.rnmenu;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.module.annotations.ReactModule;
import com.facebook.react.uimanager.SimpleViewManager;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewManagerDelegate;
import com.facebook.react.uimanager.annotations.ReactProp;
import com.facebook.react.viewmanagers.RNMenuManagerInterface;
import com.facebook.react.viewmanagers.RNMenuManagerDelegate;


@ReactModule(name = RNMenuManager.NAME)
public class RNMenuManager extends SimpleViewManager<RNMenu>
        implements RNMenuManagerInterface<RNMenu> {

    private final ViewManagerDelegate<RNMenu> mDelegate;

    static final String NAME = "RNMenu";

    public RNMenuManager(ReactApplicationContext context) {
        mDelegate = new RNMenuManagerDelegate<>(this);
    }

    @Nullable
    @Override
    protected ViewManagerDelegate<RNMenu> getDelegate() {
        return mDelegate;
    }

    @NonNull
    @Override
    public String getName() {
        return RNMenuManager.NAME;
    }

    @NonNull
    @Override
    protected RNMenu createViewInstance(@NonNull ThemedReactContext context) {
        return new RNMenu(context);
    }

    @Override
    @ReactProp(name = "text")
    public void setText(RNMenu view, @Nullable String text) {
        // view.setText(text);
    }

    @Override
    @ReactProp(name = "title")
    public void setTitle(RNMenu view, @Nullable String title) {
        // view.setTitle(title);
    }

    @Override
    @ReactProp(name = "actions")
    public void setActions(RNMenu view, @Nullable ReadableArray actions) {
        // view.setActions(actions);
    }
}