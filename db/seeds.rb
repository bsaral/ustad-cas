#ClientApplication.delete_all
#User.delete_all
#
#ClientApplication.create(
#  :name => "secret",
#  :app_id => "demo_id",
#  :app_secret => "demo_secret"
#)
#
#User.create(
#  :username => "demo",
#  :password_hash => User.hash_password("password", "salt"),
#  :password_salt => "salt",
#  :status => "Active",
#  :expiration_date => "2020-01-01"
#)

Client.create(name: "client1",
              app_id: "YE0NYveQGoFsNLX220Dy5g",
              app_secret: "aqpGBedDnHFyp5MmgT8KErr9D015ScmaY8r3vHg5C0")

User.create(email: "seyyah@bil.omu.edu.tr",
            password: "secret",
            password_confirmation: "secret",
            first_name: "seyyah",
            last_name: "name",
            status: "Active")
