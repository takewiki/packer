<div align="center">

<!-- badges: start -->
<!-- badges: end -->

[Website](http://packer.john-coene.com/) | [Installation](https://packer.john-coene.com/#/guide/installation)

An opinionated framework for using JavaScript with R.

# packer

</div>


## Usage

At its core packer consists of functions to scaffold R packages powered by webpack and npm, these take the form of scaffolds which are built on top of packages. All of the functions listed below need to be run from within an R package.

* `scaffold_widget` - Scaffold an [htmlwidgets](http://www.htmlwidgets.org/) with webpack.
* `scaffold_golem` - Use webpack with [golem](http://golemverse.org/).
* `scaffold_extension` - Scaffold a shiny extension, e.g.: [shinyjs](https://deanattali.com/shinyjs/) or [waiter](https://waiter.john-coene.com/).
* `scaffold_input` - Scaffold a custom shiny input, e.g.: [shinyWidgets](https://github.com/dreamRs/shinyWidgets).
* `scaffold_output` - Scaffold a custom shiny output.

## Example

Always start from an empty package and run `scaffold_*` to set up the required basic structure.

```r
packer::scaffold_input("increment")
```

Once the scaffold laid down you can either `bundle` the JavaScript or `watch` for changes as you develop it.

```r
packer::bundle()
```

You can then document and install the package to try it out.
