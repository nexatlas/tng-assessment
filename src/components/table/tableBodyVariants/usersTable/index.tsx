import {
  // Pagination,
  // PaginationProps,
  TableBody,
  TableBodyRow,
} from "components/";
import styles from "./styles.module.scss";

export interface UsersTableItem {
  name: string;
  email: string;
  date: string;
}

interface TableBodyProps {
  tableBodyItems: UsersTableItem[];

  tableBodyItemClassName: string;
  tableBodyRowClassName: string;
  // pagination?: PaginationProps;
}

const UsersTable: React.FC<TableBodyProps> = ({
  tableBodyItemClassName,
  tableBodyItems,
  tableBodyRowClassName,
  // pagination,
}) => {
  return (
    <>
      <TableBody customClassName={`${styles.tableBody}`}>
        {tableBodyItems.map((item, index) => (
          <TableBodyRow
            key={`body ${index}`}
            customClassName={`${styles.tableBodyRow} ${tableBodyRowClassName}`}
          >
            <span className={`${tableBodyItemClassName}`}>{item.name}</span>
            <span className={`${tableBodyItemClassName}`}>{item.email}</span>
            <span className={`${tableBodyItemClassName}`}>{item.date}</span>
          </TableBodyRow>
        ))}
      </TableBody>
      {/* {pagination ? (
        <Pagination {...pagination} className={styles.pagination} />
      ) : (
        ""
      )} */}
    </>
  );
};

export { UsersTable };
