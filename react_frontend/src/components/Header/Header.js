import "./header.css";

const Header = () => {
  return (
    <div className="header">
      <div className="headerTitles">
        <span className="headerTitleSm">React and Node</span>
        <span className="headerTitleLg">Blog</span>
      </div>
      <img
        className="headerImage"
        src="https://media.wired.com/photos/5926d188cfe0d93c474317a1/master/w_2560%2Cc_limit/NMSTA.jpg"
        alt=""
      />
    </div>
  );
};

export default Header;
