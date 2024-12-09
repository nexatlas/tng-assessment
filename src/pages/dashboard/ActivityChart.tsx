import { useState, useEffect } from "react";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
} from "recharts";
import rawData from "../../../data.json";

interface ActivityData {
  date: string;
  value: number;
}

const ActivityChart = () => {
  const [activityData, setActivityData] = useState<ActivityData[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    setTimeout(() => {
      const activityData = rawData.activity.map(
        (value: number, index: number) => ({
          date: rawData.users[index].date,
          value: value,
        })
      );
      setActivityData(activityData);
      setLoading(false);
    }, 2000);
  }, []);

  if (loading) {
    return <div>Loading...</div>;
  }

  return (
    <div className="bg-white shadow-md rounded-lg p-6">
      <h2 className="text-xl font-bold text-primary mb-4">
        User Activity Over the Last 7 Days
      </h2>
      <div className="overflow-x-auto">
        <div className="min-w-[500px]">
          <ResponsiveContainer width="100%" height={300}>
            <BarChart
              data={activityData}
              margin={{ top: 20, right: 30, left: 20, bottom: 5 }}
            >
              <CartesianGrid strokeDasharray="3 3" />
              <XAxis dataKey="date" />
              <YAxis />
              <Tooltip />
              <Bar dataKey="value" fill="#149dff" />
            </BarChart>
          </ResponsiveContainer>
        </div>
      </div>
    </div>
  );
};

export default ActivityChart;
