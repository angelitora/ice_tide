import uptide
import uptide.tidal_netcdf
import os.path
import datetime
import numpy
import utm
import sys
import pyfes as fes

tide = uptide.Tides(uptide.ALL_FES2014_TIDAL_CONSTITUENTS)
tide.set_initial_time(datetime.datetime(2005,3,1,0,0))
tnci = uptide.FES2014TidalInterpolator(tide,'/home/angel/tools/fes-2.9.1-Source/data/fes2014/ocean_tide.ini')

