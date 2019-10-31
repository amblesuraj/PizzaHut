package com.ngu;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.ngu.Service.UserService;



@EnableWebSecurity
@Configuration
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	
	@Autowired
	private UserService userService;
		
		@Autowired
		private DataSource dataSource;
		
//		private final String userQuery="select username ,password ,active from user where username=?";
//		private final String roleQuery="select u.username,r.role from user u inner join user_role ur on (u.id=ur.user_id) inner join role r on (ur.role_id=r.role_id) where u.username=?";
		
//		@Bean
//		public LogoutSuccessHandler logoutSuccessHandler() {
//		    return new CustomLogoutSuccessHandler();
//		}
		
//		@Bean
//		private SessionRegistry sessionRegistry()
//		{
//			return new SessionRegistryImpl();
//			
//		}
		
		
			
//		@Bean
//		public AuthenticationSuccessHandler successHandler() {
//		    SimpleUrlAuthenticationSuccessHandler handler = new SimpleUrlAuthenticationSuccessHandler();
//		    handler.setUseReferer(true);
//		    return handler;
//		}
		
		@Autowired
		private CustomLogoutHandler LogoutHandler;

		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.cors().and().csrf().disable();
		
			http.authorizeRequests()
				
			.antMatchers("/superadmin/**").hasAuthority("SUPERADMIN")
			.antMatchers("/admin/**").hasAnyAuthority("SUPERADMIN","ADMIN")
			.antMatchers("/employee/**").hasAnyAuthority("SUPERADMIN","ADMIN","EMPLOYEE")
			.antMatchers("/cart/**").hasAnyAuthority("SUPERADMIN","ADMIN","EMPLOYEE","USER")
			.anyRequest().authenticated()
			.antMatchers("/anonymous*","/user/**").anonymous()
			.antMatchers("/index","/").permitAll().antMatchers("/").permitAll().antMatchers("/home").permitAll()
			.antMatchers("/dashboard/login").permitAll()
			.antMatchers("/resources/**").permitAll()
			.anyRequest().permitAll()
			.and()
			.formLogin().loginPage("/dashboard/login")
			.loginProcessingUrl("/dashboard/process-login")
			.defaultSuccessUrl("/index")
			.successHandler(new CustomLoginSuccessHandler())
			.failureUrl("/dashboard/login?error")
			.usernameParameter("username").passwordParameter("password")
			.and()
			.logout().logoutUrl("/dashboard/logout")
			.logoutSuccessHandler(new CustomLogoutHandler())
			

			.deleteCookies("JSESSIONID")
			.invalidateHttpSession(true)
			
			.and()
			
			.rememberMe().rememberMeParameter("remember-me").tokenRepository(persistentTokenRepository()).alwaysRemember(true).tokenValiditySeconds(2592000)
			.and()
			.exceptionHandling().accessDeniedPage("/dashboard/accessDenied");
		}
		@Bean
		public PersistentTokenRepository persistentTokenRepository()
		{
			JdbcTokenRepositoryImpl jdbcTokenRepositoryImpl = new JdbcTokenRepositoryImpl();
			jdbcTokenRepositoryImpl.setDataSource(dataSource);
			return jdbcTokenRepositoryImpl;
		}

			
		//
		
		
		//For in-memory database fetch
//		@Bean
//		public AuthenticationProvider authprovider()
//		{
//			DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
//			provider.setUserDetailsService(userService);
//			provider.setPasswordEncoder(NoOpPasswordEncoder.getInstance());
//			return provider;
//		}
		
		@Bean
	    public BCryptPasswordEncoder bCryptPasswordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
		
	    @Bean
	    public AuthenticationManager customAuthenticationManager() throws Exception {
	        return authenticationManager();
	    }

	    @Autowired
	    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	        auth.userDetailsService(userService).passwordEncoder(bCryptPasswordEncoder());
	    }

		
//	    @Autowired
//		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//				auth.jdbcAuthentication()
//				.usersByUsernameQuery(userQuery)
//				.authoritiesByUsernameQuery(roleQuery)
//				.dataSource(dataSource)
//				.passwordEncoder(bCryptPasswordEncoder());
//		}
	    
	    
	    
//		http.sessionManagement().maximumSessions(1).sessionRegistry(sessionRegistry());

//		.antMatchers("/superadmin","superadmin/**").access("hasAuthority('SUPERADMIN')")
//		.antMatchers("/admin","admin/**").access("hasAuthority('SUPERADMIN') or hasAuthority('ADMIN')")
//		.antMatchers("/employee/").access("hasAuthority('SUPERADMIN') or hasAuthority('ADMIN') or hasAuthority('EMPLOYEE')")


	    @Bean
		public MultipartResolver multipartResolver()
		{
			return new StandardServletMultipartResolver();
		}
		

}
