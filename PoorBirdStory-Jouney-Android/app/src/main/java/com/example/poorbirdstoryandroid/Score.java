package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.util.Log;

public class Score {
    GameView gameView;

    private Paint scorePain = new Paint();
//    public int score;
    private boolean scoreFlg = true;

    private int canvasWidth;
    private int canvasHeight;
    int scorePosX;
    int scorePosY;

    public Score() {

    }

    public void init(Context context, GameView gameView) {
        this.gameView = gameView;
        //Score text
        scorePain.setColor(Color.YELLOW);
        scorePain.setTextSize(50);
        scorePain.setTypeface(Typeface.DEFAULT);
        scorePain.setAntiAlias(true);
    }

    public void setPrefix() {
        canvasWidth = gameView.screenWidth;
        canvasHeight = gameView.screenHeight;
        scoreFlg = true;
    }

    public void update(Canvas canvas) {
        if(!gameView.gameStarted){
            return;
        }
        if (gameView.tunnel.tunnelAboveXright <= gameView.bird.birdX) {
            if (scoreFlg) {
                scoreFlg = false;
                gameView.scoring++;
            }
        } else {
            if (!scoreFlg) {
                scoreFlg = true;
            }
        }
    }

    public void drawing(Canvas canvas) {
        scorePosX = canvasWidth / 2;
        scorePosY = 10 - (int) ((scorePain.descent() + scorePain.ascent()));
        canvas.drawText(String.valueOf(gameView.scoring), scorePosX, scorePosY, scorePain);
    }

}
