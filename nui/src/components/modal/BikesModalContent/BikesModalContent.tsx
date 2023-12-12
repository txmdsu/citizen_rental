import config from "../../../config/config.json";
import lang from "../../../config/lang.json";

import useModal from "../../../lib/hook/useModal";
import Text from "../../content/Text/Text";
import Title from "../../content/Title/Title";
import RadioList from "../../form/RadioList/RadioList";

interface BikesModalContentProps {}

const BikesModalContent: React.FC<BikesModalContentProps> = () => {
  const { vehiclesList } = useModal();

  return (
    <>
      <Title
        className="modal__title"
        dangerouslySetInnerHTML={{
          __html: (lang as any)[config.locale]["BikeTitle"],
        }}
      />
      <Text
        className="modal__text"
        dangerouslySetInnerHTML={{
          __html: `<br />${(lang as any)[config.locale]["BikeText"]}`,
        }}
      />

      <RadioList list={vehiclesList.bikes} />
    </>
  );
};

export default BikesModalContent;
