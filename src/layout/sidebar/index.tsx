import {
  CloseIcon,
  DashboardOutlineIcon,
  HamburgerMenuIcon,
  LogoutIcon,
  SettingsOutlineIcon,
  UserOutlineIcon,
} from "assets/icons";
import { useState } from "react";
import { Routes } from "router";
import styles from "./styles.module.scss";
import { LogoColored } from "assets";
import { Link } from "react-router-dom";
import { tabs } from "layout";

interface SidebarProps {
  active: tabs;
}

const Sidebar: React.FC<SidebarProps> = ({ active }) => {
  const mobileWidth = 900;
  const [mobile, setMobile] = useState(
    window.innerWidth <= mobileWidth ? true : false
  );
  const [showNav, setShowNav] = useState(false);

  const screenSizeUpdate = () => {
    if (window.innerWidth <= mobileWidth) {
      setMobile(true);
    } else if (window.innerWidth > mobileWidth) {
      setMobile(false);
      setShowNav(false);
    }
  };

  const Navtabs = [
    {
      label: "Dashboard",
      key: "dashboard",
      Icon: DashboardOutlineIcon,
      path: Routes.dashboard,
    },
    {
      label: "Profile",
      key: "profile",
      Icon: UserOutlineIcon,
      path: Routes.dashboard,
    },
    {
      label: "Settings",
      key: "settings",
      Icon: SettingsOutlineIcon,
      path: Routes.dashboard,
    },
  ];

  window.addEventListener("resize", screenSizeUpdate);

  return (
    <>
      <aside
        style={{ zIndex: mobile && showNav ? "5000000000" : "20" }}
        className={`${styles.sidebar} ${showNav ? styles.openMenu : ""}`}
      >
        <div className={styles.logoSec}>
          <div className={styles.logoSec__logo}>
            <LogoColored />
            <span>MetricWizz</span>
          </div>
          {mobile ? (
            !showNav ? (
              <HamburgerMenuIcon
                onClick={() => setShowNav(true)}
                role="button"
              />
            ) : (
              <CloseIcon
                className={styles.close}
                onClick={() => setShowNav(false)}
                role="button"
              />
            )
          ) : null}
        </div>
        <nav className={styles.nav}>
          {Navtabs.map(({ key, label, path, Icon }, idx) => (
            <Link
              key={idx}
              to={path}
              className={active === key ? styles.active : ""}
              onClick={() => {
                setShowNav(false);
                localStorage.removeItem("assessmentId");
              }}
            >
              <Icon /> {label}
            </Link>
          ))}
        </nav>

        <button className={styles.logout} >
          Logout <LogoutIcon />
        </button>
      </aside>
    </>
  );
};

export { Sidebar };
