import { Box, Flex } from '@chakra-ui/react';
import React from 'react';
import Metrics from '../../../components/metrics/metrics';
import ChartView from './chartView/chartView';
import UserTable from './userView/userTable';
import { data } from '../../../data/data';
import { formatNumber } from '../../../utils/helper';

const Home = () => {
  const Metricsdata = [
    {
      title: 'Total Users',
      value: formatNumber(data?.metrics?.totalUsers),
    },
    {
      title: 'Active Sessions',
      value: formatNumber(data?.metrics?.activeSessions),
    },
    {
      title: 'Revenue',
      value: formatNumber(data?.metrics?.revenue),
    },
  ];

  return (
    <Box>
      <Metrics data={Metricsdata} />
      <Flex mt="1rem" gap="1rem" flexWrap={'wrap'}>
        <ChartView />
      </Flex>
      <Flex mt="1rem" gap="1rem" flexWrap={'wrap'}>
        <UserTable totalUser={data?.users} />
      </Flex>
    </Box>
  );
};

export default Home;
