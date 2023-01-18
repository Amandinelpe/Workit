import React, { useEffect, useState } from "react";
import PropTypes from "prop-types";
import axios from "axios";
import "../styles/Filter.css";

const Filter = ({ table, name }) => {
  const [filter, setFilter] = useState([]);

  const getFilter = () => {
    const apiUrl = import.meta.env.VITE_BACKEND_URL;
    axios
      .get(`${apiUrl}${table}/`)
      .then((res) => {
        if (res.status === 200) {
          // eslint-disable-next-line no-undef
          setFilter(res.data);
        }
      })
      .catch((err) => console.warn(err.response.data.message));
    // event.preventDefault();
  };

  useEffect(() => {
    getFilter();
  }, []);

  return (
    <div className="Filter_box">
      <div className="titleblock_box">
        <h2 className="title_box">{name}</h2>
      </div>
      <div className="body_box">
        <fieldset>
          <div>
            <input
              type="radio"
              id="all"
              name="all"
              value="*"
              className="input_box"
            />
            <label htmlFor="all">Tous</label>
            <br />
          </div>
          {filter.map((item) => (
            <div>
              <input
                type="radio"
                id={item.name}
                name={item.name}
                value={item.name}
                className="input_box"
              />
              <label htmlFor="all">{item.name}</label>
              <br />
            </div>
          ))}
        </fieldset>
      </div>
    </div>
  );
};

export default Filter;

Filter.propTypes = {
  table: PropTypes.string.isRequired,
  name: PropTypes.string.isRequired,
};
