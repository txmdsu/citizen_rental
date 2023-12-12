import useModal from "../../../lib/hook/useModal";

type RadioListElement = {
  name: string;
  model: string;
  price: number;
};

interface RadioListProps {
  list: RadioListElement[];
}

const RadioList: React.FC<RadioListProps> = ({ list }) => {
  const { selectedVehicle, handleVehicleChange } = useModal();

  const displayRadioList = () => {
    return list.map((li, k) => displayRadioListElement(li, k));
  };

  const displayRadioListElement = (
    li: RadioListElement,
    k: number
  ): JSX.Element => {
    return (
      <li key={k} className="list__el">
        <input
          type="radio"
          id={li.model}
          value={li.model}
          name="vehicle"
          checked={selectedVehicle === li.model}
          onChange={handleVehicleChange}
        />
        <label className="list__vehicle" htmlFor={li.model} tabIndex={0}>
          <span className="list__label">{li.name}</span>
          <b className="list__price">{li.price}$</b>
        </label>
      </li>
    );
  };

  return <ul className="radio-list">{displayRadioList()}</ul>;
};

export default RadioList;
