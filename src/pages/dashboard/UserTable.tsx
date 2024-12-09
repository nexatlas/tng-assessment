import { useState, useEffect } from "react";
import rawData from "../../../data.json";

const SkeletonRow = ({ columns }: { columns: number }) => (
  <tr>
    {Array.from({ length: columns }).map((_, index) => (
      <td key={index} className="py-4 px-6 border-b animate-pulse">
        <div className="h-4 bg-gray-300 rounded"></div>
      </td>
    ))}
  </tr>
);

const UserTable = () => {
  const [users, setUsers] = useState<any[]>([]);
  const [loading, setLoading] = useState(true);
  const skeletonRows = 5;

  const [expandedUser, setExpandedUser] = useState<string | null>(null);

  const handleExpand = (email: string) => {
    if (expandedUser === email) {
      setExpandedUser(null);
    } else {
      setExpandedUser(email);
    }
  };

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      setTimeout(() => {
        setUsers(rawData.users);
        setLoading(false);
      }, 2000);
    };
    fetchData();
  }, []);

  return (
    <div className="bg-white shadow-md rounded-lg p-6">
      <h2 className="text-xl font-bold text-primary mb-4">
        Latest User Sign-ups
      </h2>
      <div className="hidden lg:block">
        <table className="min-w-full bg-white border border-gray-300 rounded-lg">
          <thead>
            <tr>
              <th className="py-4 px-6 border-b border-gray-300 text-left">
                Name
              </th>
              <th className="py-4 px-6 border-b border-gray-300 text-left">
                Email
              </th>
              <th className="py-4 px-6 border-b border-gray-300 text-left">
                Date
              </th>
            </tr>
          </thead>
          <tbody>
            {loading
              ? Array.from({ length: skeletonRows }).map((_, index) => (
                  <SkeletonRow key={index} columns={3} />
                ))
              : users.map((user) => (
                  <tr
                    key={user.email}
                    className="hover:bg-gray-100 transition-colors"
                  >
                    <td className="py-4 px-6 border-b border-gray-300">
                      {user.name}
                    </td>
                    <td className="py-4 px-6 border-b border-gray-300">
                      {user.email}
                    </td>
                    <td className="py-4 px-6 border-b border-gray-300">
                      {user.date}
                    </td>
                  </tr>
                ))}
          </tbody>
        </table>
      </div>
      <div className="lg:hidden">
        {loading
          ? Array.from({ length: skeletonRows }).map((_, index) => (
              <div
                key={index}
                className="border rounded-lg p-4 mb-4 animate-pulse"
              >
                <div className="h-5 bg-gray-300 rounded w-1/3 mb-2"></div>
                <div className="h-4 bg-gray-300 rounded w-1/2"></div>
              </div>
            ))
          : users.map((user) => (
              <div
                key={user.email}
                className="border rounded-lg p-4 mb-4 cursor-pointer"
                onClick={() => handleExpand(user.email)}
              >
                <div className="flex justify-between items-center">
                  <div>
                    <h3 className="text-lg font-bold">{user.name}</h3>
                    <p className="text-sm text-gray-600">{user.email}</p>
                  </div>
                  <button className="text-primary">
                    {expandedUser === user.email ? "View Less" : "View More"}
                  </button>
                </div>
                {expandedUser === user.email && (
                  <div className="mt-4">
                    <p className="text-sm text-gray-600">Date: {user.date}</p>
                  </div>
                )}
              </div>
            ))}
      </div>
    </div>
  );
};

export default UserTable;
