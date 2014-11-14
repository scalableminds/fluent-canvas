# Fluent Canvas

Chainable syntax for HTML5 Canvas. For readable barebone Canvas drawing.

Supports all the methods and properties from [MDN](https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D).


## Example
```
var radius = 100, startAngle = 0, endAngle = Math.PI * 1.5;
var context = FluentCanvas($("canvas"));

context
  .beginPath()
  .moveTo(radius, radius)
  .lineTo(
    radius * Math.cos(startAngle) + radius,
    radius * Math.sin(startAngle) + radius
  )
  .arc(radius, radius, radius, startAngle, endAngle)
  .closePath()
  .tap(function (fluentCanvas) {
    var gradientStyle =
      context.createLinearGradient(0, 0, 0, 2 * radius);
    gradientStyle.addColorStop(0, "rgb(0, 0, 0)");
    gradientStyle.addColorStop(1, "rgb(255, 255, 255)");
    fluentCanvas.fillStyle(gradientStyle);
  })
  .fill();
```

## How it works
All methods and properties of the context are wrapped in a function that returns a chain object. All original arguments are passed through. For properties the first argument will be set.

For some methods, like `createImageData` or `createLinearGradient`, you actually care about the original return value. So they won't return the chain object, but pass through their actual return values.

## Constructor
The constructor accepts either a `CanvasRenderingContext2D` or a `HTMLCanvasElement` or a jQuery object with a `<canvas>` element as first item.

## Specials

### tap(callback)

Tap into the chain and run a callback. The callback get two arguments `(fluentCanvas, context)` where `fluentCanvas` is the current chain and `context` is the raw `CanvasRenderingContext2D`. The callback doesn't need to return anything. The tap function returns the current chain.

### clearAll()

Deletes everything on the canvas. Works even if the canvas is transformed.

### context
Access to the raw `CanvasRenderingContext2D`.

## Authors
[Norman Rzepka](http://github.com/normanrz), [scalable minds](http://scm.io/)

## LICENSE
MIT
