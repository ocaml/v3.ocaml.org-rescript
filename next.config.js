const bsconfig = require('./bsconfig.json');

const transpileModules = ["bs-platform"].concat(bsconfig["bs-dependencies"]);
const withTM = require("next-transpile-modules")(transpileModules);

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
        fs: 'empty'
      }
    }
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
        source: '/play/community/opportunities',
        destination: 'notstarted',
        permanent: false,
      },
      {
        source: '/play/community/news',
        destination: 'https://play.tailwindcss.com/wu15fDmzPY?layout=preview',
        permanent: false,
      },
      {
        source: '/play/community/newsarchive',
        destination: 'https://play.tailwindcss.com/DAVx1bUei3?layout=preview',
        permanent: false,
      },


      {
        source: '/play/industry/users',
        destination: 'https://play.tailwindcss.com/fnsSlFX517?layout=preview',
        permanent: false,
      },
      {
        source: '/play/industry/whatisocaml',
        destination: 'notstarted',
        permanent: false,
      },
      {
        source: '/play/industry/successstories',
        destination: 'notstarted',
        permanent: false,
      },


      {
        source: '/play/resources/mediaarchive',
        destination: 'https://play.tailwindcss.com/SaRPEIdpPS?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/tutorials',
        destination: 'https://play.tailwindcss.com/TZiQsbetpO?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/books',
        destination: 'https://play.tailwindcss.com/tSiJwFvjEn?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/archive',
        destination: 'https://play.tailwindcss.com/Y1ABhSzyna?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/paperarchive',
        destination: 'https://play.tailwindcss.com/wngTIsLJL2?layout=preview',
        permanent: false,
      },
      {
        source: '/play/resources/releases',
        destination: 'notstarted',
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


      {
        source: '/play/legal/privacy',
        destination: 'notstarted',
        permanent: false,
      }


      // Permanent redirects
      /*
      {
        source: '/releases/latest',
        destination: '/releases/4.11.1',
        permanent: false,
      }
      */
    ]
  }
};

module.exports = withTM(config);

