class People{
  String id;
  String name;
  String gender;
  String email;
  String address;
  String photo;

  People(this.id, this.name, this.gender, this.email, this.address, this.photo);
  static List<People> generate(){
    var ls = [
      People(
        '1', 
        'Tito', 
        'Male', 
        'titotom@gmail.com', 
        'Phnom Penh', 
        'images/eagle_logo.png'
      ),
      People(
        '2', 
        'Dr. Pol', 
        'Male', 
        'titotom@gmail.com', 
        'Phnom Penh', 
        'images/eagle_logo.png'
      ),
      People(
        '2', 
        'Dr. Pol', 
        'Male', 
        'titotom@gmail.com', 
        'Phnom Penh', 
        'images/eagle_logo.png'
      ),
      People(
        '3', 
        'Dr. Roberto', 
        'Male', 
        'titotom@gmail.com', 
        'Phnom Penh', 
        'images/eagle_logo.png'
      ),
      People(
        '4', 
        'Dr. Tozo', 
        'Male', 
        'titotom@gmail.com', 
        'Phnom Penh', 
        'images/eagle_logo.png'
      ),
      People(
        '5', 
        'Dr. TribleT', 
        'Male', 
        'titotom@gmail.com', 
        'Phnom Penh', 
        'images/eagle_logo.png'
      ),
    ];
    return ls;
  }
}