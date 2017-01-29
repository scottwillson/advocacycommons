export default function postData(url) {
  return fetch(url, {
    method: 'POST',
    headers: {
      Accept: 'application-json',
      'Content-Type': 'application-json',
    },
  })
    .then(response => response.json())
    .then(responseJson => responseJson)
    .catch(error => (error));
}
