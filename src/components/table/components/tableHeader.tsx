import React from "react";
import styles from "../styles.module.scss";

// Table header item
interface TableHeaderItemProps {
  title: string | any;
  id?: string;
  styles?: React.CSSProperties;
}

// Table header props
interface TableHeaderProps {
  tableHeaderTitles: TableHeaderItemProps[];
  tableHeadItemClassName?: string;
  tableHeaderClassName?: string;
  tableRowClassName?: string;
  tableHeaderCheck?: {
    value: boolean;
    handleCheck: (val: boolean) => void;
    className?: string;
  };
}

/**
 * This is a representation of the table header
 * ---------------------------------------------------
 * @param tableHeaderTitles - @interface TableHeaderProps
 *
 */

const TableHeader: React.FC<TableHeaderProps> = ({
  tableHeaderTitles,
  tableHeadItemClassName = "",
  tableHeaderClassName = "",
  tableHeaderCheck,
}) => {
  return (
    <section className={`${styles.tableHeader} ${tableHeaderClassName}`}>
      {tableHeaderCheck && (
        <span className={styles.checkWrap} >
          <input
            className={styles.check}
            onChange={() =>
              tableHeaderCheck.handleCheck(tableHeaderCheck.value)
            }
            checked={tableHeaderCheck.value}
            type={"checkbox"}
          />{" "}
          <span>Select all</span>
        </span>
      )}
      {tableHeaderTitles.map((header, idx) => {
        return (
          <span
            style={header.styles}
            className={tableHeadItemClassName}
            key={`${header}${idx + 1}`}
          >
            {header.title}
          </span>
        );
      })}
    </section>
  );
};

export { TableHeader };
export type { TableHeaderItemProps, TableHeaderProps };
