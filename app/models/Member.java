package models;

import javax.persistence.Entity;
import javax.persistence.Id;

import play.db.ebean.Model;

@Entity
public class Member extends Model {

	@Id
	public String email;
	public String name;
	public String password;
	
	public Member(String email,String user,String password){
		this.email = email;
		this.name =user;
		this.password = password;
	}
	
	public static Model.Finder<String,Member> find = new Model.Finder<String,Member>(String.class,Member.class);
	
}
