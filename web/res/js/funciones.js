/* Permisos */
/* Permisos de los Residentes */
function ir3() {
    $.ajax({
        type: "POST",
        url: "permisoResidente.jsp",
        success: function (data) {
            $("#permisos").html(data);
            $("#breadseg").html($("#3").val());
            $("#aciones").html("Lista de Permisos de los Residentes");
            $('#submenu3').css({"background": "#000000"});
            $('#submenu4').css({"background": ""});
            $('#submenu5').css({"background": ""});
        }
    });
}

/* Permisos del Personal */
function ir4() {
    $.ajax({
        type: "POST",
        url: "permisoPersonal.jsp",
        success: function (data) {
            $("#permisos").html(data);
            $("#breadseg").html($("#4").val());
            $("#aciones").html("Lista de Permisos del Personal");
            $('#submenu3').css({"background": ""});
            $('#submenu4').css({"background": "#000000"});
            $('#submenu5').css({"background": ""});
        }
    });
}

/* Permisos de Vehículos */
function ir5() {
    $.ajax({
        type: "POST",
        url: "permisoVehiculo.jsp",
        success: function (data) {
            $("#permisos").html(data);
            $("#breadseg").html($("#5").val());
            $("#aciones").html("Lista de Permisos de Vehículos");
            $('#submenu3').css({"background": ""});
            $('#submenu4').css({"background": ""});
            $('#submenu5').css({"background": "#000000"});
        }
    });
}

/* Incidencias */
/* Registrar una Incidencia */
function ir8() {
    $.ajax({
        type: "POST",
        url: "addIncidencia.jsp",
        success: function (data) {
            $("#incidencias").html(data);
            $("#breadseg").html($("#8").val());
            $("#aciones").html("Lista de Incidencias");
            $('#submenu8').css({"background": "#000000"});
            $('#submenu9').css({"background": ""});
        }
    });
}

/* Registrar un Objeto Perdido */
function ir9() {
    $.ajax({
        type: "POST",
        url: "addObjetoPerdido.jsp",
        success: function (data) {
            $("#incidencias").html(data);
            $("#breadseg").html($("#9").val());
            $("#aciones").html("Lista de Objetos Perdidos");
            $('#submenu8').css({"background": ""});
            $('#submenu9').css({"background": "#000000"});
        }
    });
}

