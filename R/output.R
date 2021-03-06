#' Scaffold Shiny Output
#' 
#' Sets basic structure for a shiny input.
#' 
#' @param name Name of output, will define internal name binding and CSS class.
#' @inheritParams scaffold_widget
#' 
#' @examples 
#' \dontrun{scaffold_output("display")}
#' 
#' @export 
scaffold_output <- function(name, edit = interactive()){
  # checks
  assert_that(not_missing(name))
  assert_that(has_npm())
  assert_that(is_package())
  assert_that(is_name_valid(name))

  # check that input does not already exist
  file_path <- sprintf("srcjs/outputs/%s.js", name)
  assert_that(not_exists(file_path))

  open_msg("shiny output", name)

  # init npm
  npm_init()

  # create base npm webpack files
  create_directory("srcjs/outputs", recurse = TRUE)

  # creating inst packge for assets
  create_directory("inst/packer", recurse = TRUE)

  # install dev webpack + cli
  webpack_install()

  # edit package.json
  npm_add_scripts()

  # create config file
  configure(
    name = name, 
    entry_dir = "outputs/", 
    output_dir = "./inst/packer", 
    externals = list(shiny = "Shiny", jquery = "jQuery")
  )

  # create srcjs and files
  output_js_files(name)

  # creating R files
  output_r_files(name)

  # ignore files and directories
  ignore_files()

  # use shiny
  use_pkgs("shiny", "htmltools")

  # edit
  edit_files(edit, sprintf("srcjs/outputs/%s.js", name), sprintf("R/%s.R", name))

  # wrap up
  end_msg()

  invisible(TRUE)
}