import React from "react";
import "./createUpdate.css";

const CreateUpdateBlogScreen = () => {
  return (
    <div className="write">
      <img
        className="writeImage"
        src="https://tinypng.com/images/social/website.jpg"
        alt=""
      />
      <form className="writeForm">
        <div className="writeFormGroup">
          <label htmlFor="fileInput">
            <i className="writeIcon fas fa-plus"></i>
          </label>

          <input type="file" id="fileInput" style={{ display: "none" }} />
          <input
            type="text"
            placeholder="Title"
            className="writeInput"
            autoFocus={true}
          />
        </div>

        <div className="writeFormGroup">
          <textarea
            placeholder="Tell Your Story ..."
            type="text"
            className="writeInput writeText"
          ></textarea>
        </div>
        <div className="writeButtonHolder">
          <button className="writeSubmit">Publish</button>
        </div>
      </form>
    </div>
  );
};

export default CreateUpdateBlogScreen;