/* Mantenimiento */
/* Agregar Persona */
function ir11() {
    $.ajax({
        type: "POST",
        url: "addPersona.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#11").val());
            $("#aciones").html("Lista de Personas");
            $('#submenu11').css({"background": "#000000"});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Tipo Persona */
function ir12() {
    $.ajax({
        type: "POST",
        url: "addTipoPersona.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#12").val());
            $("#aciones").html("Lista de Tipos de Persona");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": "#000000"});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* AgregarObjeto */
function ir13() {
    $.ajax({
        type: "POST",
        url: "addObjeto.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#13").val());
            $("#aciones").html("Lista de Objetos");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": "#000000"});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Área */
function ir14() {
    $.ajax({
        type: "POST",
        url: "addArea.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#14").val());
            $("#aciones").html("Lista de Áreas");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": "#000000"});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Vehículo */
function ir15() {
    $.ajax({
        type: "POST",
        url: "addVehiculo.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#15").val());
            $("#aciones").html("Lista de Vehículos");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": "#000000"});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Tipo de Vehículo */
function ir16() {
    $.ajax({
        type: "POST",
        url: "addTipoVehiculo.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#16").val());
            $("#aciones").html("Lista de Tipos de Vehículos");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": "#000000"});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Marca */
function ir17() {
    $.ajax({
        type: "POST",
        url: "addMarca.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#17").val());
            $("#aciones").html("Lista de Marcas");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": "#000000"});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Turno */
function ir18() {
    $.ajax({
        type: "POST",
        url: "addTurno.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#18").val());
            $("#aciones").html("Lista de Turnos");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": "#000000"});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Deber */
function ir19() {
    $.ajax({
        type: "POST",
        url: "addDeber.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#19").val());
            $("#aciones").html("Lista de Deberes");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": "#000000"});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Tipo Deber */
function ir20() {
    $.ajax({
        type: "POST",
        url: "addTipoDeber.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#20").val());
            $("#aciones").html("Lista de Tipos de Deberes");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": "#000000"});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Motivos */
function ir21() {
    $.ajax({
        type: "POST",
        url: "addMotivos.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#21").val());
            $("#aciones").html("Lista de Motivos");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": "#000000"});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Tipo de Salida */
function ir22() {
    $.ajax({
        type: "POST",
        url: "addTipoSalida.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#22").val());
            $("#aciones").html("Lista de Tipos de Salidas");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": "#000000"});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Tipo de Incidencia */
function ir23() {
    $.ajax({
        type: "POST",
        url: "addTipoIncidencia.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#23").val());
            $("#aciones").html("Lista de Tipos de Incidencias");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": "#000000"});
            $('#submenu24').css({"background": ""});
        }
    });
}

/* Agregar Tipo de Documento */
function ir24() {
    $.ajax({
        type: "POST",
        url: "addTipoDocumento.jsp",
        success: function (data) {
            $("#mantenimiento").html(data);
            $("#breadseg").html($("#24").val());
            $("#aciones").html("Lista de Tipos de Documentos");
            $('#submenu11').css({"background": ""});
            $('#submenu12').css({"background": ""});
            $('#submenu13').css({"background": ""});
            $('#submenu14').css({"background": ""});
            $('#submenu15').css({"background": ""});
            $('#submenu16').css({"background": ""});
            $('#submenu17').css({"background": ""});
            $('#submenu18').css({"background": ""});
            $('#submenu19').css({"background": ""});
            $('#submenu20').css({"background": ""});
            $('#submenu21').css({"background": ""});
            $('#submenu22').css({"background": ""});
            $('#submenu23').css({"background": ""});
            $('#submenu24').css({"background": "#000000"});
        }
    });
}


/* Seguridad */
/* Agregar Usuario */
function ir26() {
    $.ajax({
        type: "POST",
        url: "addUsuario.jsp",
        success: function (data) {
            $("#seguridad").html(data);
            $("#breadseg").html($("#26").val());
            $("#aciones").html("Lista de Usuarios");
            $('#submenu26').css({"background": "#000000"});
            $('#submenu27').css({"background": ""});
            $('#submenu28').css({"background": ""});
            $('#submenu29').css({"background": ""});
        }
    });
}

/* Agregar Perfil */
function ir27() {
    $.ajax({
        type: "POST",
        url: "addPerfil.jsp",
        success: function (data) {
            $("#seguridad").html(data);
            $("#breadseg").html($("#27").val());
            $("#aciones").html("Lista de Perfiles");
            $('#submenu26').css({"background": ""});
            $('#submenu27').css({"background": "#000000"});
            $('#submenu28').css({"background": ""});
            $('#submenu29').css({"background": ""});
        }
    });
}

/* Agregar Perfil */
function ir28() {
    $.ajax({
        type: "POST",
        url: "addAccesos.jsp",
        success: function (data) {
            $("#seguridad").html(data);
            $("#breadseg").html($("#28").val());
            $("#aciones").html("Lista de Accesos");
            $('#submenu26').css({"background": ""});
            $('#submenu27').css({"background": ""});
            $('#submenu28').css({"background": "#000000"});
            $('#submenu29').css({"background": ""});
            $('#submenu30').css({"background": ""});
        }
    });
}

/* Agregar Menús */
function ir29() {
    $.ajax({
        type: "POST",
        url: "addMenu.jsp",
        success: function (data) {
            $("#seguridad").html(data);
            $("#breadseg").html($("#29").val());
            $("#aciones").html("Lista de Menús");
            $('#submenu26').css({"background": ""});
            $('#submenu27').css({"background": ""});
            $('#submenu28').css({"background": ""});
            $('#submenu29').css({"background": "#000000"});
            $('#submenu30').css({"background": ""});
        }
    });
}

/* Agregar Responsabilidades */
function ir30() {
    $.ajax({
        type: "POST",
        url: "addResponsabilidad.jsp",
        success: function (data) {
            $("#seguridad").html(data);
            $("#breadseg").html($("#30").val());
            $("#aciones").html("Lista de Responsabilidades");
            $('#submenu26').css({"background": ""});
            $('#submenu27').css({"background": ""});
            $('#submenu28').css({"background": ""});
            $('#submenu29').css({"background": ""});
            $('#submenu30').css({"background": "#000000"});
        }
    });
}


/* Funcion para filtrar */
function filter(phrase, _id) {
    var words = phrase.value.toLowerCase().split(" ");
    var table = document.getElementById(_id);
    var ele;
    for (var r = 1; r < table.rows.length; r++) {
        ele = table.rows[r].innerHTML.replace(/<[^>]+>/g, "");
        var displayStyle = 'none';
        for (var i = 0; i < words.length; i++) {
            if (ele.toLowerCase().indexOf(words[i]) >= 0)
                displayStyle = '';
            else {
                displayStyle = 'none';
                break;
            }
        }
        table.rows[r].style.display = displayStyle;
    }
}

/* Permisos */
/* Agregar Salida sin Permiso del Personal */
function agregarSinPermiso() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaSinPer').style.display = 'none';
    document.getElementById('agregarSinPer').style.display = 'block';
    document.getElementById("campo").focus();
    $("#aciones").html("Agregar Salida sin Permiso");
}
function cancelarSinPermiso() {
    document.getElementById("addsinPer").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaSinPer').style.display = 'block';
    document.getElementById('agregarSinPer').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Permisos del Personal");
}

/* Visita */
/* Registrar una Visita */
function agregarVisita() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaVis').style.display = 'none';
    document.getElementById('agregarVis').style.display = 'block';
    document.getElementById("campo").focus();
    $("#aciones").html("Agregar Visita");
}
function cancelarVisita() {
    document.getElementById("addvis").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaVis').style.display = 'block';
    document.getElementById('agregarVis').style.display = 'none';
    document.getElementById('buscador').focus();
    $("#aciones").html("Lista de Visitas");
}

/* Incidencias */
/* Agregar Incidencia */
function agregarIncidencia() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaIncidencia').style.display = 'none';
    document.getElementById('agregarIncidencia').style.display = 'block';
    document.getElementById("campo").focus();
    $("#aciones").html("Agregar Incidencia");
}
function cancelarIncidencia() {
    document.getElementById("addincidencia").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaIncidencia').style.display = 'block';
    document.getElementById('agregarIncidencia').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Incidencias");
}

/* Agregar Objeto Perdido */
function agregarObjPerdido() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaObjPerdido').style.display = 'none';
    document.getElementById('agregarObjPerdido').style.display = 'block';
    document.getElementById("campo").focus();
    $("#aciones").html("Agregar Objeto Perdido");
}
function cancelarObjPerdido() {
    document.getElementById("addobjperdido").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaObjPerdido').style.display = 'block';
    document.getElementById('agregarObjPerdido').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Objetos Perdidos");
}

/* Mantenimiento */
/* Agregar Persona */
function agregarPer() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaPer').style.display = 'none';
    document.getElementById('agregarPer').style.display = 'block';
    document.getElementById("nombres").focus();
    $("#aciones").html("Agregar Persona");
}
function cancelarPer() {
    document.getElementById("addper").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaPer').style.display = 'block';
    document.getElementById('agregarPer').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Personas");
}

/* Agregar Tipo Persona */
function agregarTipoPer() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaTipoPer').style.display = 'none';
    document.getElementById('agregarTipoPer').style.display = 'block';
    document.getElementById("tipo").focus();
    $("#aciones").html("Agregar Tipo de Persona");
}
function cancelarTipoPer() {
    document.getElementById("addtipoper").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaTipoPer').style.display = 'block';
    document.getElementById('agregarTipoPer').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Tipos de Personas");
}

/* AgregarObjeto */
function agregarObjeto() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaObjeto').style.display = 'none';
    document.getElementById('agregarObjeto').style.display = 'block';
    document.getElementById("objeto").focus();
    $("#aciones").html("Agregar Objeto");
}
function cancelarObjeto() {
    document.getElementById("addobj").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaObjeto').style.display = 'block';
    document.getElementById('agregarObjeto').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Objetos");
}

/* Agregar Área */
function agregarArea() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaArea').style.display = 'none';
    document.getElementById('agregarArea').style.display = 'block';
    document.getElementById("area").focus();
    $("#aciones").html("Agregar Área");
}
function cancelarArea() {
    document.getElementById("addarea").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaArea').style.display = 'block';
    document.getElementById('agregarArea').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Áreas");
}

/* Agregar Vehículo */
function agregarVehiculo() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaVehiculo').style.display = 'none';
    document.getElementById('agregarVehiculo').style.display = 'block';
    document.getElementById('tipo').focus();
    $("#aciones").html("Agregar Vehículo");
}
function cancelarVehiculo() {
    document.getElementById('addvehiculo').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaVehiculo').style.display = 'block';
    document.getElementById('agregarVehiculo').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Vehículos");
}

