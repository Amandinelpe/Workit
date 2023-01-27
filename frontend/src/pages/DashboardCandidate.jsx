import { React, useState } from "react";
import { motion } from "framer-motion";
import NavBar from "../components/NavBar";
import BoxCandidate from "../components/BoxCandidate";
import Footer from "../components/Footer";
import Dashboard from "../components/Dashboard";
import DashboardApplications from "../components/DashboardApplications";
import MyProfile from "../components/MyProfile";
import Chat from "../components/Chat";
import DashboardAlerts from "../components/DashboardAlerts";
import "../styles/DashboardCandidate.css";

const DashboardCandidate = () => {
  const [content, setContent] = useState("dashboard");

  const handleContent = (ctn) => {
    setContent(ctn);
  };

  const renderSwitch = () => {
    switch (content) {
      case "Mes informations personnelles":
        return <MyProfile />;
      case "Je rentre en contact avec un.e consultant.e":
        return <Chat />;
      case "Mes candidatures":
        return <DashboardApplications />;
      case "Mes alertes":
        return <DashboardAlerts />;
      default:
        return <Dashboard />;
    }
  };

  return (
    <motion.div
      initial={{ x: 100, opacity: 0 }}
      animate={{ x: 0, opacity: 1 }}
      exit={{ x: -100, opacity: 0 }}
      transition={{ duration: 0.5 }}
    >
      <NavBar />
      <div className="mydashboard_body">
        <BoxCandidate handleContent={handleContent} />
      </div>
      {renderSwitch()}
      <div>
        <Footer />
      </div>
    </motion.div>
  );
};

export default DashboardCandidate;
