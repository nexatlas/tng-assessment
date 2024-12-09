import { EllipsisIcon } from "assets/icons";
import styles from "./styles.module.scss";

const Navbar = () => {
  return (
    <>
      <header className={`${styles.header}`}>
        <h1 className={styles.ttl}>Dashboard</h1>
        <div className={styles.user} >
          <span>JD</span>
          <p>John Doe</p>
          <EllipsisIcon />
        </div>
      </header>
    </>
  );
};

export { Navbar };
