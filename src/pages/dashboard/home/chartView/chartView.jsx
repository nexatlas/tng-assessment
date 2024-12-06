import React from 'react';
import { Box, Divider, Flex, Text } from '@chakra-ui/react';
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  Tooltip,
  ResponsiveContainer,
} from 'recharts';
import EmptyState from '../../../../components/emptyState/emptyState';
import Illu from './illu.svg';
import { data } from '../../../../data/data';

const ChartView = () => {
  // Activity data for the last 7 days
  const activityData = data?.activity.map((value, index) => ({
    day: `Day ${index + 1}`,
    activity: value,
  }));

  return (
    <Box
      boxShadow="0px 1px 2px 0px #1018280D"
      flex={['1 0 300px', '1 1 400px']}
      bg="#FFF"
      border=".5px solid #F2F4F7"
      p="1.3rem"
      borderRadius={'12px'}
    >
      <Flex alignItems={'center'} justifyContent={'space-between'}>
        <Text
          whiteSpace={'nowrap'}
          fontWeight={'500'}
          fontSize={'1.15rem'}
          color={'#27272A'}
        >
          User Activity Last 7 Days
        </Text>
      </Flex>
      <Divider my="1.5rem" />
      <Box
        height={'267.41px'}
        overflow={'hidden'}
        sx={{
          '::-webkit-scrollbar': {
            display: 'none',
          },
        }}
      >
        {activityData.length < 1 ? (
          <EmptyState img={Illu} mt="1.5rem" text="No data to measure yet" />
        ) : (
          <ResponsiveContainer width="100%" height="100%">
            <BarChart
              data={activityData}
              margin={{ top: 5, right: 30, left: 20, bottom: 5 }}
            >
              <XAxis dataKey="day" />
              <YAxis />
              <Tooltip
                cursor={{ fill: 'rgba(0, 0, 0, 0.1)' }}
                contentStyle={{ borderRadius: '8px', padding: '10px' }}
              />
              <Bar dataKey="activity" fill="#3182CE" radius={[4, 4, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        )}
      </Box>
    </Box>
  );
};

export default ChartView;
