
# NASA HORIZONS API

### Horizons Lookup
This lets you search for celestial objects within the Horizons database.
#### API Endpoint

```
GET http://127.0.0.1:3000/api/v1/nasa/search?sstr={:planet}
```

#### Query Parameters
| Parameters| Type| Required | Description |
| :-------- | :-- | :------- | :---------- |
| sstr      | string | yes   | The celestial object to search for |


#### Example Request
```
GET http://127.0.0.1:3000/api/v1/nasa/search?sstr=neptune
```

#### Example Response (JSON)
```
{
    "count": 2,
    "signature": {
        "source": "NASA/JPL Horizons Lookup API",
        "version": "1.1"
    },
    "result": [
        {
            "name": "Neptune",
            "alias": [],
            "type": "planet",
            "spkid": "899",
            "pdes": null
        },
        {
            "name": "Neptune Barycenter",
            "alias": [],
            "type": "barycenter",
            "spkid": "8",
            "pdes": null,
        }
    ]
}
```

### Horizons Lookup with Group Filter
This lets you search for celestial objects with a group filter
#### API Endpoint

```
GET http://127.0.0.1:3000/api/v1/nasa/search?sstr={:planet}&group={:group}
```

#### Query Parameters
| Parameters| Type| Required | Description |
| :-------- | :-- | :------- | :---------- |
| sstr      | string | yes   | Celestial object to search for |
| group     | string | no   | Group this celestial object falls under |


#### Example Request
```
GET http://127.0.0.1:3000/api/v1/nasa/search?sstr=neptune
```

#### Example Response (JSON)
```
{
    "count": 2,
    "signature": {
        "source": "NASA/JPL Horizons Lookup API",
        "version": "1.1"
    },
    "result": [
        {
            "name": "Neptune",
            "alias": [],
            "type": "planet",
            "spkid": "899",
            "pdes": null
        },
        {
            "name": "Neptune Barycenter",
            "alias": [],
            "type": "barycenter",
            "spkid": "8",
            "pdes": null,
        }
    ]
}
```

### Horizons Full Object Search
This lets you search for celestial objects with all of its details
#### API Endpoint

```
GET http://127.0.0.1:3000/api/v1/nasa/horizons?format=text&COMMAND='{:spkid}'&EPHEM_TYPE=VECTOR
```

#### Query Parameters
| Parameters| Type| Required | Description |
| :-------- | :-- | :------- | :---------- |
| spkid      | number | yes   | Celestial object to search for using spkid |
| group     | string | no   | Group this celestial object falls under |


#### Example Request
```
GET http://127.0.0.1:3000/api/v1/nasa/horizons?format=text&COMMAND='899'&EPHEM_TYPE=VECTOR
```

