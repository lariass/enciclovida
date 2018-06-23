//Variable para ofuscar correo
var co = ["xm.bo","g.oiba","noc","@adivol","cicne:o","tliam"];

/**
 * Para validar el correo
 * @param correo
 * @returns {boolean}
 */
var correoValido = function (correo)
{
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(correo);
};

/**
 * La primera letra a mayuscula
 * @param str
 * @returns {string}
 */
function primeraEnMayuscula( str ) {
    return str.substr(0, 1).toUpperCase() + str.substr(1);
}

/**
 * Cambia entre vista general y de especialistas
 * @param locale
 * @returns {boolean}
 */
var cambiaLocale = function(locale){
    $.ajax(
        {
            url: "/usuarios/cambia_locale",
            type: 'POST',
            data: {
                locale: locale
            }
        }).done(function(resp){
            if (resp.estatus) location.reload(true);
            return false;
        });
    return false;
};

/**
 * Pequeño hack para mejorar el title de los iconos, agregar solo clase .btn-title
 */
var tooltip = function()
{
    $('.btn-title').attr('tooltip-title', function(){return $(this).attr('title');}).removeAttr('title');
};

/**
 * Para automáticamente hacer un resize a la cajita de la busqueda básica se puede (y debe) MEJORAR
 */
var refreshMediaQueries = function()
{
    if (window.innerWidth < 992){
        $('#basica .input-group').addClass('input-group-lg');
        $('#pestañas > ul.nav').addClass('nav-stacked').removeClass('nav-tabs');
    }else{
        $('#basica .input-group').removeClass('input-group-lg');
        $('#pestañas > ul.nav').addClass('nav-tabs').removeClass('nav-stacked');
    }
};

$(document).ready(function(){
    tooltip();

    $(window).resize(function(){
        refreshMediaQueries();
    });
});
