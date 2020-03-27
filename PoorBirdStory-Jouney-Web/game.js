var game = function () {
    this.canvas = null;
    this.context = null;

    this.width = 288;
    this.height = 505;

    this.bird = null;
    this.bg = null;
    this.base = null;


    var self = this;
    this.started = false;
    this.gameOver = false;

    this.liveCnt = 3;
    this.score = 0;

    this.init = function () {
        this.canvas = document.createElement('canvas');
        this.context = this.canvas.getContext('2d');
        this.canvas.width = this.width;
        this.canvas.height = this.height;

        document.getElementById("canvas").appendChild(this.canvas);
        //creat information
        this.information = new information(this);
        this.information.init();

        //creat bird
        this.bird = new bird(this);
        this.bird.init();

        //creat background
        this.bg = new bg(this);
        this.bg.init();

        //cread base
        this.base = new base(this);
        this.base.init();

        this.pipe = new pipe(this);
        this.pipe.init();

        this.width = this.bg.Width;
        this.height = this.bg.height;

        //listen mouse action
        this.listenMouse();
        this.loop();
    }

    this.clickEvent = function () {
        if (this.started == true) {
            this.bird.flap();
        } else {
            this.started = true;
        }

        if (this.bird.continueFlg) {
            this.gameOver = false;
            //          this.bird.continueFlg = false;
            //creat information
            //           this.information = new information(this);
            //           this.information.init();
            //creat bird
            this.bird = new bird(this);
            this.bird.init();
            this.information.waitCnt = 3;
            //creat background
            //           this.bg = new bg(this);
            //           this.bg.init();
            //cread base
            //           this.base = new base(this);
            //           this.base.init();
            this.pipe = new pipe(this);
            this.pipe.init();
        }

        if (this.bird.resetFlg) {
            this.gameOver = false;
            //          this.bird.continueFlg = false;
            //creat information
            //           this.information = new information(this);
            //           this.information.init();
            //creat bird
            this.bird = new bird(this);
            this.bird.init();
            this.information.waitCnt = 3;
            this.liveCnt = 3;
            this.score = 0;
            //creat background
            //           this.bg = new bg(this);
            //           this.bg.init();
            //cread base
            //           this.base = new base(this);
            //           this.base.init();
            this.pipe = new pipe(this);
            this.pipe.init();
        }



    }

    this.listenMouse = function () {
        this.canvas.addEventListener('click', function () {
            self.clickEvent();
        });
    }


    this.loop = function () {
        self.update();
        self.draw();
        setTimeout(self.loop, 33);
    }

    this.update = function () {
        if (this.bird.deadFlg) {
            this.gameOver = true;
            return;
        }
        if (this.started == true) {
            this.bg.update();
            this.pipe.update();
            this.base.update();
            this.bird.update();
        }
        if (this.started == false) {
            this.bg.update();
            this.base.update();
            this.listenMouse();
        }
    }
    this.draw = function () {
        this.bg.draw();
        this.pipe.draw();
        this.base.draw();
        this.bird.draw();
        this.information.draw();
    }
}

var g = new game();
g.init();
