import config from "../../../config/config.json";
import lang from "../../../config/lang.json";

import useModal from "../../../lib/hook/useModal";
import Text from "../../content/Text/Text";
import Title from "../../content/Title/Title";
import RadioList from "../../form/RadioList/RadioList";

interface CarsModalContentProps {}

const CarsModalContent: React.FC<CarsModalContentProps> = () => {
  const { vehiclesList } = useModal();

  return (
    <>
      <Title
        className="modal__title"
        dangerouslySetInnerHTML={{
          __html: (lang as any)[config.locale]["CarTitle"],
        }}
      />
      <Text
        className="modal__text"
        dangerouslySetInnerHTML={{
          __html: `<br />${(lang as any)[config.locale]["CarText"]}`,
        }}
      />

      <RadioList list={vehiclesList.cars} />
    </>
  );
};

export default CarsModalContent;
