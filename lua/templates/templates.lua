local M = {}

M.templates = {
    {
        name = "java/class",
        value = require("templates.java.class").template,
    },
    {
        name = "java/interface",
        value = require("templates.java.interface").template,
    },
    {
        name = "java/enum",
        value = require("templates.java.enum").template,
    },
    {
        name = "java/mongo repository",
        value = require("templates.java.mongo_repository").template,
    },
}

return M
