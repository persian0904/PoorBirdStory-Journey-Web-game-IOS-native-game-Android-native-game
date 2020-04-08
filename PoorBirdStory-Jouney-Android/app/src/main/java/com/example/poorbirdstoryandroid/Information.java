package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;

public class Information {
    GameView gameView;

    private Paint textPain = new Paint();

    private int canvasWidth;
    private int canvasHeight;

    int textPosX;
    int textPosY;

    String text = "The Story Of a Poor Bird";

    public Information() {

    }

    public void init(Context context, GameView gameView) {
        this.gameView = gameView;
        //text
        textPain.setColor(Color.YELLOW);
        textPain.setTextSize(50);
        textPain.setTypeface(Typeface.DEFAULT);
        textPain.setAntiAlias(true);
    }

    public void setPrefix() {
        canvasWidth = gameView.screenWidth;
        canvasHeight = gameView.screenHeight;
        textPosX = gameView.bird.birdX/2;
        textPosY = gameView.bird.birdY + (4 * (int) textPain.getTextSize());

        if(!gameView.gameStarted){
            text = "The Story Of a Poor Bird";
        } else {
            text = "Tap to continue";
        }
    }

    public void update(Canvas canvas) {
        if(gameView.birdDeath){
            text = "Tap to continue";
        }
    }

    public void drawing(Canvas canvas) {
        if(gameView.gameStarted && !gameView.birdDeath){
            return;
        }

        canvas.drawText(String.valueOf(text), textPosX, textPosY, textPain);

    }

}
