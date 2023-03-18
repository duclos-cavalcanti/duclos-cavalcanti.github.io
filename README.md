# duclos-cavalcanti.github.io

## Introduction
Source code to my personal website, currently served through [Github Pages](https://pages.github.com/) and can be reached at [www.ducloscavalcanti.com](www.ducloscavalcanti.com). The webpage is deployed through a simple `bash` script which acts as a handy wrapper around the `pandoc` tool, generating html files 
based on templates and given markdown pages. Please feel free to take snippets, ideas and even the project itself 
to create your own workflow. If so, please reference this work, it would be much appreciated.

## Background and Motivation

The purpose of this repository is not only to easily deploy a static website, but also serve as a minor working example of how one can start a
blog with no use of frameworks. The pro's to that approach are nothing other than just having a better understanding of how the website is created 
and how one can modify it further. Generally, to deploy a static website of any kind, the steps can be generalized as such:

* Structure website: *(manually or ssg)*
* Obtain a domain.
* Install/Deploy a Web Server: *(Nginx, Apache, etc)*
* Upload to server/use cloud platform service *(Netlify)*.
* Optionally set up SSL certificates for HTTPS.

Through writing files in [pandoc-markdown](https://pandoc.org/MANUAL.html#pandocs-markdown) leveraging the [pandoc](https://pandoc.org/MANUAL.html)
tool, it becomes much easier and flexible to generate a static website based on markdown files. Also, after the initial learning barrier,
the possibilities of extension can become greater than a given number of templates supported by a typical static site generator. 

Additionally, github pages automates part of this process as it takes care of the webserver and cloud
portion of this workflow. The user only needs to make available their static web data in a 
specified location, normally triggered by a branch push and github will take care of serving 
your website through their servers. There is also the possibility 
of specifying an additional domain name so that your webpage can be accessed through a different `URL`.

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
other hand is not only vital but also is doing honestly most of the heavy lifting. It converts the `markdown` 
files into `html`, enables the use of templates and supports other features through *metadata* within the 
markdown files.

## Usage

The snippet below serves as an illustration to how the project is organized. The markdown files are located 
within the `pages` folder, HTML Templates within `templates` and the necessary resources for the website 
are inside `assets`. The `build.sh` script leveraged the already mentioned `pandoc` tool that makes use of templates 
to stitch together the web pages based on a given markdown file, a header, a footer and a template file. After the script is 
ran the static website data can be found within `public`, which is then through the *git subtree split* command used to push its 
contents onto the **gh-pages** branch. This branch is watched by *github-pages* and is used to serve the website.

```sh 
.
├── assets
│   ├── css
│   │   └── style.css
│   ├── images
│   │   ├── github.svg
│   │   ├── gmail.svg
│   │   ├── linkedin.svg
│   │   └── photo.jpg
│   └── pdfs
│       └── resume.pdf
├── build.sh
├── CNAME
├── docs
├── LICENSE
├── Makefile
├── pages
│   ├── index.md
│   ├── about
│   ├── blog
│   ├── books
│   └── projects
├── public
├── README.md
└── templates
    ├── bottom.html
    ├── pandoc.html
    └── top.html

12 directories, 15 files
```

**Build**
  ```sh
  make
  # or make build
  ```

**Deploy**
  ```sh
  make deploy
  ```

**Serve Locally**
  ```sh
  make serve
  ```

**Stop local serving**
  ```sh
  make stop
  ```

## License
These files are released under the MIT license. See [LICENSE](LICENSE).

## Thanks
* [ssg](https://github.com/andrew-ayers/ssg)
* [pandoc-ssg](https://github.com/kevin-nel/pandoc-ssg)
* [pandoc-templates](https://github.com/kjhealy/pandoc-templates)

## References
* [HTML Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [CSS Mozilla](https://developer.mozilla.org/en-US/docs/Web/CSS)

