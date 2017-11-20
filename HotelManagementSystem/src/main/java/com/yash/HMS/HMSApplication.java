package com.yash.HMS;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
/*import org.springframework.boot.context.web.SpringBootServletInitializer;*/

@SpringBootApplication
public class HMSApplication{
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(HMSApplication.class);
    }
	public static void main(String[] args) {
		SpringApplication.run(HMSApplication.class, args);
	}
}


/*Hello HMS Changes and commits, see you on GitHub!
 * @SpringBootApplication
public class WebApplication extends SpringBootServletInitializer {
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(WebApplication.class);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(WebApplication.class, args);
    }
}*/
