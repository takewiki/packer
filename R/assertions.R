# is npm installed and can it be found?
has_npm <- function(){
  length(npm_find()) > 0
}

assertthat::on_failure(has_npm) <- function(call, env){
  stop("Cannot find `npm`, are you sure it is installed?", call. = FALSE)
}

# check that argument is not missing
not_missing <- function(x){
  !missing(x)
}

assertthat::on_failure(not_missing) <- function(call, env){
  sprintf("Missing `%s`", deparse(call$x))
}

# check that it is a package
is_package <- function(){
  desc <- fs::file_exists("DESCRIPTION")
  ns <- fs::file_exists("NAMESPACE")

  all(desc, ns)
}

assertthat::on_failure(is_package) <- function(call, env){
  stop("This function must be called from within an R package.")
}

# check that scaffold is present
has_scaffold <- function(){
  package_json <- fs::file_exists("package.json")
  src_dir <- fs::dir_exists("srcjs")
  config <- fs::file_exists("webpack.common.js")

  all(package_json, src_dir, config)
}

assertthat::on_failure(has_scaffold) <- function(call, env){
  stop("No scaffold found, see the `scaffold_*` family of functions", call. = FALSE)
}

# check that it is a golem package
is_golem <- function(){
  dev <- fs::dir_exists("dev")
  config <- fs::file_exists("inst/golem-config.yml")

  all(dev, config)
}

assertthat::on_failure(is_golem) <- function(call, env){
  stop("Not a golem app, see `golem::create_golem`", call. = FALSE)
}

# file does not exist
not_exists <- function(path){
  !fs::file_exists(path)
}

assertthat::on_failure(not_exists) <- function(call, env){
  msg <- sprintf("`%s` already exists", deparse(call$path))
  stop(msg, call. = FALSE)
}

# check that scaffold name is valid
is_name_valid <- function(name){
  has_spaces <- !grepl("[:space:]", name)

  !any(has_spaces)
}

assertthat::on_failure(is_name_valid) <- function(call, env){
  sprintf("%s is not a valid name", deparse(call$name))
}
