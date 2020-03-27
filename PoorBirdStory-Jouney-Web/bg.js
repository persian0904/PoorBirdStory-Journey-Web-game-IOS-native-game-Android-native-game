var bg = function (game) {
    this.game = game;
    this.image = null;
    this.loaded = false;

    this.x = 0;
    this.Width = 288;
    this.height = 505;
    this.y = 0;

    var self = this;

    this.init = function () {
        this.loadImage();
    }

    this.loadImage = function () {
        this.image = new Image();
        this.image.onload = function () {
            self.loaded = true;
        }
        this.image.src = 'images/background.png';
    }

    this.update = function () {
        this.x--;
        if (this.x == 0 - this.Width) {
            this.x = 0;
        }
    }

    this.draw = function () {
        //
        if (self.loaded == false) {
            return;
        } else {
            self.game.context.drawImage(this.image, this.x, this.y);
            self.game.context.drawImage(this.image, this.x + this.Width, this.y);
        }

    }

}
