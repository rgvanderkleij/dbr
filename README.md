# dbz

A minimal R Shiny demo that displays a greeting using a name from a local configuration file.

## Configure the app

Create a `config.txt` file in the app directory. Put the name you want to display on the first line; the file is user-created and is not included in the repository. For example:

```text
Ada
```

The app shows that name in the page title and greets it. If the first line is empty, the greeting uses `world`. The app reports an error if the configuration file is missing.

By default, the app reads `config.txt` from its directory. Set the `DBR_CONFIG` environment variable to use a different file path.

## Run the app

Install R and the Shiny package, then run this from the repository directory:

```r
install.packages("shiny")
shiny::runApp()
```
