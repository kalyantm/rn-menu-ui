package com.rnmenu;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableMap;
import androidx.annotation.Nullable;
import android.content.Context;
import android.util.AttributeSet;
import android.graphics.Color;

import android.widget.PopupMenu;
import android.view.MenuItem;
import android.widget.TextView;
import android.view.Gravity;

import android.widget.FrameLayout;
import android.view.ContextMenu;
import android.widget.Button;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.Toast;

import java.util.ArrayList;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.uimanager.events.RCTEventEmitter;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.ReactContext;

public class RNMenu extends FrameLayout {
    private String title = "";
    private ReadableArray actions = null;
    public void setTitle(@Nullable String title) {
        this.title = title;
    }
    public void setActions(@Nullable ReadableArray actions) {
        this.actions = actions;
    }
    private void onItemSelect(MenuItem menuItem) {
        WritableMap event = Arguments.createMap();
        Integer id = Integer.parseInt(String.valueOf(menuItem.getItemId()));
        String itemId = actions.getMap(id).getString("id");
        event.putString("id", itemId);
        ReactContext reactContext = (ReactContext)getContext();
        reactContext
          .getJSModule(RCTEventEmitter.class)
          .receiveEvent(getId(), "onItemClick", event);
    }

    public RNMenu(Context context) {
        super(context);
        this.configureComponent(context);
    }

    public RNMenu(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        this.configureComponent(context);
    }

    public RNMenu(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.configureComponent(context);
    }

    private void configureComponent(Context context) {
        Button menuButton = new Button(context);
        menuButton.setBackgroundResource(0);
        menuButton.setOnClickListener(new View.OnClickListener() {
          @Override
          public void onClick(View v) {
            PopupMenu menu = new PopupMenu(context, menuButton);
            for (int i=0; i<actions.size(); i++) {
                String t = actions.getMap(i).getString("title");
                menu.getMenu().add(0, i, i, t);
            }
            menu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
                @Override
                public boolean onMenuItemClick(MenuItem menuItem) {
                    onItemSelect(menuItem);
                    return true;
                }
            });
            menu.show();
          }
        });
        this.addView(menuButton);
    }
}