import {
  CategoryScale,
  Chart as ChartJS,
  ChartData,
  ChartOptions,
  LineElement,
  LinearScale,
  PointElement,
  Tooltip,
  Filler,
  BarElement,
} from "chart.js";
import { Bar } from "react-chartjs-2";
import styles from "./styles.module.scss";

ChartJS.unregister();
ChartJS.register(
  BarElement,
  CategoryScale,
  Filler,
  LineElement,
  LinearScale,
  PointElement,
  Tooltip
);
ChartJS.defaults.font.family = "Inter";
ChartJS.defaults.font.size = 13;

export interface GraphProps {
  data: number[];
  labels: string[];
}

const BarChart: React.FC<GraphProps> = ({ data, labels }) => {
  const barData: ChartData<"bar"> = {
    labels: labels,
    datasets: [
      {
        label: "",
        data: data,
        borderColor: "#FF5BEF",
        borderWidth: 0,
        backgroundColor: "#605BFF",
        // barPercentage: 1.2,
      },
    ],
  };

  const lineOptions: ChartOptions<"bar"> = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        display: false,
      },
      tooltip: {
        enabled: false,
      },
    },
    scales: {
      x: {
        grid: {
          display: false,
          color: "rgba(241, 243, 246, 1)",
        },
        title: {
          display: false,
        },
        border: {
          color: "rgba(241, 243, 246, 1)",
        },
      },
      y: {
        grid: {
          display: true,
          color: "rgba(241, 243, 246, 1)",
        },
        title: {
          display: false,
        },
        ticks: {
          display: true,
        },
        border: {
          display: false,
        },
      },
    },
  };
  const lineConfig = {
    type: "bar",
    data: barData,
    options: lineOptions,
  };
  return (
    <>
      <section className={styles.graph}>
        <Bar id="canvas" {...lineConfig} />
      </section>
    </>
  );
};
export { BarChart };
