const bsconfig = require('./bsconfig.json');
const fs = require("fs");

const transpileModules = ["bs-platform"].concat(bsconfig["bs-dependencies"]);
const withTM = require("next-transpile-modules")(transpileModules);


function patchResDeps() {
  ["bs-platform"].concat(bsconfig["bs-dependencies"]).forEach((bsDep) => {
    fs.writeFileSync(`./node_modules/${bsDep}/index.js`, "");
    const json = require(`./node_modules/${bsDep}/package.json`);
    json.main = "index.js";
    fs.writeFileSync(
      `./node_modules/${bsDep}/package.json`,
      JSON.stringify(json, null, 2)
    );
  });
}
patchResDeps(); // update package.json and create empty `index.js` before transpiling

const config = {
  target: "serverless",
  pageExtensions: ["jsx", "js"],
  transpileModules: ["bs-platform"].concat(bsconfig["bs-dependencies"]),
  env: {
    ENV: process.env.NODE_ENV,
  },
  webpack: (config, options) => {
    const { isServer } = options;
    if (!isServer) {
      // We shim fs for things like the blog slugs component
      // where we need fs access in the server-side part
      config.node = {
        fs: false
      }
    }

    // We need this additional rule to make sure that mjs files are
    // correctly detected within our src/ folder
    config.module.rules.push({
      test: /\.m?js$/,
      use: options.defaultLoaders.babel,
      exclude: /node_modules/,
      type: "javascript/auto",
      resolve: {
        fullySpecified: false,
      }
    });
    return config
  },
  // Might need to move this to nginx or other config,
  // if deployment moves from Vercel to Netlify
  async redirects() {
    return [
      // Temporary redirects


      {
        source: '/play/homeround',
        destination: 'https://play.tailwindcss.com/LGDZzOzegQ?layout=preview',
        permanent: false,
      },
      /* sub-components */
      {
        source: '/play/header',
        destination: 'https://play.tailwindcss.com/n8u5qc7Ax7?layout=preview',
        permanent: false,
      },



      {
        source: '/play/community/aroundweb',
        destination: 'https://play.tailwindcss.com/acoEG2wmOA?layout=preview',
        permanent: false,
      },
      {
        source: '/play/community/news',
        destination: 'https://play.tailwindcss.com/wu15fDmzPY?layout=preview',
        permanent: false,
      },


      {
        source: '/play/industry/users',
        destination: 'https://play.tailwindcss.com/fnsSlFX517?layout=preview',
        permanent: false,
      },

      {
        source: '/play/resources/mediaarchive',
        destination: 'https://play.tailwindcss.com/SaRPEIdpPS?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/paperarchive',
        destination: 'https://play.tailwindcss.com/wngTIsLJL2?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/language',
        destination: 'https://play.tailwindcss.com/3nuPDOZsGN?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/applications',
        destination: 'https://play.tailwindcss.com/FJtzT7lSkW?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/installocaml',
        destination: 'https://play.tailwindcss.com/m88PnynAmq?layout=preview',
        permanent: false,
      },


      // Permanent redirects
      /*
      {
        source: '/releases/latest',
        destination: '/releases/4.11.1',
        permanent: false,
      }
      */
    ]
  },
  future: {
    webpack5: true
  }
};

module.exports = withTM(config);

