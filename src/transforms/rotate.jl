# ------------------------------------------------------------------
# Licensed under the MIT License. See LICENSE in the project root.
# ------------------------------------------------------------------

"""
    Rotate(rot)

Rotate geometry or mesh with rotation `rot`
from Rotations.jl.

## Examples

```julia
Rotate(one(RotXYZ{Float64}))  # Generate identity rotation
Rotate(AngleAxis(0.2, 1.0, 0.0, 0.0))  # Rotate 0.2 radians around X-axis
Rotate(rand(QuatRotation{Float64}))  # Generate random rotation
```
"""
struct Rotate{R<:Rotation} <: PointwiseGeometricTransform
  rot::R
end

"""
    Rotate(u, v)

Rotation mapping the axis directed by `u` to the axis directed by `v`. 
More precisely, it maps the plane passing through the origin with normal 
vector `u` to the plane passing through the origin with normal vector `v`.

## Examples

```julia
Rotate(Vec(1, 0, 0), Vec(1, 1, 1))
```
"""
Rotate(u::Vec, v::Vec) = Rotate(rotation_between(u, v))

Base.inv(t::Rotate) = Rotate(inv(t.rot))

isrevertible(::Type{<:Rotate}) = true

_apply(t::Rotate, v::Vec) = t.rot * v
