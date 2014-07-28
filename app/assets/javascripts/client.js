var Calculator =function(viewID){
    this.viewElement = $(viewID);
    this.inputElement = this.viewElement.find(".command");
    this.submitButton = this.viewElement.find(".submit");
    this.resultElement = this.viewElement.find(".state");
    this.calculatorCreated =false;
    this.initialize();
}

Calculator.prototype = {
    initialize:function(){
        //alert("Hello initialize function")
        this.ObserveClick();

    },

    ObserveClick : function(){
        var self=this;

        this.submitButton.click(function()
        {
            //alert("Button clicked")
            self.handleClickEvent();

        });
    },

    handleClickEvent : function()
    {
        //alert("hello handle click event");
        var self= this;
//        if(!self.calculatorCreated){
//            self.create();
//        }
        self.putToServer();
    },

    create : function()
    {
        var self= this;

        $.ajax({
            url: 'api/create',
            method:'POST',
            success:function(){
                self.calculatorCreated = true;
            }
        });
    },

    putToServer: function() {
        alert("Hello putToServer function")
        var self = this;
        var command = self.inputElement.val();
        //alert(command);
        $.ajax({

            method: "PUT",
            url: "api/update",
            data: {command: command},
            success: function (result) {
                alert(result.result);
                a = "<div>"+result.result+"</div>";
             self.resultElement.append(a);
            }
        });
    }


}


$(document).ready(function()
    {
        //alert("Hello ready function");
        calculator1= new Calculator("#calculator1");
        calculator2= new Calculator("#calculator2");
    }

);