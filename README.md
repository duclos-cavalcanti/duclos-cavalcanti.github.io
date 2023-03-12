# duclos-cavalcanti.github.io

## Introduction
Source code to my personal website, currently served through [Github Pages](https://pages.github.com/) and can be reached at [www.ducloscavalcanti.com](www.ducloscavalcanti.com).
The purpose of this repository is not only to easily deploy a static website, but also serve as a minor working example of how one can start a
blog with no use of frameworks.

Through writing files in [pandoc-markdown](https://pandoc.org/MANUAL.html#pandocs-markdown) leveraging the [pandoc](https://pandoc.org/MANUAL.html)
tool, it becomes much easier, flexible and extensible to generate a static website based on markdown files. This project uses pandoc and a self-written
`bash` script to automate the process of generating my personal website in an efficient and easy to maintain fashion.

Please feel free to take snippets, ideas 
and even the project itself to create your own workflow. If so, please reference this work, it would be much appreciated.

## Motivation
Generally, to deploy a static website of any kind, the
steps can be generalized as such:

* Structure website:
  - manually *(HTML, CSS)*
  - or through a static site generator.
* Obtain a domain.
* Install/Deploy a Web Server (Nginx, Apache, etc).
* Upload to server or use a cloud platform service such as Netlify.
* Optionally set up SSL certificates for HTTPS.

Github pages automates part of this process as it takes care of the webserver and cloud
portion of this workflow. The user only needs to make available their static web data in a 
specified location, normally triggered by a branch push and github will take care of serving 
your website through their servers through the repo's given domain name. There is also the possibility 
of specifying an additional domain name so that your webpage can be accessed through a different URL.

## Dependencies 
- [`pandoc`](https://pandoc.org/MANUAL.html)
- [`Docker`](https://docs.docker.com/engine/install/) *(optional)* 

**Debian/Ubuntu** 
```sh 
sudo apt install pandoc
```

**Arch Linux** 
```sh 
sudo pacman -S pandoc
```

Docker is only needed to be able to serve your website locally, so one can visualize its deployment
either before shooting it off to github pages or one's own personal deployment method. Pandoc on the 
other hand is a vital and honestly is doing most of the heavy lifting. It not only converts the `markdown` 
files into `html`, but also uses templates and supports the use of snippets through *metadata*.

## Usage

Before running the make targets, an overview of the worfklow will be illustrated, serving as 
a way to explain what is being done, but also be useful to those who wish to nitpick the script 
apart and hack up their own.


**Build/Deploy**
  ```sh
  make build
  ```

**Serve Locally**
  ```sh
  make serve
  ```

## License
These files are released under the MIT license. See [LICENSE](LICENSE).

## Thanks
* [pandoc-ssg](https://github.com/kevin-nel/pandoc-ssg)
* [ssg](https://github.com/andrew-ayers/ssg)
* [sebastian-tronto](https://sebastiano.tronto.net/blog/2022-08-14-website/)

## References
* [HTML & CSS Course](https://www.youtube.com/watch?v=G3e-cpL7ofc)
* [HTML Tutorial](https://www.youtube.com/watch?v=qz0aGYrrlhU)

