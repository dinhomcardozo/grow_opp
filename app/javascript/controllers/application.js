import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";

const application = Application.start();
const context = require.context("./", true, /\.js$/); // Carrega todos os arquivos .js nesta pasta
application.load(definitionsFromContext(context));