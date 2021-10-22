import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dateOfBirthController = TextEditingController();

  String dropdownvalue = 'Male';
  var items = [
    'Male',
    'Female',
    'Other',
  ];

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_outlined,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage('assets/images/userImage.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            _buildTextField("Name", Icons.perm_identity, _nameController),
            SizedBox(height: 10),
            _buildTextField("Email", Icons.email_outlined, _emailController),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Icon(
                        Icons.person,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: DropdownButton(
                        elevation: 3,
                        isExpanded: true,
                        underline: Container(height: 0),
                        value: dropdownvalue,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                              value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        offset: const Offset(4, 4),
                        blurRadius: 8),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    constraints: BoxConstraints(
                      minHeight: 50,
                      maxHeight: 160,
                    ),
                    child: TextField(
                      onTap: () {
                        _selectDate(context);
                      },
                      controller: _dateOfBirthController,
                      readOnly: true,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF313A44),
                      ),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                        ),
                        border: InputBorder.none,
                        hintText: "Date of Birth",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // update button
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          offset: const Offset(4, 4),
                          blurRadius: 8),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dateOfBirthController.text =
            "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
      });
  }

  _buildTextField(String hintText, IconData icon, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: BoxConstraints(
              minHeight: 50,
              maxHeight: 160,
            ),
            color: Colors.white,
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF313A44),
              ),
              decoration: InputDecoration(
                icon: Icon(icon, color: Colors.grey),
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
