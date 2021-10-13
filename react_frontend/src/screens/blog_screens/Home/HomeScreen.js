import React from "react";
import Header from "../../../components/Header/Header";
import Posts from "../../../components/Posts/Posts";
import Sidebar from "../../../components/Sidebar/Sidebar";
import "./home.css";

const HomeScreen = () => {
  return (
    <>
      <Header />
      <div className="home">
        <Posts />
        <Sidebar active="true" />
      </div>
    </>
  );
};

export default HomeScreen;
