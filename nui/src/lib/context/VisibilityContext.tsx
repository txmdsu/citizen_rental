import React from "react";
import { fetchNUI } from "../helper/fetchNUI";
import { gsap } from "gsap";

interface VisibilityContextValues {
  visible: boolean;
  setVisible: React.Dispatch<React.SetStateAction<boolean>>;
  closeModal: () => void;
}

const defaultVisibilityContext: VisibilityContextValues = {
  visible: false,
  setVisible: () => {},
  closeModal: () => {},
};

const VisibilityContext = React.createContext<VisibilityContextValues>(
  defaultVisibilityContext
);

const VisibilityProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [visible, setVisible] = React.useState<boolean>(
    defaultVisibilityContext.visible
  );

  React.useEffect(() => {
    const body = document.querySelector("body");

    const fadeIn = () =>
      gsap.to(body, { opacity: 1, duration: 0.2, display: "block" });

    const fadeOut = () =>
      gsap.to(body, { opacity: 0, duration: 0.2, display: "none" });

    visible ? fadeIn() : fadeOut();
  }, [visible]);

  React.useEffect(() => {
    window.addEventListener("message", updateWindowVisibility);

    return () => window.removeEventListener("message", updateWindowVisibility);
  }, []);

  const updateWindowVisibility = (e: MessageEvent) => {
    const { data: item } = e;

    if (item.type !== "ui") return;

    item.status ? setVisible(true) : setVisible(false);
  };

  const closeModal = () => {
    setVisible(false);

    fetchNUI("exit", {});
  };

  const visibilityProviderValues: VisibilityContextValues = {
    visible,
    setVisible,
    closeModal,
  };

  return (
    <VisibilityContext.Provider value={visibilityProviderValues}>
      {children}
    </VisibilityContext.Provider>
  );
};

export { VisibilityProvider, VisibilityContext };
export type { VisibilityContextValues };
