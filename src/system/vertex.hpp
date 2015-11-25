/* *************************************************************
 *  
 *   Soft Active Mater on Surfaces (SAMoS)
 *   
 *   Author: Rastko Sknepnek
 *  
 *   Division of Physics
 *   School of Engineering, Physics and Mathematics
 *   University of Dundee
 *   
 *   (c) 2013, 2014
 * 
 *   School of Science and Engineering
 *   School of Life Sciences 
 *   University of Dundee
 * 
 *   (c) 2015
 * 
 *   Author: Silke Henkes
 * 
 *   Department of Physics 
 *   Institute for Complex Systems and Mathematical Biology
 *   University of Aberdeen  
 * 
 *   (c) 2014, 2015
 *  
 *   This program cannot be used, copied, or modified without
 *   explicit written permission of the authors.
 * 
 * ************************************************************* */

/*!
 * \file vertex.hpp
 * \author Rastko Sknepnek, sknepnek@gmail.com
 * \date 18-Nov-2015
 * \brief Declaration of Vertex class.
 */ 

#ifndef __VERTEX_HPP__
#define __VERTEX_HPP__

#include "particle.hpp"
#include "vector3d.hpp"

#include <vector>
#include <string>

#include <boost/format.hpp>

using boost::format;
using std::string;
using std::vector;
using std::endl;

/*! Vertex class is a light-weight class that handles vertices in a mesh.
 *  A vertex can simply be a particle position or the position of the dual lattice
 *  in tissue models. 
 * 
 *  This may apper as doubling of the data strucures, but gives us fexibilty to 
 *  work with meshes that do not coincide with the lattice positions.
 *
 */
struct Vertex
{
  //! Construct a Vertex object
  //! \param id vertex id
  //! \param x x coordinate
  //! \param y x coordinate
  //! \param z x coordinate
  Vertex(int id, double x, double y, double z) : id(id), 
                                                 type(1),
                                                 r(x,y,z),
                                                 z(0),
                                                 n_edges(0), n_faces(0), 
                                                 boundary(false),
                                                 ordered(false) 
                                                 {   }
  
  //! Constract from particle position 
  //! \param p particle
  Vertex(Particle& p) 
  {
   id = p.get_id();
   type = p.get_type();
   r = Vector3d(p.x,p.y,p.z);
   z = 0;
   n_edges = 0;
   n_faces = 0;
   boundary = false;
   ordered = false;
  }
  
  //! Add neighbour
  //! \param v neighbour index
  void add_neighbour(int v)
  {
    neigh.push_back(v);
    z++;
  }
  
  //! Add edge
  //! \param e edge index
  void add_edge(int e)
  {
    edges.push_back(e);
    n_edges++;
  }
   
  //! Add face
  //! \param f face index
  void add_face(int f)
  {
    faces.push_back(f);
    n_faces++;
  } 
   
  int id;                      //!< Vertex id
  int type;                    //!< Vertex type 
  Vector3d r;                  //!< Position in the embedding 3d flat space
  
  int z;                       //!< Coordination number (number of neighbours)
  int n_edges;                 //!< Number of neighours this vertex has
  int n_faces;                 //!< Number of faces this vertex belongs to
  
  double area;                 //!< Area of dual associated with the vertex
  double perim;                //!< Perimeter of dual associated with the vertex
  
  bool boundary;               //!< If true, vertex is a boundary vertex
  bool ordered;                //!< If true, vertex star is ordered
    
  vector<int> neigh;           //!< Contains indices of all neighbours
  vector<int> edges;           //!< Contains indices of all edges connected to the vertex
  vector<int> faces;           //!< Contains indices of faces this vertex belongs to
    
};

ostream& operator<<(ostream&, const Vertex&);

#endif