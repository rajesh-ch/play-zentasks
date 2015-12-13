package models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

import play.db.ebean.Model;

@Entity
public class Project extends Model {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	public Long id;
	public String name;
	public String folder;
	
	@ManyToMany(cascade = CascadeType.REMOVE)
	public List<Member> members = new ArrayList<Member>();
	
	public Project(String name, String folder, Member owner)
	{
		
		this.name = name;
		this.folder = folder;
		this.members.add(owner);
		
	}
	
	public static Model.Finder<Long,Project> find = new Finder<Long, Project>(Long.class, Project.class); 

	public static Project create(String name,String folder,String owner){
		
		Project project = new Project(name,folder,Member.find.ref(owner));
		project.save();
		project.saveManyToManyAssociations("members");
		
		
		return project;
		
	}
	
	
	public static List<Project> findInvolving(String user){
		return find.where().eq("members.email", user).findList();
	}

}
