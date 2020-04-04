var information = function (game) {
  this.game = game;
  this.image = null;
  this.loaded = false;


  this.x = 80;           //toa do x cua bird
  this.y = 200;             // toa do y cua bird
  this.timeCnt = 1;
  this.waitCnt = 3;

  self = this;

  //this.bird = new bird();

  this.init = function () {
    this.loadImage();
  }

  this.draw = function () {
    this.write();
    this.scoreDraw();
    this.lives();
    this.gameStatusNote();
  }

  this.update = function () {

  }
  this.write = function () {
    if (this.game.started == true) {
      return;
    }
    this.game.context.font = "20px Comic Sans MS";
    this.game.context.fillStyle = "red";
    this.game.context.textAlign = "left";
    this.txt = 'The Story Of a Poor Bird';
    this.x = this.game.bird.x - 50;
    this.y = this.game.bird.y + 60;
    this.game.context.fillText(this.txt, this.x, this.y);
    this.wrapText();
    this.scoreDraw();
    
  }
  this.wrapText = function () {
    this.description = "";
    this.maxWidth = 250;
    this.lineHeight = 20;
    this.xWrap = this.x;
    this.yWrap = this.y + 30;
    this.game.context.font = "15px Comic Sans MS";
    this.game.context.fillStyle = "yellow";
    this.game.context.textAlign = "left";

    var words = this.description.split(' ');
    var line = '';
    for (var n = 0; n < words.length; n++) {
      var testLine = line + words[n] + ' ';
      var metrics = this.game.context.measureText(testLine);
      var testWidth = metrics.width;
      if (testWidth > this.maxWidth && n > 0) {
        this.game.context.fillText(line, this.xWrap, this.yWrap);
        line = words[n] + ' ';
        this.yWrap += this.lineHeight;
      }
      else {
        line = testLine;
      }
    }
    this.game.context.fillText(line, this.xWrap, this.yWrap);
  }

  this.scoreDraw = function () {
    this.game.context.font = "29px myFirstFont";
    this.game.context.fillStyle = "yellow";
    this.game.context.textAlign = "center";
    //console.log('self.game.score :=' + self.game.score);
    this.game.context.fillText(this.game.score, this.game.bg.Width / 2, (this.game.bg.height / 100) * 5);
    //this.game.context.fillText('dfsffsf', this.game.bg.Width/2, (this.game.bg.height/100)*5);
  }

  this.gameStatusNote = function () {
    this.game.context.font = "29px myFirstFont";
    this.game.context.fillStyle = "yellow";
    this.game.context.textAlign = "center";
    if (this.game.gameOver == true) {
      if (this.game.liveCnt < 1) {
        this.game.context.fillText("game over", this.game.bg.Width / 2, (this.game.bg.height / 2) - 100);
        this.game.context.fillText("tap to continue", this.game.bg.Width / 2, (this.game.bg.height / 2));
        this.game.bird.resetFlg = true;
      } else {
        if (this.game.started == true) {
          if(this.waitCnt > 0){
            this.game.context.fillText("please wait", this.game.bg.Width / 2, (this.game.bg.height / 2) - 100);
            this.game.context.fillText(this.waitCnt, this.game.bg.Width / 2, this.game.bg.height / 2);
          } else{
            this.game.context.fillText("tap to continue", this.game.bg.Width / 2, (this.game.bg.height / 2) - 100);
            this.game.bird.continueFlg = true;
          }

        }
      }
      this.timeCnt ++;
      if(this.timeCnt % 33 == 0){
        this.timeCnt = 1;
        this.waitCnt --;
      }
    }
  }

  this.loadImage = function () {
    this.image = new Image();
    this.image.onload = function () {
      self.loaded = true;
    }
    this.image.src = 'images/live.png';
  }

  this.lives = function () {
    this.xcnt = 10;
    for (i = 0; i < self.game.liveCnt; i++) {
      self.game.context.drawImage(this.image, this.xcnt, 10);
      this.xcnt += 20;
    }
  }

}
