# you-dont-know-js-epub
"You Don't Know JS" (2nd Edition) ePub generator.

- Original book series:
[getify/You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS/tree/2nd-ed)

- Inspired by gist @bmaupin:
[bmaupin/6e3649af73120fac2b6907169632be2c](https://gist.github.com/bmaupin/6e3649af73120fac2b6907169632be2c)

## Getting Started

Build and run with Docker:

```
docker build -t ydkjs-epub https://github.com/gongzhang/you-dont-know-js-epub.git
docker run --rm -it --name ydkjs-epub -p 80:80 ydkjs-epub
```

Open http://localhost in browser: 

![](res/webpage.png)

Download and enjoy!

![](res/epub.png)

## Customization

See `./epub.css` and `gen.sh`.
