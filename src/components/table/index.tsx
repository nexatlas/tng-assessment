import * as React from "react";
import { TableHeader, TableHeaderItemProps } from "./components";
import styles from "./styles.module.scss";

// An interface for all custom table classes
interface AllCustomTableClasses {
  tableHeaderClassName?: string;
  tableHeaderItemClassName?: string;
  tableContainerClassName?: string;
}

//  Table Props
interface TableProps {
  tableHeaderTitles: TableHeaderItemProps[];
  tableBody: React.ReactElement;
  emptyTable?: {
    show: boolean;
    element: any;
  };
  customTableClasses?: AllCustomTableClasses;
  hideHeaders?: boolean;
  tableHeaderCheck?: {
    value: boolean;
    handleCheck: (val: boolean) => void;
    className?: string;
  };
}

/**
 * DASHBOARD TABLE COMPONENT
 * --------------------------------------------
 * This is the table component.
 */

const Table: React.FC<TableProps> = ({
  tableHeaderTitles,
  tableBody,
  emptyTable,
  hideHeaders,
  customTableClasses,
  tableHeaderCheck,
}) => {
  // All custom table classes
  const {
    tableHeaderClassName = "",
    tableHeaderItemClassName = "",
    tableContainerClassName = "",
  } = customTableClasses || {};

  return (
    <>
      {!emptyTable?.show ? (
        <section
          className={`${styles.mainTableContainer} ${tableContainerClassName}`}
        >
          {!hideHeaders && (
            <TableHeader
              tableHeaderClassName={tableHeaderClassName}
              tableHeadItemClassName={tableHeaderItemClassName}
              tableHeaderTitles={tableHeaderTitles}
              tableHeaderCheck={tableHeaderCheck}
            />
          )}
          {tableBody}
        </section>
      ) : (
        <>{emptyTable.element}</>
      )}
    </>
  );
};

export { Table };
export * from "./tableBodyVariants";
export * from "./components";
