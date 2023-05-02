INFO: 2023-May-01 11:53:58: Messages will be sent to messages.msg.
INFO: 2023-May-01 11:53:58: Adding config file configuration of type json.
INFO: 2023-May-01 11:53:58: Simulation box is fixed with size (lx,ly,lz) = (100,100,10).
INFO: 2023-May-01 11:53:58: Generated group 'all' containing all particles.
INFO: 2023-May-01 11:53:58: Reading particle coordinates from file: epi.input
WARNING: 2023-May-01 11:53:58: Input format style '# id type radius' is deprecated and will be removed in a future version.
INFO: 2023-May-01 11:53:58: Column 1 of input file is : id.
INFO: 2023-May-01 11:53:58: Column 2 of input file is : type.
INFO: 2023-May-01 11:53:58: Column 3 of input file is : radius.
INFO: 2023-May-01 11:53:58: Column 4 of input file is : x.
INFO: 2023-May-01 11:53:58: Column 5 of input file is : y.
INFO: 2023-May-01 11:53:58: Column 6 of input file is : z.
INFO: 2023-May-01 11:53:58: Column 7 of input file is : vx.
INFO: 2023-May-01 11:53:58: Column 8 of input file is : vy.
INFO: 2023-May-01 11:53:58: Column 9 of input file is : vz.
INFO: 2023-May-01 11:53:58: Column 10 of input file is : nx.
INFO: 2023-May-01 11:53:58: Column 11 of input file is : ny.
INFO: 2023-May-01 11:53:58: Column 12 of input file is : nz.
INFO: 2023-May-01 11:53:58: Column 13 of input file is : nvx.
INFO: 2023-May-01 11:53:58: Column 14 of input file is : nvy.
INFO: 2023-May-01 11:53:58: Column 15 of input file is : nvz.
INFO: 2023-May-01 11:53:58: Column 16 of input file is : boundary.
INFO: 2023-May-01 11:53:58: Generated groups 'tissue', 'environment', 'boundary' and 'internal' to distinguish particles beloging to the tissue or not.
INFO: 2023-May-01 11:53:58: Generated groups 'boundary' and 'internal' to distinguish if tissue particles are inside or on the boundary.
INFO: 2023-May-01 11:53:58: Read data for 1041 particles.
INFO: 2023-May-01 11:53:58: There are 2 distinct particle types in the system.
INFO: 2023-May-01 11:53:58: Periodic flag for the system is set to false.
INFO: 2023-May-01 11:53:58: Finished reading system coordinates from epi.input.
INFO: 2023-May-01 11:53:58: Reading boundary connectivity information from file: epi.boundary
INFO: 2023-May-01 11:53:58: Finished reading boundary connectivity data from epi.boundary.
INFO: 2023-May-01 11:53:58: Created cell list with 3468 cells.
INFO: 2023-May-01 11:53:58: Each cell has dimensions (2.9411764705882355,2.9411764705882355,3.3333333333333335).
INFO: 2023-May-01 11:53:58: Using cell lists for neighbour list builds.
INFO: 2023-May-01 11:53:58: Faces will be build using Delaunay triangulation.
INFO: 2023-May-01 11:53:58: Neighbour list.  Setting maximum face perimeter to 30.0.
INFO: 2023-May-01 11:53:58: Neighbour list. Using geometric centers for mesh dual.
INFO: 2023-May-01 11:53:58: Created neighbour list with cutoff 2.3999999999999999 and padding distance 0.5.
WARNING: 2023-May-01 11:53:58: Constraint. Maximum number of iterations has not been set. Assuming 100
WARNING: 2023-May-01 11:53:58: Constraint. Tolerance has not been set. Assuming 1e-6.
WARNING: 2023-May-01 11:53:58: Constraint. No particle groups set. Assuming "all".
INFO: 2023-May-01 11:53:58: Planar constraint. Setting plane dimensions to lx = 100 and ly = 100.
INFO: 2023-May-01 11:53:58: Plane constraint. Particle motion will not be affected by the box boundaries.
WARNING: 2023-May-01 11:53:58: Plane constraint. No zpos specified. Assuming that the constraint plane is at z = 0.
INFO: 2023-May-01 11:53:58: Added  : plane to the list of constraints.
INFO: 2023-May-01 11:53:58: Adding constraint of type plane.
WARNING: 2023-May-01 11:53:58: Value object. No minimum value set. Assuming 0.
WARNING: 2023-May-01 11:53:58: Value object. No maximum value set. Assuming 1.0.
WARNING: 2023-May-01 11:53:58: Value object. No number of steps set. Assuming 1000.
INFO: 2023-May-01 11:53:58: Using constant value object.
WARNING: 2023-May-01 11:53:58: Number of particle types will be read from the intitial configuration.
INFO: 2023-May-01 11:53:58: Global area stiffness (K) for vertex-particle pair potential is set to 1.0.
INFO: 2023-May-01 11:53:58: Global perimeter stiffness (gamma) for vertex-particle pair potential is set to 1.0.
INFO: 2023-May-01 11:53:58: Global contact stiffness (lambda) for vertex-particle pair potential is set to -6.3.
WARNING: 2023-May-01 11:53:58: Number of time steps between mesh updates in vertex-particle pair potential not set. Assuming default 0. No updates beyond those during the neighbour list and/or regular equiangulation steps for triangular lattices will be made.
INFO: 2023-May-01 11:53:58: Vertex-particle pair potential does not include additional terms arising at the boundary.
INFO: 2023-May-01 11:53:58: Added pair potential : vp to the list of pair interactions.
INFO: 2023-May-01 11:53:58: Pair potential vp has neighbour list. Neighbour list updates will be performed during the simulation.
INFO: 2023-May-01 11:53:58: Added vp to the list of pair potentials.
INFO: 2023-May-01 11:53:58: VertexParticle pair potential. Setting contact stiffness to -5.8 for particle pair of types (2 and 3).
