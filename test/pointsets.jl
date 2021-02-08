@testset "PointSets" begin
  pset = PointSet(rand(P2, 100))
  @test embeddim(pset) == 2
  @test coordtype(pset) == T

  pset = PointSet(rand(P3, 100))
  @test embeddim(pset) == 3
  @test coordtype(pset) == T

  pset1 = PointSet(P3(1,2,3), P3(4,5,6))
  pset2 = PointSet([T.((1,2,3)), T.((4,5,6))])
  pset3 = PointSet(T.((1,2,3)), T.((4,5,6)))
  @test pset1 == pset2 == pset3

  pset = PointSet(P2[(1,0), (0,1)])
  @test coordinates(pset, 1) == T[1, 0]
  @test coordinates(pset, 2) == T[0, 1]
  @test coordinates(pset, 1:2) == T[1 0; 0 1]

  pset = PointSet(P2[(1,0), (0,1)])
  @test sprint(show, pset) == "2 PointSet{2,$T}"
  if T == Float32
    @test sprint(show, MIME"text/plain"(), pset) == "2 PointSet{2,Float32}\n  └─Point(1.0f0, 0.0f0)\n  └─Point(0.0f0, 1.0f0)"
  elseif T == Float64
    @test sprint(show, MIME"text/plain"(), pset) == "2 PointSet{2,Float64}\n  └─Point(1.0, 0.0)\n  └─Point(0.0, 1.0)"
  end
end
