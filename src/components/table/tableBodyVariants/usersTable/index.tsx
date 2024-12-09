import { TableBody, TableBodyRow } from "components/";
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
}

const UsersTable: React.FC<TableBodyProps> = ({
  tableBodyItemClassName,
  tableBodyItems,
  tableBodyRowClassName,
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
    </>
  );
};

export { UsersTable };
