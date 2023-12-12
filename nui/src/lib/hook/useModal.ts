import { useContext } from "react";
import { ModalContext, ModalContextValues } from "../context/ModalContext";

/**
 * useModal hook returns ModalContext values.
 *
 * @returns
 */
const useModal = (): ModalContextValues => {
  const context = useContext(ModalContext);

  if (!context) throw new Error("useModal must be within a ModalProvider.");

  return context;
};

export default useModal;