/* Agregar Tipo de Vehículo */
function agregarTipoVehiculo() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaTipoVehiculo').style.display = 'none';
    document.getElementById('agregarTipoVehiculo').style.display = 'block';
    document.getElementById('tipo').focus();
    $("#aciones").html("Agregar Tipo de Vehículo");
}
function cancelarTipoVehiculo() {
    document.getElementById('addtipovehiculo').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaTipoVehiculo').style.display = 'block';
    document.getElementById('agregarTipoVehiculo').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Tipos de Vehículos");
}

/* Agregar Marca */
function agregarMarca() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaMarca').style.display = 'none';
    document.getElementById('agregarMarca').style.display = 'block';
    document.getElementById('marca').focus();
    $("#aciones").html("Agregar Marca");
}
function cancelarMarca() {
    document.getElementById('addmarca').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaMarca').style.display = 'block';
    document.getElementById('agregarMarca').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Marcas");
}

/* Agregar Turno */
function agregarTurno() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaTurno').style.display = 'none';
    document.getElementById('agregarTurno').style.display = 'block';
    document.getElementById('turno').focus();
    $("#aciones").html("Agregar Turno");
}
function cancelarTurno() {
    document.getElementById('addturno').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaTurno').style.display = 'block';
    document.getElementById('agregarTurno').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Turnos");
}

