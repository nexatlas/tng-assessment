import * as React from "react";
import styles from "./styles.module.scss";

interface InputProps
  extends React.DetailedHTMLProps<
    React.InputHTMLAttributes<HTMLInputElement>,
    HTMLInputElement
  > {
  dataTestID?: string;
  className?: string;
  parentClassName?: string;
  validatorMessage: string | undefined;
  label?: string;
  showRequired?: boolean;
}

const Input: React.FC<InputProps> = (props) => {
  const {
    dataTestID,
    className,
    parentClassName,
    validatorMessage,
    label,
    showRequired,
    type,
    id,
  } = props;
  const [show, setShow] = React.useState(false);

  return (
    <div
      className={`${styles.inputWrapper} ${parentClassName} ${
        validatorMessage ? styles.error : ""
      }`}
    >
      {label && (
        <label htmlFor={id} className={styles.label}>
          {label}
          {showRequired ? <span className={styles.req}>*</span> : ""}
        </label>
      )}

      <input
        {...props}
        data-testid={dataTestID}
        className={`${styles.input} ${className}`}
        type={type === "password" && show ? "text" : type}
      />

      {validatorMessage && (
        <small className={styles.message}>{validatorMessage}</small>
      )}
    </div>
  );
};

interface TextareaProps
  extends React.DetailedHTMLProps<
    React.TextareaHTMLAttributes<HTMLTextAreaElement>,
    HTMLTextAreaElement
  > {
  dataTestID?: string;
  placeholder: string;
  className?: string;
  parentClassName?: string;
  validatorMessage: string | undefined;
  label?: string;
  Icon?: React.FunctionComponent<React.SVGProps<SVGSVGElement>>;
  iconClassName?: string;
  iconFunction?: () => void;
  showRequired?: boolean;
  max?: number;
  value?: string;
}

const Textarea: React.FC<TextareaProps> = (props) => {
  const {
    dataTestID,
    className,
    parentClassName,
    name = "",
    required,
    validatorMessage,
    label,
    Icon,
    iconClassName,
    iconFunction,

    onChange,
    showRequired,
    max,
    value = "",
  } = props;
  return (
    <div
      className={`${styles.inputWrapper} ${parentClassName} ${
        validatorMessage ? styles.error : ""
      }`}
    >
      {label && (
        <label className={styles.label}>
          {label}
          {showRequired ? <span className={styles.req}>*</span> : ""}
        </label>
      )}
      {Icon ? (
        <Icon
          role={iconFunction ? "button" : "none"}
          onClick={iconFunction && iconFunction}
          className={`${iconClassName} ${styles.icon}`}
          id="icon"
        />
      ) : (
        ""
      )}
      <textarea
        {...props}
        data-testid={dataTestID}
        className={`${styles.textarea} ${className}`}
      />
      {max ? (
        <p className={styles.length}>
          {value.length}/{max}
        </p>
      ) : (
        ""
      )}
      {validatorMessage && (
        <small className={styles.message}>{validatorMessage}</small>
      )}
    </div>
  );
};

export { Input, Textarea };
