module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
  },
  mocha: {
  },
  compilers: {
    solc: {
      version: "0.5.16",
      docker: false
    }
  }
}