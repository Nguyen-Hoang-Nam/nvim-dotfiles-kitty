local M = {}

M.template = [[
package {{_java_package_name_}};

public class {{_java_name}} {

    {{_cursor_}}
}]]

return M
