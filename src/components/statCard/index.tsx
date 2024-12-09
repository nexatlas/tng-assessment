import { ArrowUpIcon } from "assets/icons";
import styles from "./styles.module.scss";
import { formatNumber } from "utils/number";

export interface StatCardProps {
  title: string;
  value: string | number;
  comparison: "growth" | "loss";
  period: string;
}

const StatCard = ({ title, value, comparison, period }: StatCardProps) => {
  return (
    <>
      <div className={styles.card}>
        <p className={styles.card__ttl}>{title}</p>
        <p className={styles.card__value}>
          {typeof value === "number" ? formatNumber(value) : value}
        </p>
        <div
          className={`${styles.card__comparator} ${
            styles[`card__comparator--${comparison}`]
          }`}
        >
          <ArrowUpIcon />
          <span>vs last {period}</span>
        </div>
      </div>
    </>
  );
};

export { StatCard };
