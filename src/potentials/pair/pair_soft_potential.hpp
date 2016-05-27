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
 * \file pair_soft_potential.hpp
 * \author Rastko Sknepnek, sknepnek@gmail.com
 * \date 31-Oct-2013
 * \brief Declaration of PairSoftPotential class
 */ 

#ifndef __PAIR_SOFT_POTENTIAL_HPP__
#define __PAIR_SOFT_POTENTIAL_HPP__

#include <cmath>

#include "pair_potential.hpp"

using std::make_pair;
using std::sqrt;

//! Structure that handles parameters for the soft pair potential
struct SoftParameters
{
  double k;
  double a;
};

/*! PairSoftPotential implements the soft repulsive force between particles.
 *  Potential is given as \f$ U_{soft}\left(r_{ij}\right) = \frac{k}{2} \left(a_i + a_j - r_{ij}\right)^2 \f$, if
 *  \f$ r_{ij} \le a_i + a_j \f$ or \f$ U_{soft} = 0 \f$ if \f$ r_{ij} > a_i + a_j \f$.
 *  \f$ k \f$ is the potential strength, \f$ a_i \f$ and \f$ a_j \f$ are radii of the two particles and \f$ r_{ij} \f$ is the 
 *  interparticle distance.
 */
class PairSoftPotential : public PairPotential
{
public:
  
  //! Constructor
  //! \param sys Pointer to the System object
  //! \param msg Pointer to the internal state messenger
  //! \param nlist Pointer to the global neighbour list
  //! \param val Value control object (for phasing in)
  //! \param param Contains information about all parameters (k)
  PairSoftPotential(SystemPtr sys, MessengerPtr msg, NeighbourListPtr nlist, ValuePtr val, pairs_type& param) : PairPotential(sys, msg, nlist, val, param)
  {
    if (param.find("k") == param.end())
    {
      m_msg->msg(Messenger::WARNING,"No potential strength (k) specified for soft pair potential. Setting it to 1.");
      m_k = 1.0;
    }
    else
    {
      m_msg->msg(Messenger::INFO,"Global potential strength (k) for soft pair potential is set to "+param["k"]+".");
      m_k = lexical_cast<double>(param["k"]);
    }
    m_msg->write_config("potential.pair.soft.k",lexical_cast<string>(m_k));
    if (param.find("a") == param.end())
    {
      m_msg->msg(Messenger::WARNING,"No potential range (a) specified for soft pair potential. Setting it to 2.");
      m_a = 2.0;
    }
    else
    {
      m_msg->msg(Messenger::INFO,"Global potential range (a) for soft pair potential is set to "+param["a"]+".");
      m_a = lexical_cast<double>(param["a"]);
    }
    m_msg->write_config("potential.pair.soft.a",lexical_cast<string>(m_a));
    if (param.find("use_particle_radii") != param.end())
    {
      m_msg->msg(Messenger::WARNING,"Soft pair potential is set to use particle radii to control its range. Parameter a will be ignored.");
      m_use_particle_radii = true;
      m_msg->write_config("potential.pair.soft.use_radii","true");
    }
    if (param.find("phase_in") != param.end())
    {
      m_msg->msg(Messenger::INFO,"Soft pair potential. Gradually phasing in the potential for new particles.");
      m_phase_in = true;
      m_msg->write_config("potential.pair.soft.phase_in","true");
    }    
    
    m_pair_params = new SoftParameters*[m_ntypes];
    for (int i = 0; i < m_ntypes; i++)
    {
      m_pair_params[i] = new SoftParameters[m_ntypes];
      for (int j = 0; j < m_ntypes; j++)
      {
        m_pair_params[i][j].k = m_k;
        m_pair_params[i][j].a = m_a;
      }
    }
    
  }
  
  virtual ~PairSoftPotential()
  {
    for (int i = 0; i < m_ntypes; i++)
      delete [] m_pair_params[i];
    delete [] m_pair_params;
  }
                                                                                                                
  //! Set pair parameters data for pairwise interactions    
  void set_pair_parameters(pairs_type& pair_param)
  {
    map<string,double> param;
    int type_1, type_2;
    
    if (pair_param.find("type_1") == pair_param.end())
    {
      m_msg->msg(Messenger::ERROR,"type_1 has not been defined for pair potential parameters in soft potential.");
      throw runtime_error("Missing key for pair potential parameters.");
    }
    if (pair_param.find("type_2") == pair_param.end())
    {
      m_msg->msg(Messenger::ERROR,"type_2 has not been defined for pair potential parameters in soft potential.");
      throw runtime_error("Missing key for pair potential parameters.");
    }
    type_1 = lexical_cast<int>(pair_param["type_1"]);
    type_2 = lexical_cast<int>(pair_param["type_2"]);
    
    if (pair_param.find("k") != pair_param.end())
    {
      m_msg->msg(Messenger::INFO,"Soft pair potential. Setting strength to "+pair_param["k"]+" for particle pair of types ("+lexical_cast<string>(type_1)+" and "+lexical_cast<string>(type_2)+").");
      param["k"] = lexical_cast<double>(pair_param["k"]);
    }
    else
    {
      m_msg->msg(Messenger::INFO,"Soft pair potential. Using default strength ("+lexical_cast<string>(m_k)+") for particle pair of types ("+lexical_cast<string>(type_1)+" and "+lexical_cast<string>(type_2)+").");
      param["k"] = m_k;
    }
    m_msg->write_config("potential.pair.soft.type_"+pair_param["type_1"]+"_and_type_"+pair_param["type_2"]+".push",lexical_cast<string>(param["k"]));
    if (pair_param.find("a") != pair_param.end())
    {
      m_msg->msg(Messenger::INFO,"Soft pair potential. Setting range to "+pair_param["a"]+" for particle pair of types ("+lexical_cast<string>(type_1)+" and "+lexical_cast<string>(type_2)+").");
      param["a"] = lexical_cast<double>(pair_param["a"]);
    }
    else
    {
      m_msg->msg(Messenger::INFO,"Soft pair potential. Using default range ("+lexical_cast<string>(m_a)+") for particle pair of types ("+lexical_cast<string>(type_1)+" and "+lexical_cast<string>(type_2)+").");
      param["a"] = m_a;
    }
    m_msg->write_config("potential.pair.soft.type_"+pair_param["type_1"]+"_and_type_"+pair_param["type_2"]+".a",lexical_cast<string>(param["a"]));
        
    m_pair_params[type_1-1][type_2-1].k = param["k"];
    if (type_1 != type_2)
      m_pair_params[type_2-1][type_1-1].k = param["k"];
    m_pair_params[type_1-1][type_2-1].a = param["a"];
    if (type_1 != type_2)
      m_pair_params[type_2-1][type_1-1].a = param["a"];
    
    m_has_pair_params = true;
  }
  
  //! Returns true since soft potential needs neighbour list
  bool need_nlist() { return true; }
  
  //! Computes potentials and forces for all particles
  void compute(double);
  
  
private:
       
  double m_k;                       //!< potential strength
  double m_a;                       //!< potential range
  SoftParameters** m_pair_params;   //!< type specific pair parameters 
     
};

typedef shared_ptr<PairSoftPotential> PairSoftPotentialPtr;

#endif
