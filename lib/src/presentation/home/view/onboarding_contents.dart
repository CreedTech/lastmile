class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Fast and seamless delivery",
    image: "assets/images/onboardingOne.png",
    desc:
        "We deliver your parcels to every corner, no location is beyond your reach",
  ),
  OnboardingContents(
    title: "24 hours delivery",
    image: "assets/images/onboardingTwo.png",
    desc:
        "We delivery your parcels to every corner, no location is beyond oyr reach",
  ),
  OnboardingContents(
    title: "On demand and runtime location",
    image: "assets/images/onboardingThree.png",
    desc:
        "We pick up from your desired location at your preferred date and time",
  ),
];
