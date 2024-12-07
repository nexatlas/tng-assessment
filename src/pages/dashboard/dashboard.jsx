import { Box, Flex } from '@chakra-ui/react';
import Sidebar from '../../components/sidebar/sidebar';
import Navbar from '../../components/navbar/navbar';

const Dashboard = ({ collapsed, setCollapsed, component }) => {
  return (
    <Flex>
      <Sidebar collapsed={collapsed} setCollapsed={setCollapsed} />
      <Box
        ml={
          collapsed ? ['0', '0', '80px', '80px'] : ['0', '0', '240px', '240px']
        }
        width={'100%'}
        transform={'250ms ease'}
      >
        <Navbar collapsed={collapsed} setCollapsed={setCollapsed} />
        <Box
          padding={'104px 1rem 1rem 1rem'}
          height={'99vh'}
          overflowY={'scroll'}
        >
          {component}
        </Box>
      </Box>
    </Flex>
  );
};

export default Dashboard;
