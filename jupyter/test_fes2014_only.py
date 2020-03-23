import pytest
import os
pytestmark = pytest.mark.skipif(
    not any(x in os.environ for x in ('AMCG_TIDAL_FILE', 'OTPS_GRID_FILE', 'OTPS_DATA_FILE',
                                      'FES2004_FILE', 'FES2014_INI_FILE', 'FES2014_DATA_PATH')),
    reason="Only run when tidal data file are given with environment variables"
)

import uptide.tidal_netcdf
import uptide
import datetime
import numpy
from numpy.testing import assert_equal

try:
        import pylab
except ImportError:
        # will fail but at least pytest is happy
        pass


def extract_series(tnci, ll, trange):
    etas = []
    for t in trange:
        tnci.set_time(t)
        eta = tnci.get_val(ll)
        etas.append(eta)
    return etas


def test():
        constituents = ('M2', 'S2', 'N2', 'K2', 'K1', 'O1', 'P1', 'Q1')
        lat = 58.708
        lon = -3.287
        dt0 = datetime.datetime(2003, 3, 28, 0, 0, 0)
        trange = numpy.arange(0., 24.*32., 0.25)*3600.

        tide = uptide.Tides(constituents)
        tide.set_initial_time(dt0)

        series = {}

        tnci = uptide.FES2014TidalInterpolator('/home/angel/tools/fes-2.9.1-Source/data/fes2014/ocean_tide.ini')
        tnci.set_initial_time(dt0)
        series['FES2014'] = extract_series(tnci, (lat, 360. + lon), trange)


test()

#numpy.savetxt('tt.txt', series)



 #       if 'FES2014_INI_FILE' in os.environ:
 #           tnci = uptide.FES2014TidalInterpolator(os.environ['FES2014_INI_FILE'], include_long_period=False)
 #           tnci.set_initial_time(dt0)
 #           series['FES2014 short'] = extract_series(tnci, (lat, 360. + lon), trange)

 #       if 'FES2014_DATA_PATH' in os.environ:
            # check that the FES2014 tide is the same using a Tides object with all the
            # constituents that are in the standard ocean_tide.ini file
#            tide2 = uptide.Tides(uptide.ALL_FES2014_TIDAL_CONSTITUENTS)
#            tide2.set_initial_time(dt0)
#            tnci = uptide.FES2014TidalInterpolator(tide2, os.environ['FES2014_DATA_PATH'])
#            series['FES2014 all specified'] = extract_series(tnci, (lat, 360. + lon), trange)
#            if 'FES2014' in series:
#                assert_equal(series['FES2014'], series['FES2014 all specified'])


