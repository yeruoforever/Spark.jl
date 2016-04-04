
# Julia-only serialization. Use it for technical data (e.g. functions, codes, etc.)

"Return serialized object as an array of bytes"
function serialized(x)
    buf = IOBuffer()
    serialize(buf, x)
    return buf.data
end

"Return object deserialized from array of bytes"
function deserialized(x::Vector{UInt8})
    return deserialize(IOBuffer(x))
end


# Java-compatible serialization. Use it for data

from_bytes(::Type{Vector{UInt8}}, arr::Vector{UInt8}) = arr
from_bytes(::Type{UTF8String}, arr::Vector{UInt8}) = utf8(arr)

to_bytes(x::Vector{UInt8}) = x
to_bytes(x::UTF8String) = convert(Vector{UInt8}, x)
