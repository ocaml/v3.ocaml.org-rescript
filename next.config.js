const bsconfig = require('./bsconfig.json');
const withCSS = require('@zeit/next-css');

const transpileModules = ["bs-platform"].concat(bsconfig["bs-dependencies"]);
const withTM = require("next-transpile-modules")(transpileModules);

// TODO: why does rescxript lang define plugin locally
const withMdx = require("@next/mdx")({
  extension: /\.mdx?$/,
});

const config = {
  target: "serverless",
  pageExtensions: ["jsx", "js", "mdx"],
  transpileModules: ["bs-platform"].concat(bsconfig["bs-dependencies"]),
  env: {
    ENV: process.env.NODE_ENV,
  },
};

module.exports = withMdx(withTM(withCSS(config)));

