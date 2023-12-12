interface TextProps {
  children?: React.ReactNode;
  [k: string]: unknown;
}

const Text: React.FC<TextProps> = ({ children, ...attributes }) => {
  const textAttributes = {
    ...attributes,
    className: `text${attributes.className ? ` ${attributes.className}` : ""}`,
  };

  return <p {...textAttributes}>{children}</p>;
};

export default Text;
