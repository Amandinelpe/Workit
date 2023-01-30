import { React, useEffect, useState } from "react";
import { GetAllConsultants } from "../utils/getAllConsultants";
import ConsultantLine from "./ConsultantLine";
import FicheConsultant from "./FicheConsultant";
import "../styles/ListeConsultants.css";

const ListeConsultants = () => {
  const [consultants, setConsultants] = useState([]);
  const [showFiche, setShowFiche] = useState(false);

  const getListAllConsultants = async () => {
    setConsultants(await GetAllConsultants());
  };

  const handleClick = () => {
    setShowFiche(!showFiche);
  };

  useEffect(() => {
    getListAllConsultants();
  }, [consultants]);

  return (
    <div className="liste_consultants">
      <div className="title_header_liste_consultants">
        <h1 className="title_liste_consultants">Mes consultant.e.s</h1>
      </div>
      <div className="liste_consultants_body">
        <div className="liste_consultants_header">
          <div className="consultants_button_section">
            <button
              type="button"
              className="button_add_consultant"
              onClick={handleClick}
            >
              AJOUTER
            </button>
            <button
              type="button"
              className="button_add_consultant"
              onClick={getListAllConsultants}
            >
              ACTUALISER
            </button>
          </div>
          <div className="consultants-liste">
            {consultants.map((consultant) => (
              <ConsultantLine key={consultant.id} consultant={consultant} />
            ))}
          </div>
        </div>
      </div>
      {showFiche && (
        <div className="fiche_consultant_component">
          {" "}
          <FicheConsultant showFiche={showFiche} setShowFiche={setShowFiche} />
        </div>
      )}
    </div>
  );
};

export default ListeConsultants;
