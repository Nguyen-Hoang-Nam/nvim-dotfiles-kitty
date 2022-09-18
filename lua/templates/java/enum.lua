local M = {}

M.template = [[
package {{_java_package_name_}};

public enum {{_java_name}} {

    {{_cursor_}}
}]]

return M
