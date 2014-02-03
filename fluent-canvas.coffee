FluentCanvas = new Function(
  "context"
  _.template(
    """
    if (context.length) {
      context = context[0];
    }

    if (context.tagName && context.tagName.toLowerCase() == "canvas") {
      context = context.getContext("2d");
    }

    return {

      <% setters.forEach(function (a) { %>
      <%= a %> : function (val) {
        context.<%= a %> = val;
        return this;
      },
      <% }) %>

      <% methods.forEach(function (a) { %>
      <%= a %> : function () {
        context.<%= a %>.apply(context, arguments);
        return this;
      },
      <% }) %>

      <% passthrough.forEach(function (a) { %>
      <%= a %> : function () {
        return context.<%= a %>.apply(context, arguments);
      },
      <% }) %>
      
      tap : function (callback) {
        callback(this, context);
        return this;
      },

      context : context

    };

    //# sourceURL=/lib/fluent_canvas.js
    """
    {
      setters : [
        "fillStyle"
        "font"
        "globalAlpha"
        "globalCompositeOperation"
        "lineCap"
        "lineDashOffset"
        "lineJoin"
        "lineWidth"
        "miterLimit"
        "shadowBlur"
        "shadowColor"
        "shadowOffsetX"
        "shadowOffsetY"
        "strokeStyle"
        "textAlign"
        "textBaseline"
      ]
      methods : [
        "arc"
        "arcTo"
        "beginPath"
        "bezierCurveTo"
        "clearRect"
        "clip"
        "closePath"
        "drawImage"
        "fill"
        "fillRect"
        "fillText"
        "lineTo"
        "moveTo"
        "putImageData"
        "quadraticCurveTo"
        "rect"
        "restore"
        "rotate"
        "save"
        "scale"
        "setLineDash"
        "setTransform"
        "stroke"
        "strokeRect"
        "strokeText"
        "transform"
        "translate"
      ]
      passthrough : [
        "createImageData"
        "createLinearGradient"
        "createPattern"
        "createRadialGradient"
        "getImageData"
        "getLineDash"
        "isPointInPath"
        "isPointInStroke"
        "measureText"
      ]
    }
  )
)

if typeof define == "function" and define.amd
  define(["_"], -> FluentCanvas)
else
  this.FluentCanvas = FluentCanvas
