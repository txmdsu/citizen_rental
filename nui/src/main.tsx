import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.tsx";
import { VisibilityProvider } from "./lib/context/VisibilityContext.tsx";
import { ModalProvider } from "./lib/context/ModalContext.tsx";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <VisibilityProvider>
      <ModalProvider>
        <App />
      </ModalProvider>
    </VisibilityProvider>
  </React.StrictMode>
);
