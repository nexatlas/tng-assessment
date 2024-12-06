import {
  Table,
  Tbody,
  Td,
  Text,
  Th,
  Thead,
  Tr,
  Box,
  Flex,
} from '@chakra-ui/react';
import CustomInput from '../../../../components/customInput/customInput';
import React, { useEffect, useState } from 'react';
import EmptyState from '../../../../components/emptyState/emptyState';
import moment from 'moment';

const UserTable = ({ totalUser }) => {
  const [searchVal, setSearchVal] = useState('');
  const [filteredUser, setFilteredUser] = useState([]);

  //  Search User Function
  const searchUser = () => {
    const search = totalUser.filter((user) => {
      return user.name.toLowerCase().includes(searchVal.toLowerCase());
    });
    setFilteredUser(search);
  };

  useEffect(() => {
    searchUser();
  }, [searchVal]);

  return (
    <Box bg="#FFF" mt=".7rem" p="1.5rem 1rem" borderRadius={'12px'} w={'100%'}>
      <Flex
        gap="1.5rem"
        alignItems={'center'}
        justifyContent={'space-between'}
        flexDirection={{ base: 'column', md: 'row' }}
      >
        <Text
          whiteSpace={'nowrap'}
          fontWeight={'500'}
          fontSize={'1.15rem'}
          color={'#27272A'}
          mb={{ base: '1rem', md: '0' }}
        >
          Total Users
          <span
            style={{
              padding: '.1rem .3rem',
              marginLeft: '.5rem',
              borderRadius: '50%',
              backgroundColor: '#F9FAFB',
              border: '1px solid #EAECF0',
              fontSize: '12px',
              fontWeight: '500',
              color: '#344054',
            }}
          >
            {filteredUser?.length}
          </span>
        </Text>
        <Box w={{ base: '100%', md: 'auto' }}>
          <CustomInput
            type={'text'}
            required
            value={searchVal}
            placeholder={`Search users...`}
            onChange={(e) => setSearchVal(e.target.value)}
            mt="0"
            sType="search"
            py="1.19rem"
            width={{ base: '100%', md: '350px' }}
          />
        </Box>
      </Flex>
      <Box overflowX="auto">
        <Table mt="1.2rem" borderRadius={'12px'} overflow={'hidden'}>
          <Thead bg="#F9FAFB" border="1px solid #EAECF0">
            <Tr>
              <Th textTransform={'capitalize !important'} color={'#475467'}>
                User's Name
              </Th>
              <Th textTransform={'capitalize !important'} color={'#475467'}>
                Email Address
              </Th>
              <Th textTransform={'capitalize !important'} color={'#475467'}>
                Date
              </Th>
            </Tr>
          </Thead>

          {filteredUser?.length < 1 ? (
            <EmptyState mt="1.5rem" text="There are no users yet" />
          ) : (
            <Tbody>
              {filteredUser?.map(({ name, email, date }, i) => {
                return (
                  <Tr key={i}>
                    <Td color={'#475467'} fontSize={'.9rem'} fontWeight={'500'}>
                      {name}
                    </Td>
                    <Td>
                      <Text
                        mb=".2rem"
                        color={'#101828'}
                        fontSize={'.9rem'}
                        fontWeight={'500'}
                        textTransform={'capitalize'}
                      >
                        {email}
                      </Text>
                    </Td>
                    <Td color={'#475467'} fontSize={'.9rem'}>
                      {moment(date).format('DD-MMM-YYYY')}
                    </Td>
                  </Tr>
                );
              })}
            </Tbody>
          )}
        </Table>
      </Box>
    </Box>
  );
};

export default UserTable;
