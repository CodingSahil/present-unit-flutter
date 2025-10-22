num getNewID(List<num> listOfID) {
  listOfID.sort((a, b) => a.compareTo(b),);
  return listOfID.last + 1;
}

num getNewRollNumber(List<num> listOfID) {
  listOfID.sort((a, b) => a.compareTo(b),);
  return listOfID.last + 1;
}