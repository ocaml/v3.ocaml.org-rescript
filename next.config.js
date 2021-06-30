const bsconfig = require('./bsconfig.json');

const transpileModules = ["bs-platform"].concat(bsconfig["bs-dependencies"]);
const withTM = require("next-transpile-modules")(transpileModules);

const config = {
  // By default Next.js will redirect urls with trailing slashes
  // to their counterpart without a trailing slash.
  // For example /about/ will redirect to /about.
  // `trailingSlash: true` configures this behavior to act the opposite way,
  // where urls without trailing slashes are redirected to their
  // counterparts with trailing slashes.
  trailingSlash: true,
  // We observed this undocumented behavior on Vercel, so
  // we are adding this rewrite to make the behavior explicit
  // and ensure local development and Vercel deployments
  // use the same rule.
  async rewrites() {
    return {
      fallback: [
        {
          source: '/:path*',
          destination: '/:path*/index.html',
        },
      ],
    }
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
        source: '/play/community/blog',
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
  }
};

module.exports = withTM(config);
