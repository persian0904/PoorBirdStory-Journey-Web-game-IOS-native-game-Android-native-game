package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.util.Log;

public class Bird {

    GameView gameView;
    private Bitmap birdImg[] = new Bitmap[3];
    private int currBirdIndex;
    //private Bitmap bird[] = new Bitmap[3];
    public int birdX;
    public int birdY;
    private int birdSpeed;
    private int birdacceleration;

    private int birdWidth;
    private int birdHeight;

    private int birdMinY;
    private int birdMaxY;

    private int canvasWidth;
    private int canvasHeight;

    private int frame;

    public Rect birdRectangle;

    public Bird() {

    }

    public void init(Context context, GameView gameView) {
        this.gameView = gameView;
        birdImg[0] = BitmapFactory.decodeResource(context.getResources(), R.drawable.bird1);
        birdImg[1] = BitmapFactory.decodeResource(context.getResources(), R.drawable.bird2);
        birdImg[2] = BitmapFactory.decodeResource(context.getResources(), R.drawable.bird3);
        birdWidth = birdImg[0].getWidth()*2;
        birdHeight = birdImg[0].getHeight()*2;
        currBirdIndex = 0;
        frame = 0;
    }

    public void setPrefix() {
        canvasWidth = gameView.screenWidth;
        canvasHeight = gameView.screenHeight;
        birdMaxY = canvasHeight - gameView.base.baseHeight - birdHeight;
        birdMinY = 0;
        birdX = 200;
        birdY = 200;
        birdSpeed = 0;
        birdacceleration = 2;
        currBirdIndex = 0;
        frame = 0;
    }

    public void update(Canvas canvas) {
        //change bird image
        birdImgChange();
        if (gameView.birdDeath) {
            return;
        }
        if (!gameView.gameStarted) {
            return;
        }
        //change bird position
        birdImgMove();

        //check hit
        if (birdHit()) {
            gameView.birdDeath = true;
            gameView.liveCnt = gameView.liveCnt - 1;
            currBirdIndex = 2;
            if (gameView.liveCnt < 1) {
                gameView.gameOver = true;
            }else {
                gameView.gameRestart = true;
            }
        }

    }

    private boolean birdHit() {
        if(gameView.birdDeath){
            return true;
        }
        //Top limited
        if (birdY <= birdMinY) {
            birdY = birdMinY;
            return true;
        }
        //bottom limited
        if (birdY >= birdMaxY) {
            birdY = birdMaxY;
            return true;
        }
        //hit tunnel
        if (birdRectangle.intersect(gameView.tunnel.tunnelRectangleAbove) ||
                birdRectangle.intersect(gameView.tunnel.tunnelRectangleBottom)) {
            return true;
        }
        return false;
    }

    private void birdImgMove() {
        if(gameView.birdDeath) {
            return;
        }
        birdSpeed += birdacceleration;
        birdY += birdSpeed;
    }

    private void birdImgChange() {
        if(gameView.birdDeath) {
            return;
        }
        frame += 1;
        if (frame == 7) {
            frame = 0;
            if (currBirdIndex == 0) {
                currBirdIndex = 1;
            } else {
                currBirdIndex = 0;
            }
        }
    }

    public void drawing(Canvas canvas) {
        birdRectangle = new Rect(birdX, birdY, birdX + birdWidth, birdY + birdHeight);
        canvas.drawBitmap(birdImg[currBirdIndex], null, birdRectangle, null);
//        canvas.drawBitmap(birdImg[currBirdIndex], birdX, birdY, null);
    }

    public void flapp() {
        birdSpeed = -25;
    }
}
