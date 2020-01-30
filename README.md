# you-dont-know-js-epub
"You Don't Know JS Yet" (2nd Edition) ePub generator.

- Original book series:
[getify/You-Dont-Know-JS](https://github.com/getify/You-Dont-Know-JS/tree/2nd-ed)

- Inspired by gist:
[bmaupin/6e3649af73120fac2b6907169632be2c](https://gist.github.com/bmaupin/6e3649af73120fac2b6907169632be2c)

> NOTE: The 2nd edition of the book series is still a WORK IN PROGRESS.

## Get the Books

Run with Docker:

```sh
docker run --rm -it --name ydkjs-epub -p 80:80 gongzhang/ydkjs-epub
```

Open http://localhost in browser: 

![](res/webpage.png)

Download and enjoy!

![](res/epub.png)

## Customization

Recursively clone this repo and build with docker:

```sh
git clone --recursive git@github.com:gongzhang/you-dont-know-js-epub.git

# generate epubs from the original repo. see Dockerfile.
docker build -t ydkjs-epub .
```

## Known Issues & TODOs

- can not display images and figures
- does support syntax highlighing
- book title should be "You Don't Know JS __Yet__"
- reduce hardcoding in `gen.sh` script
