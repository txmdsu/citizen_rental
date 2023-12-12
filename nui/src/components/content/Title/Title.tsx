interface TitleProps {
  tag?: "h1" | "h2" | "h3" | "h4" | "h5";
  children?: React.ReactNode;
  [k: string]: unknown;
}

const Title: React.FC<TitleProps> = ({
  tag: Tag = "h1",
  children,
  ...attributes
}) => {
  const titleAttributes = {
    ...attributes,
    className: `title${attributes.className ? ` ${attributes.className}` : ""}`,
  };

  return <Tag {...titleAttributes}>{children}</Tag>;
};

export default Title;
