package models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import play.db.ebean.Model;

@Entity
public class Task extends Model {
	@Id
	public Long id;
	public String title;
	public boolean done = false;
	public Date dueDate;
	public String folder;
	@ManyToOne
	public User assignedTo;
	@ManyToOne
	public Project project;
	
	public static Finder<Long,Task> find = new Model.Finder(Long.class,Task.class);
	
	
	public Task create(Task task, Long project , String folder)
	{
		task.project = Project.find.ref(project);
		task.folder  = folder;
		task.save();
		return task;
	}
	
}
