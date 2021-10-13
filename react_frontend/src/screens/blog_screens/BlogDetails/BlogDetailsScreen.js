import React from 'react'

import Sidebar from "../../../components/Sidebar/Sidebar";
import SinglePost from "../../../components/SinglePost/SinglePost";
import "./details.css";

const BlogDetailsScreen = () => {
  return (
    <div className="single">
      <SinglePost />
      <Sidebar />
    </div>
  );
};

export default BlogDetailsScreen
