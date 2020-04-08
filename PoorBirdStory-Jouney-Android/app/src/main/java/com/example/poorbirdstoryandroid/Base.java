package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Rect;

public class Base {
    private GameView gameView;
    private Bitmap baseImage;

    private int leftbaseImage;
    private int rightbaseImage;
    private int topbaseImage;

    private int leftbaseImage2;
    private int rightbaseImage2;
    private int topbaseImage2;

    public int baseHeight;
    private int baseImageSpeed = 10;

    private int canvasWidth;
    private int canvasHeight;

    public Base() {
    }

    public void init(Context context, GameView gameView) {
        this.gameView = gameView;
        baseImage = BitmapFactory.decodeResource(context.getResources(), R.drawable.base);
        baseHeight = baseImage.getHeight();
    }

    public void setPrefix(){
        canvasWidth = gameView.screenWidth;
        canvasHeight = gameView.screenHeight;
        topbaseImage = canvasHeight - baseHeight;
        topbaseImage2 = topbaseImage;
    }

    public void update(Canvas canvas) {
        leftbaseImage -= baseImageSpeed;
        rightbaseImage = leftbaseImage + canvasWidth;
        leftbaseImage2 = leftbaseImage + canvasWidth;
        rightbaseImage2 = leftbaseImage2 + canvasWidth;
        if (leftbaseImage <= -canvasWidth) {
            leftbaseImage = 0;
        }
    }

    public void drawing(Canvas canvas) {
        //base 1
        Rect baseRectangle = new Rect(leftbaseImage, topbaseImage, rightbaseImage, canvasHeight);
        canvas.drawBitmap(baseImage, null, baseRectangle, null);
        // base 2
        Rect baseRectangle2 = new Rect(leftbaseImage2, topbaseImage2, rightbaseImage2, canvasHeight);
        canvas.drawBitmap(baseImage, null, baseRectangle2, null);
    }
}
