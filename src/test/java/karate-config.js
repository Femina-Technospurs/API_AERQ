function fn() {
	var config = {
		name : "QA",
		idvalue : "123",
		baseURL: "http://122.165.121.195:8080",
		authenticate: {"email": "14177@email.com", "password": "test@1234"},
		use_config: false,
		use_random: true,		
	};
	if (config.use_config == true) {	
	} else if (config.use_config == false) {	}

	
	var env = karate.env
	karate.log('The value of env is : ',env)

	karate.configure('connectTimeout', 500000);
	karate.configure('readTimeout', 500000);

	return config;

}