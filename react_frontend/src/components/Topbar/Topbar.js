import "./topbar.css";
import { Link } from "react-router-dom";

const Topbar = () => {
  const user = true;
  return (
    <>
      <div className="top">
        <div className="topLeft">
          <i className="topIcon fas fa-blog"></i>
          <i className="topIcon fab fa-twitter-square"></i>
          <i className="topIcon fab fa-facebook"></i>
          <i className="topIcon fab fa-instagram"></i>
        </div>
        <div className="topCenter">
          <ul className="topList">
            <li className="topListItem">
              <Link to="/" className="link">
                HOME
              </Link>
            </li>
            {user && (
              <li className="topListItem">
                <Link to="/settings" className="link">
                  PROFILE
                </Link>
              </li>
            )}
            <li className="topListItem">
              <Link to="/" className="link">
                CONTACT
              </Link>
            </li>
            {user && (
              <li className="topListItem">
                <Link to="/write" className="link">
                  WRITE
                </Link>
              </li>
            )}
            {user && (
              <li className="topListItem">
                <Link to="/" className="link">
                  LOGOUT
                </Link>
              </li>
            )}
          </ul>
        </div>
        <div className="topRight">
          {user ? (
            <img
              className="topImage"
              src="https://scontent.fdac39-1.fna.fbcdn.net/v/t1.6435-9/218198816_1813674812138945_2224349374655338452_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=174925&_nc_eui2=AeE1e6H_rq3CSHuxxlONRQaIamdX4jWLK5JqZ1fiNYsrkrhtPhltIEBxLHej4RtsLSArsK5VlMMdxW0RxmKK43Vk&_nc_ohc=Q6ZOEqA-XekAX8n5Adk&tn=sD1WELh04pvsPaVN&_nc_ht=scontent.fdac39-1.fna&oh=4636df734aba165e5925aa7daa294e7a&oe=61883AAD"
              alt=""
            />
          ) : (
            <ul className="topList">
              <li className="topListItem">
                <Link to="/login" className="link">
                  LOGIN
                </Link>
              </li>
            </ul>
          )}

          <i className="topSearchIcon fas fa-search"></i>
        </div>
      </div>
      {/* <div className="topSaparator" /> */}
    </>
  );
};

export default Topbar;
