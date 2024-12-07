import './sidebar.scss';
import authBg from '../../assets/tngLogo.png';
import { NavLink, useLocation, useNavigate } from 'react-router-dom';
import User from './icons/user.svg';
import {
  Avatar,
  Box,
  Flex,
  Image,
  Switch,
  Text,
  useBreakpointValue,
} from '@chakra-ui/react';
import { ChevronDownIcon, ChevronRightIcon } from '@chakra-ui/icons';
import { useState } from 'react';
import { FiSettings } from 'react-icons/fi';
import { AiOutlineAppstore, AiOutlineSetting } from 'react-icons/ai';
import { FaRegUser } from 'react-icons/fa';
import { HiOutlineLogout } from 'react-icons/hi';
import { truncateText } from '../../utils/helper';
import { useSelector } from 'react-redux';

const Sidebar = ({ collapsed, setCollapsed }) => {
  const { pathname } = useLocation();
  const [expanded, setExpanded] = useState('');
  const [expandedx, setExpandedx] = useState(false);
  const [ProfileBlobOpen, setProfileBlobOpen] = useState(false);

  const navigate = useNavigate();

  const currentUser = useSelector(({ userData }) => userData.currentUser);

  const handleExpanded = (name, route) => {
    setExpandedx(!expandedx);
    setExpanded(name);
    navigate(route);
  };

  const isMobile = useBreakpointValue({ base: true, md: false });

  const handleItemClick = (name, route) => {
    if (isMobile) setCollapsed(true);
    handleExpanded(name, route);
  };

  const logout = () => {
    localStorage.removeItem('TNGTK');
    window.location.href = '/';
  };

  const sideNavData = [
    {
      icon: (
        <AiOutlineAppstore
          style={{
            marginLeft: collapsed ? '1rem' : '',
            transform: collapsed ? 'scale(1.3)' : '',
          }}
          className="img"
        />
      ),
      name: 'Dashboard',
      subNavs: [],
      routes: ['/'],
    },
    {
      icon: (
        <FaRegUser
          style={{
            marginLeft: collapsed ? '1rem' : '',
            transform: collapsed ? 'scale(1.3)' : '',
          }}
          className="img"
        />
      ),
      name: 'Profile',
      subNavs: [],
      routes: ['/profile'],
    },

    {
      icon: (
        <FiSettings
          style={{
            marginLeft: collapsed ? '1rem' : '',
            transform: collapsed ? 'scale(1.3)' : '',
          }}
          className="img"
        />
      ),
      name: 'Settings',
      subNavs: [],
      routes: ['/settings'],
    },
  ];

  const currData = sideNavData;

  return (
    <Box
      display={['block', 'block', 'block', 'block']}
      left={collapsed ? ['-100%', '-100%', '0', '0'] : '0'}
      width={!collapsed ? '240px' : '80px'}
      className={collapsed ? 'col sidebar' : 'ex sidebar'}
    >
      <Flex
        px="1rem"
        py="1.5rem"
        alignItems={'center'}
        justifyContent={'space-between'}
        flexDirection={collapsed ? 'column' : 'row'}
        gap={collapsed ? '1rem' : ''}
        mt="1rem"
      >
        {collapsed ? (
          <Image
            display={['none', 'block']}
            transform={'scale(1.2)'}
            transition="all 250ms ease-in-out"
            width={'60%'}
            src={authBg}
          />
        ) : (
          <Image width={'30%'} src={authBg} display={['none', 'block']} />
        )}
        <Switch
          onChange={() => setCollapsed(!collapsed)}
          defaultChecked={collapsed}
          colorScheme="blue"
          size="md"
        />
      </Flex>

      <div className="nav">
        {currData?.map(({ name, icon, subNavs, routes }, index) => {
          return (
            <Box key={name} mt={index === 8 ? '2rem' : '0'}>
              {subNavs?.length > 0 ? (
                <Text
                  cursor={'pointer'}
                  onClick={() => handleItemClick(name, routes[0])}
                  className={
                    // routes.includes(pathname)
                    expanded === name ? 'list-item activexx' : 'list-item'
                  }
                  to={routes[0]}
                >
                  {icon}
                  {!collapsed && (
                    <>
                      <span className="label">{name}</span>
                      {expandedx === true && expanded === name ? (
                        <ChevronDownIcon
                          position={'absolute'}
                          fontSize={'1.3rem'}
                          right={'5%'}
                          color={'#B5B6BA'}
                        />
                      ) : (
                        <ChevronRightIcon
                          position={'absolute'}
                          fontSize={'1.3rem'}
                          right={'5%'}
                          color={'#B5B6BA'}
                        />
                      )}
                    </>
                  )}
                </Text>
              ) : (
                <NavLink
                  onClick={() => handleItemClick(name, routes[0])}
                  className={
                    routes.includes(pathname)
                      ? 'list-item activex'
                      : 'list-item'
                  }
                  to={routes[0]}
                >
                  {icon}
                  {!collapsed && (
                    <>
                      <span className="label">{name}</span>
                    </>
                  )}
                </NavLink>
              )}
              {expandedx === true ? (
                expanded === name && subNavs?.length > 0 ? (
                  <Box>
                    {subNavs?.map(({ name, route }) => {
                      return (
                        <NavLink
                          key={name}
                          style={{ paddingLeft: '2.4rem' }}
                          className={
                            [route].includes(pathname)
                              ? 'list-item activexxx'
                              : 'list-item'
                          }
                          to={route}
                        >
                          {!collapsed && (
                            <>
                              <span className="label">{name}</span>
                              <ChevronRightIcon
                                position={'absolute'}
                                fontSize={'1.3rem'}
                                right={'5%'}
                                color={'#B5B6BA'}
                              />
                            </>
                          )}
                        </NavLink>
                      );
                    })}
                  </Box>
                ) : null
              ) : null}
            </Box>
          );
        })}
      </div>

      <Box
        position={'absolute'}
        left={'5%'}
        bottom={collapsed ? '.7%' : '1.5%'}
        bg="#FFEAEA"
        width={'90%'}
        mx="auto"
        borderRadius={'14px'}
        p=".5rem"
      >
        <Flex
          onClick={() => setProfileBlobOpen(!ProfileBlobOpen)}
          cursor={'pointer'}
          transform={collapsed ? 'scale(.7)' : 'scale(1)'}
          alignItems={'center'}
          gap=".4rem"
        >
          <Avatar border={'1.73913px solid #F97066'} src={User} />
          {!collapsed && (
            <>
              <Box color={'#667085'} mt=".2rem">
                <Text
                  color={'#667085'}
                  opacity={'.8'}
                  fontSize={'.7rem'}
                  mb=".3rem"
                >
                  {truncateText(currentUser?.email, 17)}
                </Text>
              </Box>
              <ChevronRightIcon
                position={'absolute'}
                fontSize={'1.3rem'}
                right={'5%'}
                color={'#B5B6BA'}
                transition={'250ms ease'}
                transform={ProfileBlobOpen ? 'rotate(90deg)' : ''}
              />
            </>
          )}
        </Flex>
        <Box
          height={ProfileBlobOpen ? '94px' : '0px'}
          overflow={'hidden'}
          transition={'250ms ease'}
          mt={!ProfileBlobOpen ? '0' : '.8rem'}
          width={'100%'}
          mx="auto"
          borderRadius={'12px'}
          bg="#FFF"
          boxShadow={'0px 4px 24px rgba(0, 0, 0, 0.16)'}
        >
          <Box p=".5rem .6rem">
            <Flex
              onClick={() => navigate('/dashboard/settings')}
              alignItems={'center'}
              justifyContent={'space-between'}
              color={'#000F14'}
              cursor={'pointer'}
              transition={'250ms ease'}
              _hover={{ backgroundColor: '#003C4E', color: '#FFF !important' }}
              p=".5rem"
              borderRadius={'6px'}
            >
              <Flex alignItems={'center'}>
                <AiOutlineSetting
                  color="inherit"
                  style={{
                    display: 'inline',
                    transform: 'translateY(1px) scale(1.3)',
                    marginRight: '.7rem',
                  }}
                />
                {!collapsed && (
                  <Text fontSize={'.8rem'} color="inherit" fontWeight={'500'}>
                    {' '}
                    Settings
                  </Text>
                )}
              </Flex>
              {!collapsed && <ChevronRightIcon color={'inherit'} />}
            </Flex>

            <Flex
              onClick={logout}
              alignItems={'center'}
              justifyContent={'space-between'}
              color={'#000F14'}
              cursor={'pointer'}
              transition={'250ms ease'}
              _hover={{ backgroundColor: '#003C4E', color: '#FFF !important' }}
              p=".5rem"
              borderRadius={'6px'}
            >
              <Flex alignItems={'center'}>
                <HiOutlineLogout
                  color="inherit"
                  style={{
                    display: 'inline',
                    transform: 'translateY(2px) scale(1.2) rotate(180deg)',
                    marginRight: '.7rem',
                  }}
                />
                {!collapsed && (
                  <Text fontSize={'.8rem'} color="inherit" fontWeight={'500'}>
                    {' '}
                    Logout
                  </Text>
                )}
              </Flex>
              {!collapsed && <ChevronRightIcon color={'inherit'} />}
            </Flex>
          </Box>
        </Box>
      </Box>
    </Box>
  );
};

export default Sidebar;
