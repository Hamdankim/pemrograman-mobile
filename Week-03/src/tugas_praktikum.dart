void main() {
  for (int num = 0; num <= 201; num++) {
    if (isPrime(num)) {
      print('[$num] Hamdan Azizul Hakim / 2341720251');
    }
  }
}

bool isPrime(int num) {
  if (num <= 1) {
    return false;
  }

  for (int i = 2; i <= num / 2; i++) {
    if (num % i == 0) {
      return false;
    }
  }

  return true;
}
