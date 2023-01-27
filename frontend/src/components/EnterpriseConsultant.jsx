import React, { useState, useEffect } from "react";
import {
  IntlProvider,
  LocalizationProvider,
  loadMessages,
} from "@progress/kendo-react-intl";
import { Grid, GridColumn } from "@progress/kendo-react-grid";
import frMessages from "../utils/fr.json";
import { GetFirmOffer } from "../apis/firmOfferApi";
import gridEntreprises from "../utils/gridEntreprises";
import "../styles/EnterpriseConsultant.css";
import search from "../assets/img/logo_search_enterprises.png";
import GridEntreprises from "./GridEntreprises";

const EnterpriseConsultant = () => {
  const [myEnterprises, setMyEnterprises] = useState([]);
  const [searchValue, setSearchValue] = useState("");

  const getFirmOffer = async () => {
    setMyEnterprises(await GetFirmOffer());
  };

  useEffect(() => {
    getFirmOffer();
  }, []);

  const handleSearch = (event) => {
    setSearchValue(event.target.value);
  };

  const handleSubmit = (event) => {
    event.preventDefault();
  };

  const filteredFirms = myEnterprises.filter((firm) => {
    return firm.name.toLowerCase().includes(searchValue.toLowerCase());
  });

  return (
    <div className="container_enterprise_body">
      <div className="container_enterprise">
        <div className="enterprise-box">
          <div className="enterprise-details">
            <h2>Mes entreprises</h2>
            <div className="search-box-enterprise">
              <form onSubmit={handleSubmit}>
                <input
                  className="search-input-enterprise"
                  type="text"
                  placeholder="Rechercher une entreprise"
                  value={searchValue}
                  onChange={handleSearch}
                />
                <img
                  src={search}
                  alt="search"
                  className="logo-search-enterprises"
                />
              </form>
            </div>
          </div>
          <div className="dashboard_body">
            <Grid data = {gridEntreprises} />
            <div className="dashboard_enterprises">
              <LocalizationProvider language="fr-FR">
                <IntlProvider locale="fr">
                  <Grid
                    className="grid_enterprise"
                    data={filteredFirms.slice(page.skip, page.take + page.skip)}
                    skip={page.skip}
                    take={page.take}
                    total={filteredFirms.length}
                    pageable
                    onPageChange={pageChange}
                  >
                    <GridColumn
                      title="Id entreprise"
                      field="firm_id"
                      width="70vw"
                    />
                    <GridColumn
                      title="Nom de l'entreprise"
                      field="name"
                      width="300vw"
                    />
                    <GridColumn title="Email" field="email" width="300vw" />
                    <GridColumn title="Ville" field="city" width="300vw" />
                    <GridColumn
                      title="Nombre d'annonces"
                      field="nbreoffers"
                      width="150vw"
                    />
                  </Grid>
                </IntlProvider>
              </LocalizationProvider>
            </div>
            <GridEntreprises filteredFirms={filteredFirms} />
          </div>
        </div>
      </div>
    </div>
  );
};

export default EnterpriseConsultant;
