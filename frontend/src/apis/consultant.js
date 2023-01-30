import axios from "axios";

const apiUrl = import.meta.env.VITE_BACKEND_URL;

const postApi = (finalUrl, credentials) => {
  return axios
    .post(apiUrl + finalUrl, credentials)
    .then((response) => response.data);
};

// eslint-disable-next-line import/prefer-default-export
export const loginConsultant = (credentials) => {
  return postApi("login/", credentials);
};

export const CreateConsultant = (profile) => {
  return axios
    .post(apiUrl + "consultant/createprofile", profile)
    .then((response) => response.data)
    .catch((err) => console.log(err));
};

// eslint-disable-next-line import/prefer-default-export
export const DeleteConsultant = (id) => {
  return axios
    .delete(apiUrl + "consultant/" + id)
    .then((response) => response)
    .catch((err) => console.log(err));
};
