chalk   = require("chalk")
asciify = require("asciify")

asteriks = Array(90).join("*")

log = {
  newLine: (num = 1) ->
    n = Array(num).join("\n")
    console.log(n)
}

["red", "yellow", "cyan", "blue"].forEach (color) ->
  log[color] = (msg) ->
    console.log chalk[color](msg)

output = (res) ->
  log.red(asteriks)
  log.red(res)
  log.yellow("This package has been renamed to: #{chalk.cyan("cypress-cli")}")
  log.newLine()
  log.yellow("Please update your scripts to: #{chalk.cyan("npm install -g cypress-cli")}")
  log.newLine(3)
  log.yellow("The #{chalk.cyan("cypress")} package will soon install the desktop source code, not the CLI Tools.")
  log.newLine()
  log.yellow("You can read more about this change and the upcoming open source release here:")
  log.cyan("https://on.cypress.io/deprecated-cypress-package-renamed")
  log.newLine()
  log.red(asteriks)
  log.newLine()

show = (fn) ->
  asciify "warning", {font: "starwars"}, (err, res) ->
    output(res)

    fn() if fn

## if we're being called directly
## then just show the deprecation
if require.main is module
  show()
else
  ## else export this fn
  module.exports = show