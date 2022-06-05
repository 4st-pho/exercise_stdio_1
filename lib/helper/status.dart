List<String> getStatus(double status) {
  if (status >= 0 && status <= 1) {
    return ['assets/images/status_1.png', 'Very bad'];
  } else if (status > 1 && status <= 2) {
    return ['assets/images/status_2.png', 'Bad'];
  } else if (status > 2 && status <= 3) {
    return ['assets/images/status_3.png', 'Not bad'];
  } else if (status > 3 && status <= 4) {
    return ['assets/images/status_4.png', 'Good'];
  } else if (status > 4 && status <= 5) {
    return ['assets/images/status_5.png', 'Very Good'];
  } else {
    return ['assets/images/status_6.png', 'Awesome'];
  }
}
