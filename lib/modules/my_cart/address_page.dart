import 'package:e_comm/core/app_color.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Address",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressFormPage()));
                    },
                    child: Text(
                      "Add new Address",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ))
              ],
            ),
            AddressCard(),
            SizedBox(height: 20),
            AddressCard(),
          ],
        ),
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  const AddressCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 10,
                  ),
                ),
                Spacer(),
                Icon(Icons.edit),
                Icon(
                  Icons.delete,
                  color: Colors.red,
                )
              ],
            ),
            SizedBox(height: 20),
            Text("Al Shark tower, 845 plote,kuwait ,kuwait 184154")
          ],
        ),
      ),
    );
  }
}

class AddressFormPage extends StatelessWidget {
  const AddressFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Address"),
        backgroundColor: AppColor.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            // First Name Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'First Name',
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            // Last Name Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            // Email Field
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            // Mobile Field
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Mobile',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            // Address Field
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
            ),

            // Country Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Country',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              items: ['USA', 'India', 'Canada'] // Add countries here
                  .map((country) => DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      ))
                  .toList(),
              onChanged: (value) {
                // Handle country change if needed
              },
            ),

            // Region/State Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Region/State',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              items: ['California', 'Texas', 'Ontario']
                  .map((state) => DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      ))
                  .toList(),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddressPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
