local M = {}

M.template = [[
package {{_java_package_name_}};

public interface {{_java_name}} {

    {{_cursor_}}
}]]

return M
