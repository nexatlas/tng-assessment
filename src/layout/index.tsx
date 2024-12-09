import { ReactNode } from "react";
import { Navbar } from "./navbar";
import { Sidebar } from "./sidebar";
import styles from "./styles.module.scss";

export type tabs = "dashboard" | "profile" | "settings";

export interface LayoutProps {
  children: ReactNode;
  active: tabs;
}

const Layout = ({ children, active }: LayoutProps) => {
  return (
    <>
      <Navbar />
      <main className={styles.main}>{children}</main>
      <Sidebar active={active} />
    </>
  );
};

export { Layout };
