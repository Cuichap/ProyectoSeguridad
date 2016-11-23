/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var info = [];
$(document).ready(function () {
    $(function () {
        
        $("#buscarPersona").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "controller",
                    type: "POST",
                    data: {
                        term: request.term
                    },
                    dataType: "json",
                    success: function (data) {
                        info = [];
                        response($.map(data, function (item) {
                            info.push({
                                id:item.personaid,
                                nombres:item.nombre,
                                apellidos: item.apellidos
                            });
                            //alert(item.nombre);
                            return item.nombre+' '+item.apellidos;
                        }));
                        //response(data[2]);
                        //alert(data[2]);
                    }
                });
            },
            select: function(event, ui){
                for(var i=0;i<=info.length;i++){
                    if(info[i].nombres === ui.item.value){
                        alert('ID: '+info[i].id+" Nombres: "+info[i].nombres);
                        $("#nombresBuscador").html(info[i].nombres);
                        $("#apellidosBuscador").html(info[i].apellidos);
                        $("#idBuscador").html(info[i].id);
                    }                    
                }
                
            }
        });
    });
});


