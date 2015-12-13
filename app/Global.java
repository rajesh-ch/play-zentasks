

import play.libs.*;
import com.avaje.ebean.Ebean;
import models.*;
import java.util.*;
import play.*;
public class Global extends GlobalSettings {
    @Override
    public void onStart(Application app) {
        // Check if the database is empty
        if (Member.find.findRowCount() == 0) {
            Ebean.save((List) Yaml.load("test-data.yml"));
        }
    }
}