#### Example Response (Text)
```
API VERSION: 1.2
API SOURCE: NASA/JPL Horizons API

*******************************************************************************
 Revised: April 22,
2021              Neptune                               899
 
 PHYSICAL DATA (update 2021-May-03):
  Mass x10^24 (kg)      = 102.409         Density (g/cm^3)       =  1.638
  Equat. radius (1 bar) = 24766+-15 km    Volume,
10^10 km^3     = 6254     
  Vol. mean radius (km) = 24624+-21       Polar radius (km)      = 24342+-30
  Geometric Albedo      = 0.41            Flattening             =  0.0171
  Sid. rot. period (III)= 16.11+-0.01 hr  Sid. rot. rate (rad/s) =  0.000108338 
  Mean solar day, h     =~16.11 h         
  GM (km^3/s^2)         = 6835099.97      GM 1-sigma (km^3/s^2)  = +-10 
  Equ. grav, ge (m/s^2) = 11.15           Pol. grav, gp (m/s^2)  = 11.41+-0.03
  Visual magnitude V(1,
0)= -6.87
  Vis. mag. (opposition)=  +7.84          Obliquity to orbit     = 28.32 deg
  Sidereal orbit period = 164.788501027 y Sidereal orbit period  = 60189 d
  Mean daily motion     = 0.006020076dg/d Mean orbit velocity    =  5.43 km/s 
  Atmos. temp. (1 bar)  =  72+-2 K        Escape speed (1 bar)  =  23.5 km/s     
  Aroche(ice)/Rp        =  2.98           Hill's sphere rad., Rp = 4700
                                 Perihelion  Aphelion    Mean
  Solar Constant (W/m^2)         1.54        1.49        1.51
  Maximum Planetary IR (W/m^2)   0.52        0.52        0.52
  Minimum Planetary IR (W/m^2)   0.52        0.52        0.52
*******************************************************************************


*******************************************************************************
Ephemeris / API_USER Mon Oct  6 08: 55: 27 2025 Pasadena, USA      / Horizons
*******************************************************************************
Target body name: Neptune (899)                   {source: nep097_merged
}
Center body name: Earth (399)                     {source: nep097_merged
}
Center-site name: BODY CENTER
*******************************************************************************
Start time      : A.D. 2022-Jan-01 10: 00: 00.0000 TDB
Stop  time      : A.D. 2022-Jan-02 00: 00: 00.0000 TDB
Step-size       : 60 minutes
*******************************************************************************
Center geodetic : 0.0,
0.0,
0.0                   {E-lon(deg),Lat(deg),Alt(km)
}
Center cylindric: 0.0,
0.0,
0.0                   {E-lon(deg),Dxy(km),Dz(km)
}
Center radii    : 6378.137,
6378.137,
6356.752 km {Equator_a, b, pole_c
}
Output units    : KM-S
Calendar mode   : Mixed Julian/Gregorian
Output type     : GEOMETRIC cartesian states
Output format   : 3 (position, velocity, LT, range, range-rate)
EOP file        : eop.251003.p251230
EOP coverage    : DATA-BASED 1962-JAN-20 TO 2025-OCT-03. PREDICTS-> 2025-DEC-29
Reference frame : Ecliptic of J2000.0
*******************************************************************************
JDTDB
   X     Y     Z
   VX    VY    VZ
   LT    RG    RR
*******************************************************************************
$$SOE
2459580.916666667 = A.D. 2022-Jan-01 10: 00: 00.0000 TDB 
 X = 4.460299684017564E+09 Y =-7.563245272777841E+08 Z =-8.956720206953847E+07
 VX= 3.048500225616828E+01 VY= 1.105125611823535E+01 VZ=-1.290195183099310E-01
 LT= 1.509329516884092E+04 RG= 4.524856057986343E+09 RR= 2.820542005154423E+01
2459580.958333333 = A.D. 2022-Jan-01 11: 00: 00.0000 TDB 
 X = 4.460409422723300E+09 Y =-7.562847034346237E+08 Z =-8.956766656871486E+07
 VX= 3.048094239856010E+01 VY= 1.107310050895668E+01 VZ=-1.290357340911439E-01
 LT= 1.509363382348801E+04 RG= 4.524957584095409E+09 RR= 2.819797118797074E+01
*******************************************************************************
 
TIME

  Barycentric Dynamical Time ("TDB" or T_eph) output was requested. This
continuous coordinate time is equivalent to the relativistic proper time
of a clock at rest in a reference frame co-moving with the solar system
barycenter but outside the system's gravity well. It is the independent
variable in the solar system relativistic equations of motion.

  TDB runs at a uniform rate of one SI second per second and is independent
of irregularities in Earth's rotation.
 
CALENDAR SYSTEM

  Mixed calendar mode was active such that calendar dates after AD 1582-Oct-15
(if any) are in the modern Gregorian system. Dates prior to 1582-Oct-5 (if any)
are in the Julian calendar system, which is automatically extended for dates
prior to its adoption on 45-Jan-1 BC.  The Julian calendar is useful for
matching historical dates. The Gregorian calendar more accurately corresponds
to the Earth's orbital motion and seasons. A "Gregorian-only" calendar mode is
available if such physical events are the primary interest.

REFERENCE FRAME AND COORDINATES

  Ecliptic at the standard reference epoch

    Reference epoch: J2000.0
    X-Y plane: adopted Earth orbital plane at the reference epoch
               Note: IAU76 obliquity of 84381.448 arcseconds wrt ICRF X-Y plane
    X-axis   : ICRF
    Z-axis   : perpendicular to the X-Y plane in the directional (+ or -) sense
               of Earth's north pole at the reference epoch.

  Symbol meaning:

    JDTDB    Julian Day Number, Barycentric Dynamical Time
      X      X-component of position vector (km)
      Y      Y-component of position vector (km)
      Z      Z-component of position vector (km)
      VX     X-component of velocity vector (km/sec)                           
      VY     Y-component of velocity vector (km/sec)                           
      VZ     Z-component of velocity vector (km/sec)                           
      LT     One-way down-leg Newtonian light-time (sec)
      RG     Range; distance from coordinate center (km)
      RR     Range-rate; radial velocity wrt coord. center (km/sec)

ABERRATIONS AND CORRECTIONS

 Geometric state vectors have NO corrections or aberrations applied.

Computations by ...

    Solar System Dynamics Group, Horizons On-Line Ephemeris System
    4800 Oak Grove Drive, Jet Propulsion Laboratory
    Pasadena, CA  91109   USA

    General site: https: //ssd.jpl.nasa.gov/
    Mailing list: https: //ssd.jpl.nasa.gov/email_list.html
    System news : https: //ssd.jpl.nasa.gov/horizons/news.html
    User Guide  : https: //ssd.jpl.nasa.gov/horizons/manual.html
    Connect     : browser        https: //ssd.jpl.nasa.gov/horizons/app.html#/x
                  API            https: //ssd-api.jpl.nasa.gov/doc/horizons.html
                  command-line   telnet ssd.jpl.nasa.gov 6775
                  e-mail/batch   https: //ssd.jpl.nasa.gov/ftp/ssd/horizons_batch.txt
                  scripts        https: //ssd.jpl.nasa.gov/ftp/ssd/SCRIPTS
    Author      : Jon.D.Giorgini@jpl.nasa.gov
*******************************************************************************

```

# api-wrapper-test
#
# Error Handling
#
# The NASA API endpoints return structured error responses for various failure scenarios. Errors are returned as JSON with a consistent format. Error handling is centralized in the Errors class.
#
# Error Response Format
```
{
  "error": {
    "type": "<error_type>",
    "message": "<error_message>",
    "code": <http_status_code>
  }
}
```
#
# Error Types
| Type              | Description |
| :---------------- | :---------- |
| timeout           | The request to the NASA API timed out. |
| network           | A network error occurred (e.g., DNS failure, connection refused). |
| parse             | The response from the NASA API could not be parsed as JSON. |
| http              | The NASA API returned a non-success HTTP status code. |
| unknown           | An unexpected error occurred. |
#
# Example Error Responses
```
{
  "error": {
    "type": "timeout",
    "message": "The request to the NASA API timed out.",
    "code": 408
  }
}
```
```
{
  "error": {
    "type": "network",
    "message": "A network error occurred while connecting to the NASA API.",
    "code": 503
  }
}
```
```
{
  "error": {
    "type": "parse",
    "message": "The response from the NASA API could not be parsed as JSON.",
    "code": 500
  }
}
```
```
{
  "error": {
    "type": "http",
    "message": "NASA API returned status 404: Not Found.",
    "code": 404
  }
}
```
```
{
  "error": {
    "type": "unknown",
    "message": "An unexpected error occurred.",
    "code": 500
  }
}
```
