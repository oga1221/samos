/* *************************************************************
 *  
 *   Active Particles on Curved Spaces (APCS)
 *   
 *   Author: Rastko Sknepnek
 *  
 *   Division of Physics
 *   School of Engineering, Physics and Mathematics
 *   University of Dundee
 *   
 *   (c) 2013, 2014, 2015
 *   
 *   This program cannot be used, copied, or modified without
 *   explicit permission of the author.
 * 
 * ************************************************************* */

/*!
 * \file constraint_none.hpp
 * \author Rastko Sknepnek, sknepnek@gmail.com
 * \date 02-Mar-2015
 * \brief Declaration of ConstraintNone class.
 */ 

#ifndef __CONSTRAINT_NONE_HPP__
#define __CONSTRAINT_NONE_HPP__

#include <cmath>

#include "system.hpp"
#include "parse_parameters.hpp"
#include "constraint.hpp"


/*! A dummy constraint that does nothing, but has to be there for
 *  technical reasons
*/
class ConstraintNone : public Constraint
{
public:
  
  //! Constructor
  //! \param id unique constraint id
  //! \param sys pointer to the system object
  //! \param msg Pointer to the internal state messenger
  //! \param param parameters that define the manifolds (e.g., sphere radius)
  ConstraintNone(SystemPtr sys, MessengerPtr msg, pairs_type& param) : Constraint(sys,msg,param)
  { 
    m_msg->msg(Messenger::INFO,"Constraint none.");
  }
  
  //! Computes normal to the surface
  void compute_normal(Particle& p, double& Nx, double& Ny, double& Nz) 
  {
    
  }
  
  //! Enforce constraint
  void enforce(Particle& p) { }
  
  //! Rotate director around normal vector to the plane (z axis)
  void rotate_director(Particle& p, double phi) { }
  
  //! Rotate velocity around normal vector to the plane (z axis)
  void rotate_velocity(Particle& p, double phi) { }
  
  //! Project torque onto normal vector to the plane (z axis) and return rotation angle change
  double project_torque(Particle& p) { return 0.0; }
    
  
};

typedef shared_ptr<ConstraintNone> ConstraintNonePtr;  //!< Shared pointer to the Constraint object

#endif