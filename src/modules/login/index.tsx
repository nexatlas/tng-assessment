import { LogoColored } from "assets";
import styles from "./styles.module.scss";
import { useState } from "react";
import { Button, Input } from "components";
import { emailRegex, passwordRegex } from "utils/regex";

interface LoginData {
  email: string;
  password: string;
}

interface LoginErrorData {
  email?: string;
  password?: string;
}

interface LoginUIProps {
  submit: (data: LoginData) => void;
}

const LoginUI = ({ submit }: LoginUIProps) => {
  const [formState, setFormState] = useState<LoginData>({
    email: "",
    password: "",
  });

  const [errors, setErrors] = useState<LoginErrorData | undefined>();

  const onSubmit = () => {
    let errors: LoginErrorData = {};
    setErrors(undefined);

    if (!formState.email) errors.email = "Email is required";
    else if (!emailRegex.test(formState.email))
      errors.email = "Enter a valid email";

    if (!formState.password) errors.password = "Password is required";
    else if (!passwordRegex.test(formState.password))
      errors.password =
        "Password must have at least 8 characters, a digit and a special character";

    if (Object.keys(errors).length == 0) {
      submit(formState);
    } else {
      setErrors(errors);
    }
  };

  return (
    <>
      <section className={styles.container}>
        <div className={styles.logoSec}>
          <LogoColored className={styles.logoSec__logo} />
          <span className={styles.logoSec__txt}>MetricWizz</span>
        </div>
        <h1 className={styles.ttl}>Sign in to your account</h1>

        <form className={styles.form}>
          <Input
            label="Email address"
            placeholder="Enter your email address"
            onChange={(e) =>
              setFormState((prev) => ({ ...prev, email: e.target.value }))
            }
            value={formState?.email}
            name="email"
            type="email"
            validatorMessage={errors?.email}
          />
          <Input
            label="Password"
            placeholder="Enter your password"
            onChange={(e) =>
              setFormState((prev) => ({ ...prev, password: e.target.value }))
            }
            value={formState?.password}
            name="password"
            type="password"
            validatorMessage={errors?.password}
          />
          <Button className={styles.btn} onClick={onSubmit} variant={"fill"}>
            Login
          </Button>
        </form>
      </section>
    </>
  );
};

export { LoginUI };