/* Agregar Deber */
function agregarDeber() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaDeber').style.display = 'none';
    document.getElementById('agregarDeber').style.display = 'block';
    document.getElementById('deber').focus();
    $("#aciones").html("Agregar Deber");
}
function cancelarDeber() {
    document.getElementById('adddeber').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaDeber').style.display = 'block';
    document.getElementById('agregarDeber').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Deberes");
}

/* Agregar Tipo Deber */
function agregarTipoDeber() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaTipoDeber').style.display = 'none';
    document.getElementById('agregarTipoDeber').style.display = 'block';
    document.getElementById('tipo').focus();
    $("#aciones").html("Agregar Tipo de Deber");
}
function cancelarTipoDeber() {
    document.getElementById('addtipodeber').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaTipoDeber').style.display = 'block';
    document.getElementById('agregarTipoDeber').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Tipos de Deberes");
}

/* Agregar Motivos */
function agregarMotivo() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaMotivo').style.display = 'none';
    document.getElementById('agregarMotivo').style.display = 'block';
    document.getElementById('motivo').focus();
    $("#aciones").html("Agregar Motivo");
}
function cancelarMotivo() {
    document.getElementById('addmotivo').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaMotivo').style.display = 'block';
    document.getElementById('agregarMotivo').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Motivos");
}

