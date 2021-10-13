import React from "react";
import "./sidebar.css";

//if active is true then sidebar will stay after the main content on small screen

const Sidebar = ({ active }) => {
  return (
    <div className={`sidebar ${active ? "active" : ""}`}>
      <div className="sidebarItem">
        <span className="sidebarTitle">About Me</span>
        <img
          className="sidebarImage"
          src="https://scontent.fdac39-1.fna.fbcdn.net/v/t1.6435-9/218198816_1813674812138945_2224349374655338452_n.jpg?_nc_cat=110&amp;ccb=1-5&amp;_nc_sid=174925&amp;_nc_eui2=AeE1e6H_rq3CSHuxxlONRQaIamdX4jWLK5JqZ1fiNYsrkrhtPhltIEBxLHej4RtsLSArsK5VlMMdxW0RxmKK43Vk&amp;_nc_ohc=Q6ZOEqA-XekAX8n5Adk&amp;tn=sD1WELh04pvsPaVN&amp;_nc_ht=scontent.fdac39-1.fna&amp;oh=4636df734aba165e5925aa7daa294e7a&amp;oe=61883AAD"
          alt=""
        ></img>
        <p>
          Lorem Ipsum is simply dummy text of the printing and typesetting
          industry. Lorem Ipsum has been the industry's standard dummy text ever
          since the 1500s, when an unknown printer took a galley of type and
          scrambled it to make a type specimen book. It has survived not only
          five centuries, but also the leap into electronic typesetting,
          remaining essentially unchanged. It was popularised in the 1960s with
          the release of Letraset sheets containing Lorem Ipsum passages, and
          more recently with desksidebar publishing software like Aldus
          PageMaker including versions of Lorem Ipsum.
        </p>
      </div>
      <div className="sidebarItem">
        <span className="sidebarTitle">Catagories</span>
        <ul className="sidebarList">
          <li className="sidebarListItem">Life</li>
          <li className="sidebarListItem">Music</li>
          <li className="sidebarListItem">Movie</li>
          <li className="sidebarListItem">Sports</li>
          <li className="sidebarListItem">Tech</li>
        </ul>
      </div>
      <div className="sidebarItem">
        <span className="sidebarTitle">Follow Us</span>
        <div className="sidebarSocial">
          <i className="sidebarIcon fas fa-blog"></i>
          <i className="sidebarIcon fab fa-twitter-square"></i>
          <i className="sidebarIcon fab fa-facebook"></i>
          <i className="sidebarIcon fab fa-instagram"></i>
        </div>
      </div>
    </div>
  );
};

export default Sidebar;
