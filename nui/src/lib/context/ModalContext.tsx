import React from "react";
import { fetchNUI } from "../helper/fetchNUI";

type VehiclesType = {
  name: string;
  model: string;
  price: number;
};

interface ModalContextValues {
  type: "cars" | "bikes";
  setType: React.Dispatch<React.SetStateAction<"cars" | "bikes">>;
  selectedVehicle?: string;
  setSelectedVehicle: React.Dispatch<React.SetStateAction<undefined | string>>;
  handleVehicleChange: (e: React.ChangeEvent<HTMLInputElement>) => void;
  handleLocationClick: () => void;
  vehiclesList: {
    cars: VehiclesType[];
    bikes: VehiclesType[];
  };
}

const defaultModalContext: ModalContextValues = {
  type: "cars",
  setType: () => {},
  selectedVehicle: undefined,
  setSelectedVehicle: () => {},
  handleVehicleChange: () => {},
  handleLocationClick: () => {},
  vehiclesList: {
    cars: [],
    bikes: [],
  },
};

const ModalContext =
  React.createContext<ModalContextValues>(defaultModalContext);

const ModalProvider: React.FC<{ children: React.ReactNode }> = ({
  children,
}) => {
  const [vehiclesList, setVehiclesList] = React.useState(
    defaultModalContext.vehiclesList
  );
  const [type, setType] = React.useState(defaultModalContext.type);
  const [selectedVehicle, setSelectedVehicle] = React.useState<
    undefined | string
  >(undefined);

  const updateVehiclesList = (e: MessageEvent) => {
    const { data: item } = e;

    if (item.type !== "vehicles") return;

    setVehiclesList(item.vehicles);
  };

  const getVehicleInformationsFromName = (name: string) => {
    return vehiclesList[type].filter((v) => v.model === name)[0];
  };

  React.useEffect(() => {
    window.addEventListener("message", updateVehiclesList);

    return () => window.removeEventListener("message", updateVehiclesList);
  }, []);

  React.useEffect(() => {
    fetchNUI("preview", { model: selectedVehicle });
  }, [selectedVehicle]);

  const handleVehicleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    setSelectedVehicle(e.target.value);
  };

  const handleLocationClick = () => {
    if (!selectedVehicle) return;

    const data = getVehicleInformationsFromName(selectedVehicle);

    fetchNUI("rent", data);
  };

  const modalProviderValues: ModalContextValues = {
    type,
    setType,
    selectedVehicle,
    setSelectedVehicle,
    handleVehicleChange,
    handleLocationClick,
    vehiclesList,
  };

  React.useEffect(() => {
    setSelectedVehicle(undefined);
  }, [type]);

  return (
    <ModalContext.Provider value={modalProviderValues}>
      {children}
    </ModalContext.Provider>
  );
};

export { ModalProvider, ModalContext };
export type { ModalContextValues };
