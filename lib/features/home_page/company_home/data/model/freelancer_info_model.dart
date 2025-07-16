
class FreeLancerInfoModel {
  final int id;
  final String firstName;
  
  final String major;
  final image;
  final String studyCase;
  final String email;
  final String phoneNumber;
  final List projects;
  final String bio;
  final String location;
  final openToWork;
  final int numOfFollowers;
  final coverPhoto;
  FreeLancerInfoModel(
      this.id,
      this.firstName,
      this.major,
      this.image,
      this.studyCase,
      this.email,
      this.phoneNumber,
      this.projects,
      this.bio,
      this.location,
      this.openToWork,
      this.numOfFollowers,
      this.coverPhoto);
}
