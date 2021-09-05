-- Credit https://github.com/meepen/Lua-5.1-UTF-8/blob/master/utf8.lua

local bit = bit
local error = error
local ipairs = ipairs
local unpack = unpack

module('utf8')

--
-- Transforms indexes of a string to be positive.
-- Negative indices will wrap around like the string library's functions.
--
local function strRelToAbs(str, ...)
    local args = { ... }

    for k, v in ipairs(args) do
        v = v > 0 and v or #str + v + 1

        if v < 1 or v > #str then
            error('bad index to string (out of range)', 3)
        end

        args[k] = v
    end

    return unpack(args)
end

-- Decodes a single UTF-8 byte-sequence from a string, ensuring it is valid
-- Returns the index of the first and last character of the sequence
--
local function decode(str, startPos)
    startPos = strRelToAbs(str, startPos or 1)

    local b1 = str:byte(startPos, startPos)

    -- Single-byte sequence
    if b1 < 0x80 then
        return startPos, startPos
    end

    -- Validate first byte of multi-byte sequence
    if b1 > 0xF4 or b1 < 0xC2 then
        return nil
    end

    -- Get 'supposed' amount of continuation bytes from primary byte
    local contByteCount = b1 >= 0xF0 and 3 or b1 >= 0xE0 and 2 or b1 >= 0xC0 and 1

    local endPos = startPos + contByteCount

    -- Validate our continuation bytes
    for _, bX in ipairs({ str:byte(startPos + 1, endPos) }) do
        if bit.band(bX, 0xC0) ~= 0x80 then
            return nil
        end
    end

    return startPos, endPos
end

--
-- Returns the length of a UTF-8 string. false, index is returned if an invalid sequence is hit
-- startPos defaults to 1, endPos defaults to -1
--
function len(str, startPos, endPos)
    startPos, endPos = strRelToAbs(str, startPos or 1, endPos or -1)

    local len = 0

    repeat
        local seqStartPos, seqEndPos = decode(str, startPos)

        -- Hit an invalid sequence?
        if not seqStartPos then
            return false, startPos
        end

        -- Increment current string pointer
        startPos = seqEndPos + 1

        -- Increment length
        len = len + 1
    until seqEndPos >= endPos

    return len
end
