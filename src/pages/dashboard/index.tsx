import { DashboardUI } from "modules";
import data from "data.json";

const Dashboard = () => {
  const stats = data.metrics;
  const activity = data.activity;
  const users = data.users;

  return (
    <>
      <DashboardUI metrics={stats} activity={activity} users={users} />
    </>
  );
};

export { Dashboard };
