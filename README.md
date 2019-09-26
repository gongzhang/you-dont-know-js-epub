# you-dont-know-js-epub
"You Don't Know JS" (2nd Edition) ePub generator.

- Original book series:
[getify/You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS/tree/2nd-ed)

- Inspired by gist:
[bmaupin/6e3649af73120fac2b6907169632be2c](https://gist.github.com/bmaupin/6e3649af73120fac2b6907169632be2c)

## Get the Books

Run with Docker:

```sh
docker run --rm -it --name ydkjs-epub -p 80:80 gongzhang/ydkjs-epub
```

Open http://localhost in browser: 

![](res/webpage.png)

Download and enjoy!

![](res/epub.png)

## DIY

Clone this repo and build with docker:

```sh
# generate epubs from the original repo. see Dockerfile.
docker build -t ydkjs-epub .
```

Tips:

- Modify `RUN git clone ...` command in `Dockerfile` to generate different editions of the books.
- Modify `epub.css` to customize style of the book which fits your e-book reader.
