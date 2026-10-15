
enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String Street;
  final String City;
  final int Zipcode;

  Address({ 
  required this.Street,
  required this.City, 
  required this.Zipcode
  });

  @override
  String toString () {
    return "Street: $Street, City: $City, Zipcode: $Zipcode";
  }
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skill;
  final Address _address;
  final int _yearOfEx; 

  Employee({
    required String name, 
    required double baseSalary, 
    required List<Skill> skill, 
    required Address address, 
    required int yearOfEx
}): _name = name, 
    _baseSalary = baseSalary,
    _skill = skill,
    _address = address,
    _yearOfEx = yearOfEx;

  Employee.mobileDeveloper({
    required String name, 
    required double baseSalary, 
    required List<Skill> skill, 
    required Address address, 
    required int yearOfEx
}): _name = name, 
    _baseSalary = baseSalary,
    _skill = const [Skill.FLUTTER, Skill.DART],
    _address = address,
    _yearOfEx = yearOfEx;

  Employee.backendDeveloper ({
    required String name, 
    required double baseSalary, 
    required List<Skill> skill, 
    required Address address, 
    required int yearOfEx
}): _name = name, 
    _baseSalary = baseSalary,
    _skill = const [Skill.FLUTTER, Skill.OTHER],
    _address = address,
    _yearOfEx = yearOfEx;

  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skill => _skill;
  Address get address => _address;
  int get yearOfEx => _yearOfEx;

  double computeSalary (){
    double bonus = _baseSalary;
    bonus += _yearOfEx * 2000;
    
    for (final skill in _skill) {
      bonus += switch ( skill ) {
        Skill.FLUTTER => 5000,
        Skill.DART => 3000,
        Skill.OTHER => 1000,
      };
    }

    return bonus;
  }

  void printDetails() {
    final skillNames = _skill.map((s) => s.name).join(", ");
    print('Employee: $_name');
    print('Base Salary: \$${_baseSalary.toStringAsFixed(0)}');
    print('Years      : $_yearOfEx');
    print('Skills     : $skillNames');
    print('Address    : $_address');
    print('Salary     : \$${computeSalary().toStringAsFixed(0)}');
  }
}

void main() {
 var emp1 = Employee.mobileDeveloper(name: 'Sokea', baseSalary:  40000, skill: [Skill.FLUTTER,Skill.DART],address: Address(Street: '123 Main St', City: 'PP', Zipcode: 12000), yearOfEx: 3);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(name: 'Ronan', baseSalary:  45000, skill: [Skill.FLUTTER,Skill.OTHER],address: Address(Street: '123 Main St', City: 'PP', Zipcode: 12000), yearOfEx: 5);
  emp2.printDetails();
}