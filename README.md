# you-dont-know-js-epub
"You Don't Know JS Yet" (1st/2nd editions) ePub generator.

- Original book series by Kyle Simpson:
[2nd Edition](https://github.com/getify/You-Dont-Know-JS/tree/2nd-ed) (in progress) and [1st Edition](https://github.com/getify/You-Dont-Know-JS/blob/1st-ed/README.md).
- Inspired by gist:
[bmaupin/6e3649af73120fac2b6907169632be2c](https://gist.github.com/bmaupin/6e3649af73120fac2b6907169632be2c)

## Generate the ePub

Run with Docker:

```sh
# force update to the latest image
docker pull gongzhang/ydkjs-epub

# generate epub into output folder
docker run --rm -it -v $PWD/output:/root/output gongzhang/ydkjs-epub
```

Then the generated epub files are in `output` folder: 

![](res/epub.png)

Note that the first two books (*Get Started* and *Scope & Closures*) are from the latest 2nd edition, and the rest are from the 1st edition.

## Customization

First, recursively clone this repo to your machine:

```sh
git clone --recursive git@github.com:gongzhang/you-dont-know-js-epub.git
```

Then you can:
- Modify `epub.css` to customize the style.
- Read `gen.sh` to understand how the generator works.
- Fetch the latest book content using git submodule command under `1st-edition` and `2nd-edition` directory.

Finally, rebuild the Docker image and generate your own version epubs:

```sh
docker build -t ydkjs-epub .
docker run --rm -it -v $PWD/output:/root/output ydkjs-epub
```

## Known Issues & TODOs

- Support syntax highlighing (The latest pandoc *does* support syntax highlight, but the genrated ePub cannot be correctly rendered by iBooks app.)
