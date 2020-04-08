package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.util.Log;

public class Live {

    GameView gameView;
    private Bitmap life;

//    private int liveX = 200;
//    private int liveY = 200;
    private int lifeHeight;

    private int canvasWidth;
    private int canvasHeight;


    public Live() {

    }

    public void init(Context context, GameView gameView) {
        this.gameView = gameView;
        life = BitmapFactory.decodeResource(context.getResources(), R.drawable.live);
        lifeHeight = life.getHeight();
    }

    public void setPrefix() {
        canvasWidth = gameView.screenWidth;
        canvasHeight = gameView.screenHeight;
    }

    public void update(Canvas canvas) {

    }

    public void drawing(Canvas canvas) {

        for (int i = 0; i < gameView.liveCnt; i++) {
            canvas.drawBitmap(life, 10 + i * 40, 10, null);
        }
    }

}
