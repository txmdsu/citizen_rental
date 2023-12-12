import { LuCar, LuBike, LuX } from "react-icons/lu";
import useVisibility from "../../../lib/hook/useVisibility";
import useModal from "../../../lib/hook/useModal";

const Menu = () => {
  const { closeModal } = useVisibility();
  const { type, setType } = useModal();

  const updateModalType = (type: "cars" | "bikes") => {
    setType(type);
  };

  const isActiveType = (menuType: "cars" | "bikes") => {
    return type === menuType;
  };

  return (
    <header className="app-menu">
      <nav className="menu__nav">
        <ul>
          <li
            className={isActiveType("cars") ? "active" : ""}
            onClick={() => updateModalType("cars")}
          >
            <LuCar />
          </li>
          <li
            className={isActiveType("bikes") ? "active" : ""}
            onClick={() => updateModalType("bikes")}
          >
            <LuBike />
          </li>
        </ul>
      </nav>

      <button className="menu__close btn btn--black" onClick={closeModal}>
        <LuX />
      </button>
    </header>
  );
};

export default Menu;
