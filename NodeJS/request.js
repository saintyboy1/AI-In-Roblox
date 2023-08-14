// REQUEST.JS
// Author: saintyboy1

const axios = require('axios');

let params = {
  key: 'YOUR_API_KEY',
  input: 'YOUR_INPUT'
};

axios.get('https://api.s41nt.xyz', { params })
  .then(response => {
    const data = response.data
    console.log(data.input_message);
  })
  .catch(error => {
    console.log('Could not connect to the API')
  });

// This code makes a simple request using NodeJS to the endpoint. It would be similar if you decided to use python too.
