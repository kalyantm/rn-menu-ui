package com.rnmenu;

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

import android.widget.Toast;

public class RNMenu extends FrameLayout {
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
        this.setBackgroundColor(Color.parseColor("#FFFFFF"));
        Button menuButton = new Button(context);
        menuButton.setOnClickListener(new View.OnClickListener() {
          @Override
          public void onClick(View v) {
            PopupMenu menu = new PopupMenu(context, menuButton);
            menu.getMenu().add("Add");
            menu.setOnMenuItemClickListener(new PopupMenu.OnMenuItemClickListener() {
                @Override
                public boolean onMenuItemClick(MenuItem menuItem) {
                    Toast.makeText(context, "You clicked " + menuItem.getTitle(), Toast.LENGTH_SHORT).show();
                    return true;
                }
            });
            menu.show();
          }
        });
        this.addView(menuButton);
    }
}