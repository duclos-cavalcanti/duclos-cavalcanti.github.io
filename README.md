# duclos-cavalcanti.github.io

## Introduction
Source code to my personal website, currently served via _Github Pages_ at [https://www.duclos.dev](https://www.duclos.dev). 
The webpage is deployed through a simple `bash` script which acts as a handy wrapper around the `pandoc` tool, generating html files 
based on templates and given markdown pages. Please feel free to take snippets and ideas. 
If so, please reference this work, it would be much appreciated.

## Background

The purpose of this repository is not only to easily deploy a static website, but also serve as a minor working example of how one can start a
blog with no use of frameworks. The pro's to that approach are nothing other than just having a better understanding of how the website is created 
and how one can modify it further. Generally, to deploy a static website of any kind, the steps can be generalized as such:

* Structure website: *(manually or ssg)*
* Obtain a domain.
* Install/Deploy a Web Server: *(Nginx, Apache, etc)*
* Upload to Server/Cloud platform service *(Optionally Netlify)*.
* Optionally set up SSL certificates for HTTPS.

Through writing files in [pandoc-markdown](https://pandoc.org/MANUAL.html#pandocs-markdown) leveraging the [pandoc](https://pandoc.org/MANUAL.html)
tool, it becomes easier to generate a static website based on markdown files. In addition to that, _Github Pages_ facilitates the rest 
leaving us to only specify a URL and place the content correctly on the specified branch.

## Dependencies 
- [`pandoc`](https://pandoc.org/MANUAL.html)
- [`wkhtmltopdf`](https://wkhtmltopdf.org/)
- [`Docker`](https://docs.docker.com/engine/install/) *(optional)* 

**Debian/Ubuntu** 
```sh 
sudo apt install pandoc wkhtmltopdf
sudo apt install texlive-latex-base texlive-xetex
# need to install docker and add yourself to docker group
```

Docker is only needed to be able to serve your website locally, so one can visualize its deployment
either before shooting it off to github pages or one's own personal deployment method.

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
These files are released under the MIT license. See [LICENSE](LICENSE).

## Thanks
* [ssg](https://github.com/andrew-ayers/ssg)
* [pandoc-ssg](https://github.com/kevin-nel/pandoc-ssg)
* [pandoc-templates](https://github.com/kjhealy/pandoc-templates)
* [altacv](https://github.com/liantze/AltaCV?tab=readme-ov-file)

## References
* [HTML Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML)
* [CSS Mozilla](https://developer.mozilla.org/en-US/docs/Web/CSS)

