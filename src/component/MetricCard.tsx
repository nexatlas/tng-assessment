import { useState } from "react";
import { FaInfoCircle } from "react-icons/fa";

interface MetricCardProps {
  title?: string;
  value?: string | number;
  description?: string;
  loading?: boolean;
}

const MetricCard = ({
  title,
  value,
  description,
  loading,
}: MetricCardProps) => {
  const [showTooltip, setShowTooltip] = useState(false);

  if (loading) {
    return (
      <div className="bg-white shadow-md rounded-lg p-6 relative animate-pulse">
        <div className="h-6 bg-gray-300 rounded w-3/4 mb-4"></div>
        <div className="h-6 bg-gray-300 rounded w-1/2 mb-4"></div>
        <div className="h-6 bg-gray-300 rounded w-1/4"></div>
      </div>
    );
  }

  return (
    <div className="bg-white shadow-md rounded-lg p-6 relative">
      <div className="flex justify-between items-center">
        <h2 className="text-xl font-bold text-primary">{title}</h2>
        <div
          className="relative"
          onMouseEnter={() => setShowTooltip(true)}
          onMouseLeave={() => setShowTooltip(false)}
        >
          <FaInfoCircle className="text-secondary cursor-pointer" />
          {showTooltip && (
            <div className="absolute top-0 right-0 mt-8 w-48 p-2 bg-background_1 text-white text-sm rounded-lg shadow-lg">
              {description}
            </div>
          )}
        </div>
      </div>
      <p className="text-2xl mt-4 text-primary_light">{value}</p>
    </div>
  );
};

export default MetricCard;
