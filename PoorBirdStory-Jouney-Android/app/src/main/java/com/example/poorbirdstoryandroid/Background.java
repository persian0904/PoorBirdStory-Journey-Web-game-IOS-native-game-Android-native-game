package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.Log;

public class Background {
    private GameView gameView;
    private Bitmap bgImage;
    private int leftBgImage;
    private int rightBgImage;
    private int leftBgImage2;
    private int rightBgImage2;
    private int bgImageSpeed = 7;

    private int canvasWidth;
    private int canvasHeight;

    public Background() {
    }

    public void init(Context context, GameView gameView) {
        this.gameView = gameView;
        bgImage = BitmapFactory.decodeResource(context.getResources(), R.drawable.background);
    }

    public void setPrefix(){
        canvasWidth = gameView.screenWidth;
        canvasHeight = gameView.screenHeight;
    }

    public void update(Canvas canvas) {
        leftBgImage -= bgImageSpeed;
        if (leftBgImage <= -canvasWidth) {
            leftBgImage = 0;
        }
        rightBgImage = leftBgImage + canvasWidth;
        leftBgImage2 = leftBgImage + canvasWidth;
        rightBgImage2 = leftBgImage2 + canvasWidth;
    }

    public void drawing(Canvas canvas) {
        //backgroune 1
        Rect backgroundRectangle = new Rect(leftBgImage, 0, rightBgImage, canvasHeight);
        canvas.drawBitmap(bgImage, null, backgroundRectangle, null);
        // background 2
        Rect backgroundRectangle2 = new Rect(leftBgImage2, 0, rightBgImage2, canvasHeight);
        canvas.drawBitmap(bgImage, null, backgroundRectangle2, null);
    }
}
