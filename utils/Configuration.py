# * *************************************************************
# *  
# *   Soft Active Mater on Surfaces (SAMoS)
# *   
# *   Author: Rastko Sknepnek
# *  
# *   Division of Physics
# *   School of Engineering, Physics and Mathematics
# *   University of Dundee
# *   
# *   (c) 2013, 2014
# * 
# *   School of Science and Engineering
# *   School of Life Sciences 
# *   University of Dundee
# * 
# *   (c) 2015
# * 
# *   Author: Silke Henkes
# * 
# *   Department of Physics 
# *   Institute for Complex Systems and Mathematical Biology
# *   University of Aberdeen  
# * 
# *   (c) 2014, 2015
# *  
# *   This program cannot be used, copied, or modified without
# *   explicit written permission of the authors.
# * 
# * ***************************************************************

from Geometry import *
from read_param import *
from read_data import *
try:
	import matplotlib.pyplot as plt
	from mpl_toolkits.mplot3d import Axes3D
	HAS_MATPLOTLIB=True
except:
	HAS_MATPLOTLIB=False
	pass

class Configuration:
	def __init__(self,param,filename,debug=False):
		self.param=param
		# Read the local data
		geometries={'sphere':GeometrySphere,'plane':GeometryPeriodicPlane,'none':Geometry,'tube':GeometryTube,'peanut':GeometryPeanut,'hourglass':GeometryHourglass}
		print "Processing file : ", filename
		data = ReadData(filename)
		x, y, z = np.array(data.data[data.keys['x']]), np.array(data.data[data.keys['y']]), np.array(data.data[data.keys['z']])
		vx, vy, vz = np.array(data.data[data.keys['vx']]), np.array(data.data[data.keys['vy']]), np.array(data.data[data.keys['vz']])
		try:
			nx, ny, nz = np.array(data.data[data.keys['nx']]), np.array(data.data[data.keys['ny']]), np.array(data.data[data.keys['nz']])
		except KeyError:
			nx, ny, nz = np.zeros(np.shape(x)),np.zeros(np.shape(y)),np.zeros(np.shape(z))
		self.monodisperse=False
		self.N=len(x)
		if not data.keys.has_key('radius'): 
			# MISSING: read them in from the initial configuration
			self.radius = np.array([1.0 for i in range(self.N)])
			self.monodisperse=True
			self.sigma=1.0
		else: 
			self.radius = np.array(data.data[data.keys['radius']])	
			self.sigma = np.mean(self.radius)
		if data.keys.has_key('type'):
			self.ptype = data.data[data.keys['type']]
		else:
			self.ptype = np.ones((self.N,))
		if data.keys.has_key('flag'):
			self.flag = data.data[data.keys['flag']]
		self.rval = np.column_stack((x,y,z))
		self.vval = np.column_stack((vx,vy,vz))
		self.nval = np.column_stack((nx,ny,nz))
		# Create the right geometry environment (TBC):
		self.geom=geometries[param.constraint](param)
		print self.geom
		if self.geom.periodic:
			self.rval=self.geom.ApplyPeriodic12(np.array([0.0,0.0,0.0]),self.rval)
		# unit normal to the surface (only sphere so far)
		vel = np.sqrt(self.vval[:,0]**2 + self.vval[:,1]**2 + self.vval[:,2]**2)
		self.vhat=((self.vval).transpose()/(vel).transpose()).transpose()
		
		
		if debug:
			fig = plt.figure()
			ax = fig.add_subplot(111, projection='3d')
			ax.scatter(self.rval[:,0], self.rval[:,1], self.rval[:,2], zdir='z', c='b')
		
	# Tangent bundle: Coordinates in an appropriate coordinate system defined on the manifold
	# and the coordinate vectors themselves, for all the particles
	def getTangentBundle(self):
		self.x1,self.x2,self.e1,self.e2=self.geom.TangentBundle(self.rval)
		return self.x1,self.x2,self.e1,self.e2
	
	def rotateFrame(self,axis,rot_angle):
		self.rval = self.geom.RotateVectorial(self.rval,axis0,-rot_angle)
		self.vval = self.geom.RotateVectorial(self.vval,axis0,-rot_angle)
		self.nval = self.geom.RotateVectorial(self.nval,axis0,-rot_angle)
		self.nval=((self.nval).transpose()/(np.sqrt(np.sum(self.nval**2,axis=1))).transpose()).transpose()
		self.vel = np.sqrt(self.vval[:,0]**2 + self.vval[:,1]**2 + self.vval[:,2]**2)
        

	def compute_energy_and_pressure(self):
		eng = np.zeros(self.N)
		press = np.zeros(self.N)
		stress = np.zeros((self.N,3,3))
		# Establish how many types of particles we have
		# If it's only one, use the current setup
		if self.param.ntypes==1:
			if self.param.potential=='soft':
				k=self.param.pot_params['k']
				if self.monodisperse:
					dmax=4*self.sigma**2
				for i in range(self.N):
				#for i in range(10):
					#dist=np.sum((r-r[i,:])**2,axis=1)
					dist=self.geom.GeodesicDistance(self.rval,self.rval[i,:])
					if self.monodisperse: 
						neighbours=[index for index,value in enumerate(dist) if value <dmax]
					else:
						neighbours=[index for index,value in enumerate(dist) if value < (self.radius[i]+self.radius[index])**2]
					neighbours.remove(i)
					dr=np.sqrt(dist[neighbours])
					diff=self.radius[i]+self.radius[neighbours]-dr
					fact = 0.5*k*diff
					eng_val = fact*diff
					press_val = fact*dr
					# Stress (force moment) has to be element by element) r_a F_b = -k r_a dist_b 
					drvec=self.rval[neighbours,:]-self.rval[i,:]
					Fvec=k*((diff/dr).transpose()*(drvec).transpose()).transpose()
					for u in range(3):
						for v in range(3):
							stress[neighbours,u,v]+=0.5*drvec[:,u]*Fvec[:,v]
					eng[neighbours]+=eng_val
					press[neighbours]+=press_val
			elif self.param.potential=='soft_attractive':
				k=self.param.pot_params['k']
				fact=self.param.pot_params['re_fact']-1.0
				rmax=1+2.0*fact
				if self.monodisperse:
					dmax=4*self.sigma**2
				for i in range(self.N):
					print i
					#dist=np.sum((r-r[i,:])**2,axis=1)
					dist=self.geom.GeodesicDistance(self.rval,self.rval[i,:])
					if self.monodisperse: 
						neighbours=[index for index,value in enumerate(dist) if value <rmax*dmax]
					else:
						neighbours=[index for index,value in enumerate(dist) if value < rmax*(self.radius[i]+self.radius[index])**2]
					neighbours.remove(i)
					dr=np.sqrt(dist[neighbours])
					scale=self.radius[i]+self.radius[neighbours]
					diff=scale-dr
					for u in range(len(neighbours)):
						drvec=self.rval[neighbours[u],:]-self.rval[i,:]
						if diff[u]/scale[u]>-fact:
							factor = 0.5*k*diff[u]
							eng_val = factor*diff[u]
							press_val = factor*dr[u]
							# Stress (force moment) has to be element by element) r_a F_b = -k r_a dist_b 
							Fvec=k*((diff[u]/dr[u]).transpose()*(drvec).transpose()).transpose()
							
						else:
							factor=-0.5*k*(rmax-dr[u])
							eng0=0.5*k*(fact*scale)**2
							eng_val = eng0+(eng0+factor*(rmax-dr[u]))
							Fvec=-k*(rmax-dr[u])/dr[u]*drvec
						press_val=factor*dr[u]	
						for v in range(3):
							for w in range(3):
								stress[u,v,w]+=0.5*drvec[v]*Fvec[w]	
						eng[neighbours[u]]+=eng_val
						press[neighbours[u]]+=press_val
			elif self.param.potential=='morse':
				# We are morse by hand right now ...
				D=self.param.pot_params['D']
				re=self.param.pot_params['re']
				a=self.param.pot.params['a']
				if self.monodisperse:
					dmax=16*self.sigma**2
				for i in range(self.N):
				#for i in range(10):
					#dist=np.sum((r-r[i,:])**2,axis=1)
					dist=self.geom.GeodesicDistance(self.rval,self.rval[i,:])
					if self.monodisperse: 
						neighbours=[index for index,value in enumerate(dist) if value <dmax]
					else:
						neighbours=[index for index,value in enumerate(dist) if value < (re*self.radius[i]+re*self.radius[j])**2]
					neighbours.remove(i)
					dr=np.sqrt(dist[neighbours])
					eng_val=D*(1-np.exp(-a*(dr-re)))**2
					fnorm=-2*a*D*np.exp(-a*(dr-re))*(1-np.exp(-a*(dr-re)))
					drvec=self.rval[neighbours,:]-self.rval[i,:]
					Fvec=((fnorm/dr).transpose()*(drvec).transpose()).transpose()
					press_val=fnorm*dr
					for u in range(3):
						for v in range(3):
							stress[neighbours,u,v]+=0.5*drvec[:,u]*Fvec[:,v]
					eng[neighbours]+=eng_val
					press[neighbours]+=press_val
			elif self.param.potential=='gaussian':
				print "Warning! Gaussian interaction has not yet been implemented! Returning zero energy and stresses"
			elif self.param.potential=='rod':
				print "Warning! Rod interaction has not yet been implemented! Returning zero energy and stresses"
			else:
				print "Warning! Unknown interaction type! Returning zero energy and stresses"
		else:
			# Do the Morse right now only ... will serve as a template
			print "Warning! Multiple types of particles interacting have not yet been implemented! Returning zero energy and stresses"
		return [eng, press, stress]
	
	# Flat case statistics (or other geometry statistics, if desired)
	def getStatsBasic(self,debug=False):
		vel2 = self.vval[:,0]**2 + self.vval[:,1]**2 + self.vval[:,2]**2
		vel2av=np.mean(vel2)
		phival=np.pi*np.sum(self.radius**2)/self.geom.area
		eng, press,stress = self.compute_energy_and_pressure()
		pressav=np.mean(press)
		energy=np.mean(eng)
		return vel2av, phival,pressav,energy
	  
	def getStatsBand(self,debug=False):
		ez = np.array([0,0,1])  # lab frame z-axis
		# The order parameter with v_0 still in it. Normalize in final polish
		orderparV=np.sum(vval,axis=0)/len(vval)
		orderpar=np.sum(nval,axis=0)/len(nval)
		print orderpar
		print orderparV
		direction = orderpar/np.linalg.norm(orderpar)
		directionV = orderparV/np.linalg.norm(orderparV)
		axisorth= np.cross(direction,directionV)
		axisval=np.linalg.norm(axisorth)
		alpha=np.arcsin(axisval)
		axisorth=axisorth/axisval
		axisnorm=np.cross(ez,directionV)
		axisnorm/=np.linalg.norm(axisnorm)
		
		print directionV
		print axisorth
		
		vel = np.sqrt(self.vval[:,0]**2 + self.vval[:,1]**2 + self.vval[:,2]**2)
		velnorm=((self.vval).transpose()/(vel).transpose()).transpose()
		
		eng, press,stress = self.compute_energy_and_pressure()
		print np.shape(stress)
		# Project the stresses into the e,theta,phi components. The rr component hast to be 0, and the r cross components
		# belong to the projection. So they are not all that interesting. 
		# We want the theta theta, theta phi, phi theta ant phi phi components (implicitly testing symmetries ...)
		# I give up on the notation. Stress is (N,3,3), the axes are (N,3). We want e_i sigma_ij e_j
		s_tt=np.sum(axisnorm*np.einsum('kij,j->ki',stress,axisnorm),axis=1)
		s_tp=np.sum(axisnorm*np.einsum('kij,j->ki',stress,directionV),axis=1)
		s_pt=np.sum(directionV*np.einsum('kij,j->ki',stress,axisnorm),axis=1)
		s_pp=np.sum(directionV*np.einsum('kij,j->ki',stress,directionV),axis=1)
		print np.shape(s_tt)
		# Mean density really makes no sense? Determined by the initial conditions in periodic boundary conditions.
		# I do not wish to set up artificial bins in a translationally invariant system
		vel_av=np.mean(vel)
		eng_av=np.mean(eng)
		press_av=np.mean(press)
		s_tt_av=np.mean(s_tt)
		s_tp_av=np.mean(s_tp)
		s_pt_av=np.mean(s_pt)
		s_pp_av=np.mean(s_pp)
		
		# Debugging output
		if debug==True:
			if HAS_MATPLOTLIB:
				fig = plt.figure()
				ax = fig.add_subplot(111, projection='3d')
				ax.scatter(rval[:,0], rval[:,1], rval[:,2], zdir='z', c='b')
			else:
				print 'Error: Matplotlib does not exist on this machine, cannot plot system'
			
		return [vel_av,eng_av,press_av,s_tt_av,s_tp_av,s_pt_av,s_pp_av,alpha,direction,directionV,orderpar,orderparV]
	