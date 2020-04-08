package com.example.poorbirdstoryandroid;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;

public class Tunnel {
    private GameView gameView;

    int above = 0;
    int bottom = 1;

    private Bitmap tunnelImage[] = new Bitmap[2];

    private int tunnelX;
    private int tunnelY;
    private int maxTunnelY;
    private int minTunnelY;

    private int tunnelSpeed;
    private int tunnelRange;

    private int tunnelWidth;
    private int tunnelHeight;

    private int tunnelAboveXleft;
    private int tunnelAboveYtop;
    public int tunnelAboveXright;
    private int tunnelAboveYbottom;

    private int tunnelBottomXleft;
    private int tunnelBottomYtop;
    private int tunnelBottomXright;
    private int tunnelBottomYbottom;

    private Paint tunnelPaint = new Paint();

    private int canvasWidth;
    private int canvasHeight;

    public Rect tunnelRectangleAbove;
    public Rect tunnelRectangleBottom;

    public Tunnel() {
    }

    public void init(Context context, GameView gameView) {
        this.gameView = gameView;
        tunnelImage[above] = BitmapFactory.decodeResource(context.getResources(), R.drawable.pipe_above);
        tunnelImage[bottom] = BitmapFactory.decodeResource(context.getResources(), R.drawable.pipe_bottom);
    }

    public void setPrefix() {
        canvasWidth = gameView.screenWidth;
        canvasHeight = gameView.screenHeight;

        tunnelSpeed = 10;
        tunnelRange = 230;

        above = 0;
        bottom = 1;

        tunnelX = -2*canvasWidth;

        tunnelWidth = (int) (tunnelImage[above].getWidth() * 0.3);
        tunnelHeight = (int) (tunnelImage[above].getHeight() * 0.3);

        minTunnelY = 0 - tunnelHeight + tunnelRange;
        maxTunnelY = canvasHeight - gameView.base.baseHeight - tunnelRange - tunnelRange - tunnelHeight;
    }

    public void update(Canvas canvas) {
        if (gameView.birdDeath) {
            return;
        }

        if (!gameView.gameStarted) {
            tunnelAboveXleft = canvasWidth;
            tunnelAboveYtop = tunnelY;
            tunnelAboveXright = tunnelAboveXleft + tunnelWidth;
            tunnelAboveYbottom = tunnelAboveYtop + tunnelHeight;
            //tunnel bottom position
            tunnelBottomXleft = tunnelAboveXleft;
            tunnelBottomYtop = tunnelAboveYtop + tunnelHeight + tunnelRange;
            tunnelBottomXright = tunnelAboveXright;
            tunnelBottomYbottom = tunnelBottomYtop + tunnelHeight;
            return;
        }

        tunnelX -= tunnelSpeed;
        if (tunnelX < 0 - tunnelWidth) {
            tunnelX = canvasWidth + 20;
            tunnelY = (int) Math.floor(Math.random() * (maxTunnelY - minTunnelY) + minTunnelY);
        }
        //tunnel above position
        tunnelAboveXleft = tunnelX;
        tunnelAboveYtop = tunnelY;
        tunnelAboveXright = tunnelAboveXleft + tunnelWidth;
        tunnelAboveYbottom = tunnelAboveYtop + tunnelHeight;
        //tunnel bottom position
        tunnelBottomXleft = tunnelAboveXleft;
        tunnelBottomYtop = tunnelAboveYtop + tunnelHeight + tunnelRange;
        tunnelBottomXright = tunnelAboveXright;
        tunnelBottomYbottom = tunnelBottomYtop + tunnelHeight;
    }
    public void drawing(Canvas canvas) {
        //tuneel 1
        tunnelRectangleAbove = new Rect(tunnelAboveXleft, tunnelAboveYtop, tunnelAboveXright, tunnelAboveYbottom);
        canvas.drawBitmap(tunnelImage[above], null, tunnelRectangleAbove, null);
        // tuneel 2
        tunnelRectangleBottom = new Rect(tunnelBottomXleft, tunnelBottomYtop, tunnelBottomXright, tunnelBottomYbottom);
        canvas.drawBitmap(tunnelImage[bottom], null, tunnelRectangleBottom, null);
    }
}
