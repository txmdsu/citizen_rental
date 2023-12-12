import Menu from "../Menu/Menu";
import CarsModalContent from "../../modal/CarsModalContent/CarsModalContent";
import useModal from "../../../lib/hook/useModal";
import BikesModalContent from "../../modal/BikesModalContent/BikesModalContent";

const Modal = () => {
  const { type, selectedVehicle, handleLocationClick } = useModal();

  const displayModalContent = () => {
    switch (type) {
      case "bikes":
        return <BikesModalContent />;
      case "cars":
      default:
        return <CarsModalContent />;
    }
  };

  return (
    <main className="app-modal">
      <div className="modal__wrapper">
        <Menu />
        <section className="modal__box">
          <div className="modal__inner">{displayModalContent()}</div>
        </section>
        {/* {selectedVehicle ? ( */}
        <button
          className="modal__button btn"
          onClick={handleLocationClick}
          style={{
            position: "fixed",
            bottom: "-70px",
            left: "0",
            right: "0",
            transform: selectedVehicle ? "translateY(0)" : "translateY(-10px)",
            opacity: !selectedVehicle ? "0" : "1",
            transition: "all .2s",
            visibility: !selectedVehicle ? "hidden" : "visible",
          }}
        >
          Louer
        </button>
        {/* ) : ( */}
        {/* "" */}
        {/* )} */}
      </div>
    </main>
  );
};

export default Modal;
