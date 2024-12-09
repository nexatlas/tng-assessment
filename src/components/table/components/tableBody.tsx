import React from "react";
import styles from "../styles.module.scss";

// Table body props
interface TableBodyProps {
  customClassName?: string;
  children: any;
  style?: React.CSSProperties;
}

/**
 * This is a representation of HTML's tbody component
 * ---------------------------------------------------
 * @param customClassName - @interface TableBodyProps
 *
 */

const TableBody: React.FC<TableBodyProps> = ({
  children,
  customClassName = "",
}) => {
  return (
    <section className={`${styles.tableBody} ${customClassName}`}>
      {children}
    </section>
  );
};

const TableBodyRow: React.FC<TableBodyProps> = ({
  children,
  customClassName = "",
  style,
}) => {
  return (
    <div style={style} className={`${styles.tableBodyRow} ${customClassName}`}>
      {children}
    </div>
  );
};

export { TableBody, TableBodyRow };
