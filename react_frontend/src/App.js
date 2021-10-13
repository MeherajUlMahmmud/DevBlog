import React from "react";
import "./App.css";
import Topbar from "./components/Topbar/Topbar";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import HomeScreen from "./screens/blog_screens/Home/HomeScreen";
import RegisterScreen from "./screens/auth_screens/Register/RegisterScreen";
import LoginScreen from "./screens/auth_screens/Login/LoginScreen";
import CreateUpdateBlogScreen from "./screens/blog_screens/CreateUpdateBlog/CreateUpdateBlogScreen";
import BlogDetailsScreen from "./screens/blog_screens/BlogDetails/BlogDetailsScreen";

function App() {
  const user = true;
  return (
    <Router>
      <Topbar />
      <Switch>
        <Route path="/" exact component={HomeScreen} />
        <Route path="/login" component={user ? HomeScreen : LoginScreen} />
        <Route
          path="/register"
          component={user ? HomeScreen : RegisterScreen}
        />
        <Route path="/write">
          {user ? <CreateUpdateBlogScreen /> : <RegisterScreen />}
        </Route>
        <Route path="/post/:postId">
          <BlogDetailsScreen />
        </Route>
      </Switch>
    </Router>
  );
}

export default App;
