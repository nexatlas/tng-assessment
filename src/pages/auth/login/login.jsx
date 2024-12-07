import { Box, Flex, Heading, Text, useToast } from '@chakra-ui/react';
import { useState } from 'react';
import { useDispatch } from 'react-redux';
import { userActionTypes } from '../../../redux/constants/userActionTypes';
import PrimaryButton from '../../../components/primaryButton/primarybutton';
import CustomInput from '../../../components/customInput/customInput';
import AuthBg from '../../../assets/tng.png';
import Logo from '../../../assets/tngLogo.png';

const Login = () => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [isDisabled, setIsDisabled] = useState(false);
  const toast = useToast();
  const dispatch = useDispatch();

  const login = (e) => {
    e.preventDefault();
    setLoading(true);
    setIsDisabled(true);

    const authEmail = process.env.REACT_APP_AUTH_EMAIL;
    const authPass = process.env.REACT_APP_AUTH_PASS;

    if (email === authEmail && password === authPass) {
      localStorage.setItem('TNGTK', 'true');
      dispatch({
        type: userActionTypes.SIGNIN_SUCCESS,
        payload: { email: authEmail },
      });
      dispatch({
        type: userActionTypes.LOADUSER_SUCCESS,
        payload: { email: authEmail },
      });
      window.location.href = '/';
    } else {
      toast({
        title: 'Login Failed',
        description: 'Invalid email or password',
        status: 'error',
        position: 'top-right',
        duration: 5000,
        isClosable: true,
      });
    }

    setLoading(false);
    setIsDisabled(false);
  };

  return (
    <Flex height={'100vh'} flexWrap={'wrap'}>
      <Box flex={'1 1 400px'}>
        <img
          src={AuthBg}
          alt=""
          srcset=""
          style={{
            width: '100%',
            height: '100%',
            objectFit: 'cover',
            objectPosition: 'center',
          }}
        />
      </Box>
      <Flex
        flex={'1 1 400px'}
        p={['1.5rem 1rem', '5.5rem 4rem']}
        bg="#F5F5F5"
        alignItems={'center'}
        justifyContent={'center'}
      >
        <Box
          padding={['2rem .7rem 1.5rem .7rem', '4rem 2rem 1.5rem 2rem']}
          bg="#FFF"
          width={'100%'}
          height={'100%'}
          boxShadow={'0px 4px 24px rgba(0, 0, 0, 0.16)'}
          borderRadius={'8px'}
          textAlign={'center'}
          border="0.5px solid #D0D5DD"
        >
          <img
            src={Logo}
            alt=""
            srcset=""
            style={{
              width: '20%',
              height: '20%',
              objectFit: 'cover',
              objectPosition: 'center',
              margin: '0 auto',
            }}
          />
          <Heading
            mt={6}
            fontWeight={'600'}
            fontSize={['1.35rem', '1.5rem']}
            color="#27272A"
          >
            <span>
              Welcome to MetricWizz
              <br />
            </span>
            Dashboard
          </Heading>
          <Text mt={2} mb="1rem" color={'#3F3F46'} fontSize={'.9rem'}>
            Jump back in.
          </Text>
          <form onSubmit={login}>
            <CustomInput
              placeholder={'Email Address'}
              type="text"
              value={email}
              onChange={(e) => setEmail(e.target.value?.toLowerCase())}
            />

            <CustomInput
              placeholder={'Password'}
              type="password"
              value={password}
              onChange={(e) => setPassword(e.target.value)}
            />
            <Flex
              mb="2rem"
              mt=".5rem"
              justifyContent={'space-between'}
              alignItems={'center'}
            ></Flex>
            <PrimaryButton
              type="submit"
              text="Login"
              loading={loading}
              isDisabled={isDisabled}
            />
          </form>
        </Box>
      </Flex>
    </Flex>
  );
};

export default Login;
