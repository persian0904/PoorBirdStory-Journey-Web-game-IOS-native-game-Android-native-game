package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Canvas;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.Switch;

import androidx.annotation.Dimension;

public class GameView extends View {

    public int screenWidth;
    public int screenHeight;

    //backgound Object
    public Background background = new Background();
    //live Object
    public Live live = new Live();
    //score Object
    public Score score = new Score();
    // tunnel Object
    public Tunnel tunnel = new Tunnel();
    // base Object
    public Base base = new Base();
    // bird Object
    public Bird bird = new Bird();
    // information Object
    private Information information = new Information();
    // flag
    public boolean birdDeath = false;
    public boolean gameStarted = false;
    public boolean touch_flg = false;
    public boolean gameRestart = false;
    public boolean gameOver = false;
    public boolean gameWait = false;

    public int liveCnt = 3;
    public int scoring = 0;
    private Context currContext;
    public int gameWaitSecond = 3;
//    public int score = 0;

    public GameView(Context context) {
        super(context);
        currContext = context;
        this.init(context);
    }

    private void init(Context context) {
        background.init(context, this);
        live.init(context, this);
        tunnel.init(context, this);
        base.init(context, this);
        score.init(context, this);
        bird.init(context, this);
        information.init(context,this);
    }

    private void update(Canvas canvas) {
        background.update(canvas);
        live.update(canvas);
        tunnel.update(canvas);
        base.update(canvas);
        score.update(canvas);
        bird.update(canvas);
        information.update(canvas);
    }

    private void drawing(Canvas canvas) {
        background.drawing(canvas);
        live.drawing(canvas);
        tunnel.drawing(canvas);
        base.drawing(canvas);
        score.drawing(canvas);
        bird.drawing(canvas);
        information.drawing(canvas);
    }

    private void setPreFix() {
        background.setPrefix();
        live.setPrefix();
        tunnel.setPrefix();
        base.setPrefix();
        score.setPrefix();
        bird.setPrefix();
        information.setPrefix();
    }

    @Override
    protected void onSizeChanged(int targetWidth, int targetHieght, int sourceWidth, int sourceHieght) {
        this.screenWidth = targetWidth;
        this.screenHeight = targetHieght;
        this.setPreFix();
    }

    @Override
    protected void onDraw(Canvas canvas) {
        this.update(canvas);
        this.drawing(canvas);
    }

    @Override
    public boolean onTouchEvent(MotionEvent event) {
        if (birdDeath) {
            Log.e("birdDeatch click","choi lai");
            touch_flg = false;
            gameStarted = false;
            birdDeath = false;
            if(gameOver){
                liveCnt = 3;
                scoring = 0;
                gameOver = false;
                gameRestart = false;
            }else{
                gameRestart = true;
            }
            this.setPreFix();
        } else {
            if (event.getAction() == MotionEvent.ACTION_DOWN) {
                touch_flg = true;
                gameStarted = true;
                gameRestart = false;
                gameOver = false;
                bird.flapp();
            }
        }
        return true;
    }
}

