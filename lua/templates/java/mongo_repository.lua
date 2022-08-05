local M = {}

M.template = [[
package {{_java_package_name_}};

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

public interface {{_java_name}} extends MongoRepository<{{_cursor_}}, String> {


}]]

return M
