var bird = function (game) {
    this.game = game;
    this.Images = [];
    this.img1Loaded = false;
    this.img2Loaded = false;
    this.img3Loaded = false;

    this.currentImage = null;
    this.imageIndex = 0;
    this.currentFrame = 0;

    this.x = 78;           //toa do x cua bird
    this.y = 150;             // toa do y cua bird
    this.speedY = 0;        // toc do ban dau roi cua bird
    this.acceleration = 0.7;    //gia toc roi cua bird
    this.birdWidth = 34;        //do rong cua bird
    this.birdHight = 24;        //do cao cua bird

    this.birdRignPosition = this.x + this.birdWidth;
    this.birdLeftPosition = this.x;

    this.scoreFlg = false;
    this.score = 0;

    this.continueFlg = false;


    //   this.deadBottonLimit = 395;

    self = this;
    this.base = new base(this);
    this.pipe = new pipe(this);

    this.deadFlg = false;
    this.deadAboveLimit = 0;
    this.deadBottonLimit = this.base.y;

    this.init = function () {
        self.loadImages();
    }

    this.loadImages = function () {
        var img1 = new Image();
        var img2 = new Image();
        var img3 = new Image();
        //load all image
        img1.src = 'images/bird1.png';
        img2.src = 'images/bird2.png';
        img3.src = 'images/bird3.png';

        img1.onload = function () {
            self.img1Loaded = true;
            self.currentImage = img1;
            self.Images.push(img1);

        }
        img2.onload = function () {
            self.img2Loaded = true;
            self.Images.push(img2);
        }
        img3.onload = function () {
            self.img3Loaded = true;
            // self.Images.push(img3);
        }

    }

    this.update = function () {
        if (self.img1Loaded && self.img2Loaded && self.img3Loaded) {
            //console.log('all images are loaded');
        } else {
            return;
        }

        if (this.deadFlg == true) {
            return;
        }

        self.currentFrame += 1;
        if (self.currentFrame == 30) {
            self.currentFrame = 0;
        }
        if (self.currentFrame % 5 == 0) {
            self.changeImage();

        }
        if (self.y < self.deadBottonLimit) {
            self.drawBirdFall();
        }
        if (this.speedY >= 0) {
            if (self.y + this.birdWidth >= self.deadBottonLimit) {
                //self.drawBirdDeadBotton();
                self.drawBirdDead();
                return;
            }
        } else {
            if (self.y <= self.deadAboveLimit) {
                //self.drawBirdDeadAbove();
                self.drawBirdDead();
                return
            }
        }
        //check hit
        this.checkHitPipe();
    }
    this.checkHitPipe = function () {
        if (this.game.pipe.x < self.birdRignPosition && this.game.pipe.x + this.game.pipe.pipeImageWidth > self.birdLeftPosition) {
            //console.log('bird bat dau vao gate');
            this.scoreFlg = false;
            if (self.y < this.game.pipe.yBottom) {
                if (self.y <= this.game.pipe.yBottom - this.game.pipe.hightGate) {
                    this.deadFlg = true;
                    self.drawBirdDead();
                    return;
                }
            }
            if (self.y + this.birdHight > this.game.pipe.yBottom) {
                this.deadFlg = true;
                self.drawBirdDead();
                return;
            }
        }
        if (this.game.pipe.x + this.game.pipe.pipeImageWidth < self.birdLeftPosition) {
            //ra khoi ong
            if (this.scoreFlg == false) {
                this.updatescore();
            }
        }
    }
    this.updatescore = function () {
        this.score += 1;
        this.game.score += 1;
        //console.log('score: ' + this.score);
        this.scoreFlg = true;
    }

    this.drawBirdFall = function () {
        self.speedY += self.acceleration;
        self.y += self.speedY;
    }

    this.drawBirdDead = function () {
        self.acceleration = 0;
        var img3 = new Image();
        img3.src = 'images/bird3.png';
        self.currentImage = img3;
        this.deadFlg = true;
        this.game.liveCnt --;
    }

    this.drawBirdDeadAbove = function () {
        //self.y = 0;
        self.speedY = 0;
        self.acceleration = 0;
        var img3 = new Image();
        img3.src = 'images/bird3.png';
        self.currentImage = img3;
        this.deadFlg = true;
    }

    this.drawBirdDeadBotton = function () {
        //self.y = 395;
        var img3 = new Image();
        img3.src = 'images/bird3.png';
        self.currentImage = img3;
        this.deadFlg = true;
    }

    this.flap = function () {
        //    this.acceleration = -5;
        this.speedY = -10;
    }

    this.changeImage = function () {
        self.imageIndex++;

        if (self.imageIndex > 1) {
            self.imageIndex = 0;
        }
        self.currentImage = self.Images[self.imageIndex];
    }

    this.draw = function () {
        if (self.img1Loaded && self.img2Loaded && self.img3Loaded) {
            self.game.context.drawImage(self.currentImage, self.x, self.y);
        }
    }

}
