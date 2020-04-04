var pipe = function (game) {
    this.game = game;
    this.imageAbove = null;
    this.loadedAbove = false;

    this.imageBottom = null;
    this.loadedBottom = false;

    
    this.xPipeConstan = 250;
    this.x = 600;   //toa do ve pipe
    this.y = 0;
    this.yAbove = 0;    //toa do upPipe
    this.yBottom = 0;   //toa do downPipe
    this.pipeImageHight = 320;  //chieu dai cua pipe
    this.pipeImageWidth = 52;  //do rong cua pipe
    this.hightGate = 115;       //do cao cua khe/cong


    var self = this;
    this.base = new base();

    this.init = function () {
        this.y = this.getRndInteger(this.hightGate - this.pipeImageHight, 0 - this.hightGate);
        this.loadImage();
    }

    this.getRndInteger = function (min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    this.loadImage = function () {
        this.imageAbove = new Image();
        this.imageAbove.onload = function () {
            self.loadedAbove = true;

        }
        this.imageAbove.src = 'images/Uppipe.png';

        this.imageBottom = new Image();
        this.imageBottom.onload = function () {
            self.loadedBotton = true;
        }
        this.imageBottom.src = 'images/Downpipe.png';
    }

    this.update = function () {
        this.x -= 2;
        if (this.x == -54) {
            this.x = this.xPipeConstan;
            this.y = this.getRndInteger(this.hightGate - this.pipeImageHight, 0 - this.hightGate);
        }
    }

    this.draw = function () {
        if (self.loadedAbove == false) {
            return;
        }
        if (self.loadedBotton == false) {
            return;
        }
        this.yAbove = this.y;
        this.yBottom = this.y + this.pipeImageHight + this.hightGate;
        self.game.context.drawImage(this.imageAbove, this.x, this.yAbove);
        self.game.context.drawImage(this.imageBottom, this.x, this.yBottom);
    }

}
