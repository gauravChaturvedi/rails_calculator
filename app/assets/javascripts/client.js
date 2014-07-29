var Calculator =function(viewID){
    this.viewElement = $(viewID);
    this.observers = $({});
    this.inputElement = $("#"+viewID+" .command");
    this.submitButton = $("#"+viewID+" .submit");
    this.resultElement = $("#"+viewID+" .state");
    this.calculatorCreated =false;
    this.initialize();
};

Calculator.prototype = {
    initialize:function(){
        this.observeClick();
    },
    registerObserver: function(observer){
        this.observers.on('notifyUpdateResultOnObservers', _.bind(observer.updateResultOnObservers, observer));
    },

    observeClick : function(){
        var self=this;
        self.submitButton.bind("click", function () {

            self.putToServer();
        } );
    },

    putToServer: function() {
        var self = this;
        var command = self.inputElement.val();
        $.ajax({
            method: "PUT",
            url: "api/update",
            data: {command: command}

        }).success(_.bind(self.update, self));
    },

    update: function (result){
        this.appendToResultElement(result);
        this.notifyObservers('notifyUpdateResultOnObservers', result);

    },

    notifyObservers: function (eventName, result) {
        this.observers.trigger(eventName, result);
    },
    updateResultOnObservers: function (event, result) {
        this.appendToResultElement(result);
    },
    appendToResultElement: function ( result) {

        this.resultElement.append("<div>"+result.result+"</div>");
    }
};

var CalculatorCreator = function(viewID, template){
    template.attr('id', viewID);
    $(".calculator-container").append( template );
    return new Calculator(viewID);
};

$(document).ready(function()
    {

        var template = $('.calculator').clone();
        var calculator1 = new CalculatorCreator("calculator-1", template);
    }

);