var Calculator = function(selector){
    this.selector = selector;
    this.drawComponents();
    this.bindButtonToPut();
}

Calculator.prototype = {
    putToServer: function() {
        var self = this;
        $.ajax({

            contentType: 'application/json',
            data: '{"command":"'+self.getValueOfTextBox()+'"}',
            //data: '{"command":"add 5"}',
            url: 'http://localhost:3000/api/update',
            type: 'PUT',
            success: function(result) {
                self.writeToResultTag(result.result);
            },
            error: function(){
                self.writeToResultTag("Bad thing happened");
            }
        });}
    ,

    drawComponents: function(){

        var body = document.getElementsByTagName('body');

        var components =
            '<div id="' +
             this.selector+
            '">'+
            'Command:'+
            '<input id="command" type="text" name="command"/>'+
            '<button class='+this.selector+' type="submit" name="button">Submit</button>'+
            '</div>';

        document.body.innerHTML += components;
    }
    ,
    getValueOfTextBox: function(){
        return $("#"+this.selector+" #command").val();
    },

    bindButtonToPut: function(){
        var self = this;
        console.log(self.selector);
        $("."+ self.selector ).click(function() {
            console.log(self.selector);
            self.putToServer();
        });
    },

    writeToResultTag: function(result){
        $("<div id='" +this.selector +" result'/>").html(result).appendTo("body");
    }
}


$( document ).ready(function() {

    new Calculator("calculator-one");
    new Calculator("calculator-two");

});