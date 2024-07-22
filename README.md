# duclos-cavalcanti.github.io

## Introduction
Source code to my personal website, currently served via _Github Pages_ at [https://www.duclos.dev](https://www.duclos.dev). 
The webpage is generated via `hugo` using the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme.

## Background

The purpose of this repository is not only to easily deploy a static website, but also serve as a minor working example of how one can start a
blog easily. The pro's to that approach are nothing other than just having a better understanding of how the website is created 
and how one can modify it further. Generally, to deploy a static website of any kind, the steps can be generalized as such:

* Structure website: *(manually or ssg)*
* Obtain a domain.
* Install/Deploy a Web Server: *(Nginx, Apache, etc)*
* Upload to Server/Cloud platform service *(Optionally Netlify)*.
* Optionally set up SSL certificates for HTTPS.

Through `hugo` it becomes easier to generate a static website based on markdown files. In addition to that, _Github Pages_ facilitates the rest 
leaving us to only specify a URL and place the content correctly on the specified branch.

## Dependencies 
- [`hugo`](https://gohugo.io/getting-started/quick-start/)
- [`docker`](https://docs.docker.com/engine/install/) *(optional)* 


**Debian/Ubuntu** 
1. Installation
```sh 
sudo apt install hugo texlive-latex-base texlive-xetex
# texlive-latex-base texlive-xetex: for resume/cover letters
# docker: enables easy and portable workflows
```

2. Setup 
```sh
hugo new site website --format yaml
cd website/themes && git clone git clone https://github.com/mrmierzejewski/hugo-theme-console
```

## Usage

**Build**
  ```sh
  make
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
These files are released under the GPL 3.0 license. See [LICENSE](LICENSE).

## Thanks
* [ssg](https://github.com/andrew-ayers/ssg)
* [altacv](https://github.com/liantze/AltaCV?tab=readme-ov-file)

## References
* [HTML Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [CSS Mozilla](https://developer.mozilla.org/en-US/docs/Web/CSS)

