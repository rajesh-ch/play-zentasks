package models;

import javax.persistence.Entity;
import javax.persistence.Id;

import play.db.ebean.Model;

@Entity
public class User extends Model {

	@Id
	public String email;
	public String name;
	public String password;
	
	public User(String email,String user,String password){
		this.email = email;
		this.name =user;
		this.password = password;
	}
	
	public static Model.Finder<String,User> find = new Model.Finder<String,User>(String.class,User.class);
	
}
