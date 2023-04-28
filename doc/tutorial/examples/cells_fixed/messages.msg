INFO: 2023-Apr-27 17:05:28: Messages will be sent to messages.msg.
INFO: 2023-Apr-27 17:05:28: Adding config file configuration of type json.
INFO: 2023-Apr-27 17:05:28: Simulation box is fixed with size (lx,ly,lz) = (100,100,10).
INFO: 2023-Apr-27 17:05:28: Generated group 'all' containing all particles.
INFO: 2023-Apr-27 17:05:28: Reading particle coordinates from file: fixed.input
INFO: 2023-Apr-27 17:05:28: Column 1 of input file is : id.
INFO: 2023-Apr-27 17:05:28: Column 2 of input file is : type.
INFO: 2023-Apr-27 17:05:28: Column 3 of input file is : x.
INFO: 2023-Apr-27 17:05:28: Column 4 of input file is : y.
INFO: 2023-Apr-27 17:05:28: Column 5 of input file is : z.
INFO: 2023-Apr-27 17:05:28: Column 6 of input file is : vx.
INFO: 2023-Apr-27 17:05:28: Column 7 of input file is : vy.
INFO: 2023-Apr-27 17:05:28: Column 8 of input file is : vz.
INFO: 2023-Apr-27 17:05:28: Column 9 of input file is : nx.
INFO: 2023-Apr-27 17:05:28: Column 10 of input file is : ny.
INFO: 2023-Apr-27 17:05:28: Column 11 of input file is : nz.
INFO: 2023-Apr-27 17:05:28: Column 12 of input file is : nvx.
INFO: 2023-Apr-27 17:05:28: Column 13 of input file is : nvy.
INFO: 2023-Apr-27 17:05:28: Column 14 of input file is : nvz.
INFO: 2023-Apr-27 17:05:28: Column 15 of input file is : area.
INFO: 2023-Apr-27 17:05:28: Column 16 of input file is : boundary.
INFO: 2023-Apr-27 17:05:28: Generated groups 'tissue', 'environment', 'boundary' and 'internal' to distinguish particles beloging to the tissue or not.
INFO: 2023-Apr-27 17:05:28: Generated groups 'boundary' and 'internal' to distinguish if tissue particles are inside or on the boundary.
INFO: 2023-Apr-27 17:05:28: Read data for 1496 particles.
INFO: 2023-Apr-27 17:05:28: There are 2 distinct particle types in the system.
INFO: 2023-Apr-27 17:05:28: Periodic flag for the system is set to false.
INFO: 2023-Apr-27 17:05:28: Finished reading system coordinates from fixed.input.
INFO: 2023-Apr-27 17:05:28: Reading boundary connectivity information from file: fixed.boundary
INFO: 2023-Apr-27 17:05:28: Finished reading boundary connectivity data from fixed.boundary.
INFO: 2023-Apr-27 17:05:28: Created cell list with 3468 cells.
INFO: 2023-Apr-27 17:05:28: Each cell has dimensions (2.9411764705882355,2.9411764705882355,3.3333333333333335).
INFO: 2023-Apr-27 17:05:28: Using cell lists for neighbour list builds.
INFO: 2023-Apr-27 17:05:28: Faces will be build using Delaunay triangulation.
INFO: 2023-Apr-27 17:05:28: Neighbour list.  Setting maximum face perimeter to 30.0.
INFO: 2023-Apr-27 17:05:28: Neighbour list. Using geometric centers for mesh dual.
INFO: 2023-Apr-27 17:05:28: Neighbour list. Using static boundaries in the tissue simulation.
INFO: 2023-Apr-27 17:05:28: Created neighbour list with cutoff 2.3999999999999999 and padding distance 0.5.
WARNING: 2023-Apr-27 17:05:28: Constraint. Maximum number of iterations has not been set. Assuming 100
WARNING: 2023-Apr-27 17:05:28: Constraint. Tolerance has not been set. Assuming 1e-6.
WARNING: 2023-Apr-27 17:05:28: Constraint. No particle groups set. Assuming "all".
INFO: 2023-Apr-27 17:05:28: Planar constraint. Setting plane dimensions to lx = 100 and ly = 100.
INFO: 2023-Apr-27 17:05:28: Plane constraint. Particle motion will not be affected by the box boundaries.
WARNING: 2023-Apr-27 17:05:28: Plane constraint. No zpos specified. Assuming that the constraint plane is at z = 0.
INFO: 2023-Apr-27 17:05:28: Added  : plane to the list of constraints.
INFO: 2023-Apr-27 17:05:28: Adding constraint of type plane.
WARNING: 2023-Apr-27 17:05:28: Value object. No minimum value set. Assuming 0.
WARNING: 2023-Apr-27 17:05:28: Value object. No maximum value set. Assuming 1.0.
WARNING: 2023-Apr-27 17:05:28: Value object. No number of steps set. Assuming 1000.
INFO: 2023-Apr-27 17:05:28: Using constant value object.
WARNING: 2023-Apr-27 17:05:28: Number of particle types will be read from the intitial configuration.
INFO: 2023-Apr-27 17:05:28: Global area stiffness (K) for vertex-particle pair potential is set to 1.0.
INFO: 2023-Apr-27 17:05:28: Global perimeter stiffness (gamma) for vertex-particle pair potential is set to 1.0.
INFO: 2023-Apr-27 17:05:28: Global contact stiffness (lambda) for vertex-particle pair potential is set to -5.7.
WARNING: 2023-Apr-27 17:05:28: Number of time steps between mesh updates in vertex-particle pair potential not set. Assuming default 0. No updates beyond those during the neighbour list and/or regular equiangulation steps for triangular lattices will be made.
INFO: 2023-Apr-27 17:05:28: Vertex-particle pair potential does not include additional terms arising at the boundary.
INFO: 2023-Apr-27 17:05:28: Added pair potential : vp to the list of pair interactions.
INFO: 2023-Apr-27 17:05:28: Pair potential vp has neighbour list. Neighbour list updates will be performed during the simulation.
INFO: 2023-Apr-27 17:05:28: Added vp to the list of pair potentials.
WARNING: 2023-Apr-27 17:05:28: Value object. No minimum value set. Assuming 0.
WARNING: 2023-Apr-27 17:05:28: Value object. No maximum value set. Assuming 1.0.
WARNING: 2023-Apr-27 17:05:28: Value object. No number of steps set. Assuming 1000.
INFO: 2023-Apr-27 17:05:28: Using constant value object.
WARNING: 2023-Apr-27 17:05:28: Number of particle types will be read from the intitial configuration.
INFO: 2023-Apr-27 17:05:28: Global potential strength (k) for soft pair potential is set to 10.0.
INFO: 2023-Apr-27 17:05:28: Global potential range (a) for soft pair potential is set to 1.0.
INFO: 2023-Apr-27 17:05:28: Added pair potential : soft to the list of pair interactions.
INFO: 2023-Apr-27 17:05:28: Pair potential soft has neighbour list. Neighbour list updates will be performed during the simulation.
INFO: 2023-Apr-27 17:05:28: Added soft to the list of pair potentials.
INFO: 2023-Apr-27 17:05:28: Added logger. Logged quantities will be sent to cell.log.
INFO: 2023-Apr-27 17:05:28: Logs will be produced every 100 time steps.
INFO: 2023-Apr-27 17:05:28: Adding log quantity : area.
INFO: 2023-Apr-27 17:05:28: Adding log quantity : avg_perim.
INFO: 2023-Apr-27 17:05:28: Adding log quantity : size.
INFO: 2023-Apr-27 17:05:28: Adding log quantity : vp_energy.
INFO: 2023-Apr-27 17:05:28: Adding logger to file cell.log.
INFO: 2023-Apr-27 17:05:28: Dump type set to vtp
WARNING: 2023-Apr-27 17:05:28: No dump directory specified. Using current directory.
INFO: 2023-Apr-27 17:05:28: Dump will be sent to the file with base name cell with extension vtp.
INFO: 2023-Apr-27 17:05:28: Dumping will start after 0 time steps.
INFO: 2023-Apr-27 17:05:28: Dump will be produced every 100 time steps.
INFO: 2023-Apr-27 17:05:28: Each dumped time step will be stored in a separate file labelled by the time step.
INFO: 2023-Apr-27 17:05:28: Mesh will be included in the dump file.
INFO: 2023-Apr-27 17:05:28: Adding dump to file cell.
INFO: 2023-Apr-27 17:05:28: Parameter freq for dump cell is set to 100.
INFO: 2023-Apr-27 17:05:28: Setting flag include_mesh for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag multi for dump cell.
INFO: 2023-Apr-27 17:05:28: Parameter start for dump cell is set to 0.
INFO: 2023-Apr-27 17:05:28: Parameter type for dump cell is set to vtp.
INFO: 2023-Apr-27 17:05:28: Dump type set to vtp
WARNING: 2023-Apr-27 17:05:28: No dump directory specified. Using current directory.
INFO: 2023-Apr-27 17:05:28: Dump will be sent to the file with base name cell_dual with extension vtp.
INFO: 2023-Apr-27 17:05:28: Dumping will start after 0 time steps.
INFO: 2023-Apr-27 17:05:28: Dump will be produced every 100 time steps.
INFO: 2023-Apr-27 17:05:28: Each dumped time step will be stored in a separate file labelled by the time step.
INFO: 2023-Apr-27 17:05:28: VTP file will contain dual mesh.
INFO: 2023-Apr-27 17:05:28: Adding dump to file cell_dual.
INFO: 2023-Apr-27 17:05:28: Setting flag dual for dump cell_dual.
INFO: 2023-Apr-27 17:05:28: Parameter freq for dump cell_dual is set to 100.
INFO: 2023-Apr-27 17:05:28: Setting flag multi for dump cell_dual.
INFO: 2023-Apr-27 17:05:28: Parameter start for dump cell_dual is set to 0.
INFO: 2023-Apr-27 17:05:28: Parameter type for dump cell_dual is set to vtp.
INFO: 2023-Apr-27 17:05:28: Dump type set to full
WARNING: 2023-Apr-27 17:05:28: No dump directory specified. Using current directory.
INFO: 2023-Apr-27 17:05:28: Dump will be sent to the file with base name cell with extension dat.
INFO: 2023-Apr-27 17:05:28: Dumping will start after 0 time steps.
INFO: 2023-Apr-27 17:05:28: Dump will be produced every 100 time steps.
INFO: 2023-Apr-27 17:05:28: Each dumped time step will be stored in a separate file labelled by the time step.
INFO: 2023-Apr-27 17:05:28: Include keys line into the dump file.
INFO: 2023-Apr-27 17:05:28: Adding dump to file cell.
INFO: 2023-Apr-27 17:05:28: Setting flag area for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag boundary for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag cell_area for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag cell_perim for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag coordinate for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag director for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag force for dump cell.
INFO: 2023-Apr-27 17:05:28: Parameter freq for dump cell is set to 100.
INFO: 2023-Apr-27 17:05:28: Setting flag id for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag keys for dump cell.
INFO: 2023-Apr-27 17:05:28: Setting flag multi for dump cell.
INFO: 2023-Apr-27 17:05:28: Parameter start for dump cell is set to 0.
INFO: 2023-Apr-27 17:05:28: Setting flag tp for dump cell.
INFO: 2023-Apr-27 17:05:28: Parameter type for dump cell is set to full.
INFO: 2023-Apr-27 17:05:28: Setting flag velocity for dump cell.
INFO: 2023-Apr-27 17:05:28: Dump type set to face
WARNING: 2023-Apr-27 17:05:28: No dump directory specified. Using current directory.
INFO: 2023-Apr-27 17:05:28: Dump will be sent to the file with base name faces with extension fc.
INFO: 2023-Apr-27 17:05:28: Dumping will start after 0 time steps.
INFO: 2023-Apr-27 17:05:28: Dump will be produced every 100 time steps.
INFO: 2023-Apr-27 17:05:28: Each dumped time step will be stored in a separate file labelled by the time step.
INFO: 2023-Apr-27 17:05:28: Adding dump to file faces.
INFO: 2023-Apr-27 17:05:28: Parameter freq for dump faces is set to 100.
INFO: 2023-Apr-27 17:05:28: Setting flag multi for dump faces.
INFO: 2023-Apr-27 17:05:28: Parameter start for dump faces is set to 0.
INFO: 2023-Apr-27 17:05:28: Parameter type for dump faces is set to face.
WARNING: 2023-Apr-27 17:05:28: External potential/force will not be applied onto boundary particles.
INFO: 2023-Apr-27 17:05:28: Activity in self propulsion set to 1.2.
INFO: 2023-Apr-27 17:05:28: Added external potential : self_propulsion to the list of external forces.
INFO: 2023-Apr-27 17:05:28: Added self_propulsion to the list of external potentials.
INFO: 2023-Apr-27 17:05:28: Setting global integrator timestep to 0.01.
WARNING: 2023-Apr-27 17:05:28: Value object. No minimum value set. Assuming 0.
WARNING: 2023-Apr-27 17:05:28: Value object. No maximum value set. Assuming 1.0.
WARNING: 2023-Apr-27 17:05:28: Value object. No number of steps set. Assuming 1000.
INFO: 2023-Apr-27 17:05:28: Using constant value object.
INFO: 2023-Apr-27 17:05:28: Using global (system-wide) integrator step size set to 0.01.
INFO: 2023-Apr-27 17:05:28: Applying integrator to group internal.
INFO: 2023-Apr-27 17:05:28: Brownian dynamics integrator for particle position. Setting mobility to 1.0.
INFO: 2023-Apr-27 17:05:28: Brownian dynamics integrator for particle position. Setting random number generator seed to 1.
INFO: 2023-Apr-27 17:05:28: Adding integrator of type brownian_pos (for group internal).
WARNING: 2023-Apr-27 17:05:28: Value object. No minimum value set. Assuming 0.
WARNING: 2023-Apr-27 17:05:28: Value object. No maximum value set. Assuming 1.0.
WARNING: 2023-Apr-27 17:05:28: Value object. No number of steps set. Assuming 1000.
INFO: 2023-Apr-27 17:05:28: Using constant value object.
INFO: 2023-Apr-27 17:05:28: Using global (system-wide) integrator step size set to 0.01.
WARNING: 2023-Apr-27 17:05:28: No group has been set. Assuming group 'all'.
INFO: 2023-Apr-27 17:05:28: Brownian dynamics integrator for alignment. Setting rotational diffusion rate to 0.1.
WARNING: 2023-Apr-27 17:05:28: Brownian dynamics integrator for alignment. Rotational mobility not set. Using default value 1.
INFO: 2023-Apr-27 17:05:28: Brownian dynamics integrator for alignment. Setting random number generator seed to 0.
WARNING: 2023-Apr-27 17:05:28: Brownian dynamics integrator for alignment. Assuming polar order parameter.
INFO: 2023-Apr-27 17:05:28: Adding integrator of type brownian_align (for group all).
INFO: 2023-Apr-27 17:05:28: Starting simulation run for 10000 steps.
INFO: 2023-Apr-27 17:06:05: Built neighbour list 534 time. Average number of steps between two builds : 18.726591760299627.
INFO: 2023-Apr-27 17:06:05: Simulation took 0 hours, 0 minutes and 37 seconds (37 seconds).
INFO: 2023-Apr-27 17:06:05: Average 270.29729729729729 time steps per second.
