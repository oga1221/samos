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
 *   (c) 2013, 2014
 *   
 *   This program cannot be used, copied, or modified without
 *   explicit permission of the author.
 * 
 * ************************************************************* */

/*!
 * \file group.hpp
 * \author Rastko Sknepnek, sknepnek@gmail.com
 * \date 25-Sept-2014
 * \brief Declaration of Group class.
 */ 

#ifndef __GROUP_HPP__
#define __GROUP_HPP__

#include <iostream>
#include <vector>
#include <string>

#include <boost/shared_ptr.hpp>


using std::ostream;
using std::vector;
using std::string;

using boost::shared_ptr;

/*! Group class
 *  This class defines groups of particles 
 *  that have same behaviour under integration. For example, 
 *  they can all be integrated with the NVE integrator
 */
class Group
{
public:
  
  Group() { }
  
  //! Construct a Particle object
  //! \param id group id
  //! \param name group name
  Group(int id, const string name) : m_id(id), m_name(name) 
  {
    m_size = 0;
  }
  
  //! Get group id
  int get_id() const { return m_id; } //!< \return group id (m_id)
  
  //! Get group name
  string get_name() const { return m_name; } //!< \return group name
  
  //! Get size of the group (number of particles)
  int get_size() const { return m_size; } //!< \return group size
  
  //! Add particle to a group
  //! \param id particle id to add
  void add_particle(int id) 
  { 
    m_particles.push_back(id);
    m_size++;
  }
  
  //! Get particles in the group
  vector<int>& get_particles() { return m_particles; } //!< \return reference to the vector containing indices of all particles in this group
  
private:  // Make these attributes immutable 
  
  int m_id;                        //!< Unique id
  string m_name;                   //!< Name of the group
  int m_size;                      //!< Number of particles in the group 
  vector<int> m_particles;         //!< Contains indices of all particles in the group
  
};

typedef shared_ptr<Group> GroupPtr;

#endif