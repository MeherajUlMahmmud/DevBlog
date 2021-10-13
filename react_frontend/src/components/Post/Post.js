import React from "react";
import "./post.css";

const Post = (props) => {
  return (
    <div className="post">
      <img className="postImage" src={props.image} alt="" />
      <div className="postInfo">
        <div className="postCats">
          <span className="postCat">{props.category}</span>
        </div>
        <span className="postTitle">{props.title}</span>
        <hr />
        <span className="postDate">{props.date}</span>
      </div>
      <p className="postDesc">{props.desc}</p>
    </div>
  );
};

export default Post;
