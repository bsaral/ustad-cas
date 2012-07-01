Institution.create(name: 'OMU', route_to: 'http://ustad.omu.edu.tr')

Client.create(name: "client1",
              app_id: "YE0NYveQGoFsNLX220Dy5g",
              app_secret: "aqpGBedDnHFyp5MmgT8KErr9D015ScmaY8r3vHg5C0")

User.create(email: "seyyah@bil.omu.edu.tr",
            password: "secret",
            password_confirmation: "secret",
            first_name: "seyyah",
            last_name: "name",
            status: "Active",
	    institution_id: Institution.first.id)
