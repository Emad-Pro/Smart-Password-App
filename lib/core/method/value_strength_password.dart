String valueStrengthPassword(double strength) {
  return strength > 0.0 && strength <= 0.2
      ? "Weak password"
      : strength > 0.2 && strength <= 0.4
          ? "Medium strength password"
          : strength > 0.4 && strength <= 0.6
              ? "Strong password"
              : strength > 0.6 && strength <= 0.8
                  ? "A very strong password"
                  : "unbreakable password";
}
