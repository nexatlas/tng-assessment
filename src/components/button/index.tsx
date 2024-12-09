import { ButtonHTMLAttributes, DetailedHTMLProps } from "react";
import styles from "./styles.module.scss";

interface ButtonProps
  extends DetailedHTMLProps<
    ButtonHTMLAttributes<HTMLButtonElement>,
    HTMLButtonElement
  > {
  variant: "fill" | "outline" | "transparent";
  color?: string;
}

const Button = (props: ButtonProps) => {
  const { onClick, variant, children, className, color } = props;

  return (
    <button
      {...props}
      className={`${className} ${styles.btn} ${styles[`btn--${variant}`]} `}
      onClick={(e) => {
        e.preventDefault();
        onClick && onClick(e);
      }}
    >
      {children}
    </button>
  );
};

export { Button };
