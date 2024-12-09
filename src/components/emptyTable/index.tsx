import { Button } from "components/button";
import styles from "./styles.module.scss";
import { EmptyBox } from "assets";

interface EmptyTableProps {
  text: string;
  button?: {
    text: string;
    onClick: () => void;
    className?: string;
  };
  className?: string;
}

const EmptyTable: React.FC<EmptyTableProps> = ({ text, button, className }) => {
  return (
    <section className={`${styles.empty} ${className}`}>
      <EmptyBox className={styles.empty__img} />
      <p className={styles.empty__txt}>{text} </p>
      {button ? (
        <Button
          className={`${styles.empty__btn} ${button.className}`}
          variant="fill"
          onClick={button.onClick}
        >
          {button.text}
        </Button>
      ) : (
        ""
      )}
    </section>
  );
};

export { EmptyTable };
