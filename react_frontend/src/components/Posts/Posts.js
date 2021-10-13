import React from "react";

import "./posts.css";
import Post from "../Post/Post";

const Posts = () => {
  return (
    <div className="posts">
      <Post
        image="https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg"
        category="Life"
        title="Lorem Ipsum"
        date="1h ago"
        desc="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desksidebar publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      />
      <Post
        image="https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg"
        category="Life"
        title="Lorem Ipsum"
        date="1h ago"
        desc="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desksidebar publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      />
      <Post
        image="https://www.industrialempathy.com/img/remote/ZiClJf-1920w.jpg"
        category="Life"
        title="Lorem Ipsum"
        date="1h ago"
        desc="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desksidebar publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      />
      <Post
        image="https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg"
        category="Life"
        title="Lorem Ipsum"
        date="1h ago"
        desc="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desksidebar publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      />
      <Post
        image="https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg"
        category="Life"
        title="Lorem Ipsum"
        date="1h ago"
        desc="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desksidebar publishing software like Aldus PageMaker including versions of Lorem Ipsum."
      />
    </div>
  );
};

export default Posts;