/* Agregar Tipo de Salida */
function agregarTipoSalida() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaTipoSalida').style.display = 'none';
    document.getElementById('agregarTipoSalida').style.display = 'block';
    document.getElementById('tipoSalida').focus();
    $("#aciones").html("Agregar Tipo de Salida");
}
function cancelarTipoSalida() {
    document.getElementById('addtiposalida').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaTipoSalida').style.display = 'block';
    document.getElementById('agregarTipoSalida').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Tipos de Salidas");
}

/* Agregar Tipo de Incidencia */
function agregarTipoIncidencia() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaTipoIncidencia').style.display = 'none';
    document.getElementById('agregarTipoIncidencia').style.display = 'block';
    document.getElementById('tipoIncidencia').focus();
    $("#aciones").html("Agregar Tipo de Incidencia");
}
function cancelarTipoIncidencia() {
    document.getElementById('addtipoincidencia').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaTipoIncidencia').style.display = 'block';
    document.getElementById('agregarTipoIncidencia').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Tipos de Incidencias");
}

/* Agregar Tipo de Documento */
function agregarTipoDocumento() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaTipoDocumento').style.display = 'none';
    document.getElementById('agregarTipoDocumento').style.display = 'block';
    document.getElementById('tipoDocumento').focus();
    $("#aciones").html("Agregar Tipo de Documento");
}
function cancelarTipoDocumento() {
    document.getElementById('addtipodocumento').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaTipoDocumento').style.display = 'block';
    document.getElementById('agregarTipoDocumento').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Tipos de Documentos");
}

/* SEGURIDAD */
/* Agregar Usuario */
function agregarUsuario() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaUsuario').style.display = 'none';
    document.getElementById('agregarUsuario').style.display = 'block';
    document.getElementById("buscarpersona").focus();
    $("#aciones").html("Agregar Usuario");
}
function cancelarUsuario() {
    document.getElementById("adduser").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaUsuario').style.display = 'block';
    document.getElementById('agregarUsuario').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Usuarios");
}

/* Agregar Perfil */
function agregarPerfil() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaPerfil').style.display = 'none';
    document.getElementById('agregarPerfil').style.display = 'block';
    document.getElementById("perfil").focus();
    $("#aciones").html("Agregar Perfil");
}
function cancelarPerfil() {
    document.getElementById("addperfil").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaPerfil').style.display = 'block';
    document.getElementById('agregarPerfil').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Perfiles");
}

/* Agregar Perfil */
function agregarMenuPerfil() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaMenuPerfil').style.display = 'none';
    document.getElementById('agregarMenuPerfil').style.display = 'block';
    document.getElementById("perfil").focus();
    $("#aciones").html("Añadir Acceso");
}
function cancelarMenuPerfil() {
    document.getElementById("addMenuperfil").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaMenuPerfil').style.display = 'block';
    document.getElementById('agregarMenuPerfil').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Accesos");
}

/* Agregar Menús*/
function agregarMenu() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaMenu').style.display = 'none';
    document.getElementById('agregarMenu').style.display = 'block';
    document.getElementById("menu").focus();
    $("#aciones").html("Agregar Menú");
}
function cancelarMenu() {
    document.getElementById("addmenu").reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaMenu').style.display = 'block';
    document.getElementById('agregarMenu').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Menús");
}

/* Agregar Responsabilidades */
function agregarResponsabilidad() {
    document.getElementById('lista').style.display = 'none';
    document.getElementById('listaResponsabilidad').style.display = 'none';
    document.getElementById('agregarResponsabilidad').style.display = 'block';
    document.getElementById('buscarusuario').focus();
    $("#aciones").html("Agregar Responsabilidad");
}
function cancelarResponsabilidad() {
    document.getElementById('addresponsabilidad').reset();
    document.getElementById('lista').style.display = 'block';
    document.getElementById('listaResponsabilidad').style.display = 'block';
    document.getElementById('agregarResponsabilidad').style.display = 'none';
    document.getElementById("buscador").focus();
    $("#aciones").html("Lista de Responsabilidades");
}

/* Filtrar */
