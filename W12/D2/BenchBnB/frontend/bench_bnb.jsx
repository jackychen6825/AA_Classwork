import React from "react";
import ReactDOM from "react-dom";
import { signUp, signIn, signOut } from "./util/session_api_util";

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");

    window.signIn = signIn;
    window.signUp = signUp;
    window.signOut = signOut;
    
    ReactDOM.render(<h1>Welcome to BenchBnB</h1>, root);
});