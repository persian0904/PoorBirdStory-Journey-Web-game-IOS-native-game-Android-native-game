var base = function (game) {
    this.game = game;
    this.image = null;
    this.loaded = false;

    this.x = 0;
    this.y = 400;

    var self = this;

    this.init = function () {
        this.loadImage();
    }

    this.loadImage = function () {
        this.image = new Image();
        this.image.onload = function () {
            self.loaded = true;

        }
        this.image.src = 'images/base.png';

    }

    this.update = function () {
        //console.log('bg.update');
        this.x --;
        if (this.x == 0 - this.game.bg.Width) {
            this.x = 0;
        }
    }

    this.draw = function () {
        if (self.loaded == false) {
            return;
        } else {
            //console.log('bird.draw');
            self.game.context.drawImage(this.image, this.x, this.y);
            self.game.context.drawImage(this.image, this.x + this.game.bg.Width, this.y);
        }

    }

}
