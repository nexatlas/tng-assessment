import { BarChart, EmptyTable, StatCard } from "components";
import styles from "./styles.module.scss";
import { useState } from "react";
import { periodOptions } from "utils/constants";

interface User {
  name: string;
  email: string;
  date: string;
}

interface DashboardUIProps {
  metrics: {
    totalUsers: number;
    activeSessions: number;
    revenue: string;
  };
  activity: number[];
  users: User[];
}

const DashboardUI = ({ metrics, activity, users }: DashboardUIProps) => {
  const [period, setPeriod] = useState("7 days");

  return (
    <>
      <div className={`${styles.navtabs} ${styles["navSec__tabs--1"]}`}>
        {periodOptions.map((item) => (
          <button
            key={item.value}
            onClick={() => setPeriod(item.value)}
            className={period === item.value ? styles.active : ""}
          >
            {item.label}
          </button>
        ))}
      </div>
      <section className={styles.cards}>
        <StatCard
          title={"Total Users"}
          value={metrics.totalUsers}
          comparison={"growth"}
          period={period}
        />
        <StatCard
          title={"Active Sessions"}
          value={metrics.activeSessions}
          comparison={"growth"}
          period={period}
        />
        <StatCard
          title={"Revenue"}
          value={metrics.revenue}
          comparison={"loss"}
          period={period}
        />
      </section>
      <section className={styles.sec}>
        <section>
          <p className={styles.graph__ttl}>Users ({users.length})</p>
          <p className={styles.graph__txt}>
            Lörem ipsum is simply dummy text of the printing and typesetting
            industry.
          </p>

          {users.length > 0 ? (
            <div className={styles.table}>
              <div className={`${styles.table__row} ${styles.table__header}`}>
                <span>Name</span>
                <span>Email</span>
                <span>Date</span>
              </div>
              {users.map((item, index) => (
                <div
                  key={`user_${index}`}
                  className={`${styles.table__row} ${styles.table__body}`}
                >
                  <span>{item.name}</span>
                  <span>{item.email}</span>
                  <span>{item.date}</span>
                </div>
              ))}
            </div>
          ) : (
            <EmptyTable text={"There are no users to show"} />
          )}
        </section>
        <section className={styles.graph}>
          <p className={styles.graph__ttl}>User Activity</p>
          <p className={styles.graph__txt}>Keep track of your user activity</p>
          <BarChart
            data={activity}
            labels={["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]}
          />
        </section>
      </section>
    </>
  );
};

export { DashboardUI };
