# $MidnightBSD$
#
# efl.mk - Support for Enlightenment Foundation Libraries (EFL)
#
# Author: Stanislav Sedov <stas@FreeBSD.org>
# Inspired by bsd.sdl.mk by Edwin Groothuis <edwin@freebsd.org>
# Ported to MidnightBSD by Lucas Holt <luke@midnightbsd.org>
#
# You can specify EFL-related library dependency using "USE_EFL=" statement,
# e.g. "USE_EFL= ecore evas" will add x11/ecore and graphics/evas as dependency
# for your port.
# You can check existency of certain library throught "WANT_EFL/HAVE_EFL" pair.
# Note: WANT_EFL should be defined before including <bsd.port.pre.mk>, and
# HAVE_EFL variable could be tested after it. For example:
#
#	WANT_EFL=	yes
#	.include <bsd.port.pre.mk>
#	.if ${HAVE_EFL:Mevas}
#	USE_EFL+=	evas
#	.endif
#
# Currently recognized variables are:
# USE_EFL	- lists all EFL libraries which port depends on
# WANT_EFL	- the port wants to test which of EFL libraries are installed
#		  on the target system
# USE_EFL_ESMART- the ports depends on specified esmart objects (or on all
#		  esmart objects if "yes")
#
# The following variables could be tested after inclusion of bsd.port.pre.mk:
# HAVE_EFL	- lists all EFL libraries which are available on target system
# HAVE_EFL_ESMART - esmart objects available
#

EFL_Include_MAINTAINER=	ports@MidnightBSD.org

#
# Define all supported libraries
#
_USE_EFL_ALL=	ecore edb edbus edje eet efreet eina elementary embryo emotion \
		engrave enhance epeg epsilon etk etox evas evfs ewl exml \
		imlib2

# For each library supported we define the following variables:
#	_%%LIB%%_CATEGORY	- category the port belongs to
#	_%%LIB%%_DEPENDS	- other EFL libraries the library
#		itself depends on. We'll define them explicitly
#		to handle unwanted deinstalls.
#	_%%LIB%%_PREFIX		- where the library is installed
#	_%%LIB%%_VERSION	- version of the shared library
#	_%%LIB%%_SLIB		- name of the shared library
#

_ecore_CATEGORY=	devel
_ecore_DEPENDS=		eina
_ecore_PORTNAME=	ecore-main
_ecore_VERSION=		1

_edb_CATEGORY=		databases
_edb_VERSION=		1

_edbus_CATEGORY=	devel
_edbus_PORTNAME=	e_dbus
_edbus_VERSION=		1

_eet_CATEGORY=		devel
_eet_DEPENDS=		eina
_eet_VERSION=		5

_efreet_CATEGORY=	x11
_efreet_DEPENDS=	ecore eina
_efreet_VERSION=	1

_edje_CATEGORY=		graphics
_edje_DEPENDS=		ecore eet embryo evas
_edje_VERSION=		1

_eina_CATEGORY=		devel
_eina_VERSION=		1

_elementary_CATEGORY=	x11-toolkits
_elementary_DEPENDS=	ecore embryo edje
_elementary_VERSION=	7

_embryo_CATEGORY=	lang
_embryo_VERSION=	1

_emotion_CATEGORY=	multimedia
_emotion_DEPENDS=	ecore edje eet embryo evas
_emotion_VERSION=	2

_engrave_CATEGORY=	devel
_engrave_DEPENDS=	ecore evas
_engrave_VERSION=	1

_enhance_CATEGORY=	x11-toolkits
_enhance_DEPENDS=	ecore etk exml
_enhance_VERSION=	0

_epeg_CATEGORY=		graphics
_epeg_VERSION=		9

_epsilon_CATEGORY=	graphics
_epsilon_DEPENDS=	epeg edje imlib2 ecore
_epsilon_VERSION=	3

_etk_CATEGORY=		x11-toolkits
_etk_DEPENDS=		evas ecore edje
_etk_VERSION=		1

_etox_CATEGORY=		x11-toolkits
_etox_DEPENDS=		edb evas ecore
_etox_VERSION=		0

_evas_CATEGORY=		graphics
_evas_DEPENDS=		eina eet
_evas_PORTNAME=		evas-core
_evas_VERSION=		1

_evfs_CATEGORY=		devel
_evfs_DEPENDS=		eet ecore
_evfs_VERSION=		0

_ewl_CATEGORY=		x11-toolkits
_ewl_DEPENDS=		evas ecore edje epsilon
_ewl_VERSION=		1

_exml_CATEGORY=		textproc
_exml_DEPENDS=		ecore
_exml_VERSION=		1

_imlib2_CATEGORY=	graphics
_imlib2_VERSION=	5
_imlib2_SLIB=		Imlib2

#
# Assign values for variables which were not defined explicitly
#
.for LIB in ${_USE_EFL_ALL}
. if !defined(_${LIB}_DEPENDS)
_${LIB}_DEPENDS=	#empty
. endif
. if !defined(_${LIB}_SLIB)
_${LIB}_SLIB=${LIB}
. endif
. if !defined(_${LIB}_PORTNAME)
_${LIB}_PORTNAME=${LIB}
. endif
. if !defined(_${LIB}_PREFIX)
_${LIB}_PREFIX=${LOCALBASE}
. endif
.endfor

#
# Esmart support. We'll define esmart components in the way they are
# defined for EFL.
# Values processed:
# _esmart_COMP_CATEGORY	- Where the port for this esmart object is located
# _esmart_COMP_PORTNAME	- Object's port subdirectory
# _esmart_COMP_DEPENDS	- Other components which this object depends on
# _esmart_COMP_PREFIX	- Where the shared library for this object is located
# _esmart_COMP_VERSION	- Version of the shared library
#

# All components that are currently supported
_EFL_ESMART_ALL=	container draggies text_entry \
			thumb trans_x11

#
# Generic stock esmart definitions
#
_EFL_ESMART_CATEGORY=	graphics
_EFL_ESMART_PORTNAME=	esmart
_EFL_ESMART_DEPENDS=	epsilon evas ecore imlib2 edje
_EFL_ESMART_PREFIX=	${LOCALBASE}
_EFL_ESMART_VERSION=	9

#
# Assign values for variables which were not defined explicitly
#
.for COMP in ${_EFL_ESMART_ALL}
. if !defined(_esmart_${COMP}_CATEGORY)
_esmart_${COMP}_CATEGORY=	${_EFL_ESMART_CATEGORY}
. endif
. if !defined(_esmart_${COMP}_PORTNAME)
_esmart_${COMP}_PORTNAME=	${_EFL_ESMART_PORTNAME}
. endif
. if !defined(_esmart_${COMP}_PREFIX)
_esmart_${COMP}_PREFIX=	${_EFL_ESMART_PREFIX}
. endif
. if !defined(_esmart_${COMP}_DEPENDS)
_esmart_${COMP}_DEPENDS=	#empty
. endif
. if !defined(_esmart_${COMP}_SLIB)
_esmart_${COMP}_SLIB=	esmart_${COMP}
. endif
. if !defined(_esmart_${COMP}_VERSION)
_esmart_${COMP}_VERSION=	${_EFL_ESMART_VERSION}
. endif
.endfor

#
# Evas engines and loaders support.
# Values processed:
# _evas_engine_COMP_CATEGORY	- Where the port for this object is located
# _evas_engine_COMP_PORTNAME	- Object's port subdirectory
# _evas_engine_COMP_DIR		- Evas object's subdir
#

# All components that are currently supported
_EFL_EVAS_ENGINES_ALL= buffer opengl sdl x11 xrender
_EFL_EVAS_LOADERS_ALL= bmp edb eet gif jpeg png pmaps svg tga tiff xpm

#
# Generic evas engines definitions
#
_EFL_EVAS_CATEGORY=	graphics
_EFL_EVAS_MODDIR=	${LOCALBASE}/lib/evas/modules/
_EFL_EVAS_ENGINES_MODDIR=	${_EFL_EVAS_MODDIR}/engines/
_EFL_EVAS_LOADERS_MODDIR=	${_EFL_EVAS_MODDIR}/loaders/

#
# Evas engine modules definitions
#

_evas_engine_buffer_DIR=	buffer
_evas_engine_opengl_DIR=	gl_x11
_evas_engine_sdl_DIR=		software_sdl
_evas_engine_x11_DIR=		software_x11
_evas_engine_xrender_DIR=	xrender_x11

#
# Assign values for variables which were not defined explicitly
#
.for COMP in ${_EFL_EVAS_ENGINES_ALL}
. if !defined(_evas_engine_${COMP}_CATEGORY)
_evas_engine_${COMP}_CATEGORY=	${_EFL_EVAS_CATEGORY}
. endif
. if !defined(_evas_engine_${COMP}_PORTNAME)
_evas_engine_${COMP}_PORTNAME=	evas-engine-${COMP}
. endif
. if !defined(_evas_engine_${COMP}_DIR)
_evas_engine_${COMP}_DIR=	${COMP}
. endif
.endfor

.for COMP in ${_EFL_EVAS_LOADERS_ALL}
. if !defined(_evas_loader_${COMP}_CATEGORY)
_evas_loader_${COMP}_CATEGORY=	${_EFL_EVAS_CATEGORY}
. endif
. if !defined(_evas_loader_${COMP}_PORTNAME)
_evas_loader_${COMP}_PORTNAME=	evas-loader-${COMP}
. endif
. if !defined(_evas_loader_${COMP}_DIR)
_evas_loader_${COMP}_DIR=	${COMP}
. endif
.endfor

#
# Ecore modules support
# Values processed:
# _ecore_COMP_CATEGORY	- Where the port for this object is located
# _ecore_COMP_PORTNAME	- Object's port subdirectory
# _ecore_COMP_NAME	- Ecore library name
#

# All components that are currently supported
_EFL_ECORE_ALL=	con config desktop evas file imf imf_evas input \
		input_evas ipc job sdl txt x11

#
# Generic ecore definitions
#
_EFL_ECORE_CATEGORY=	devel
_EFL_ECORE_MODDIR=	${LOCALBASE}/lib/

#
# Ecore modules definitions
#

_ecore_con_CATEGORY=		net
_ecore_config_CATEGORY=		sysutils
_ecore_desktop_CATEGORY=	x11
_ecore_evas_CATEGORY=		graphics
_ecore_sdl_CATEGORY=		graphics
_ecore_txt_CATEGORY=		converters
_ecore_imf_CATEGORY=		x11
_ecore_imf_evas_CATEGORY=	x11
_ecore_input_CATEGORY=		x11
_ecore_input_evas_CATEGORY=	x11
_ecore_x11_CATEGORY=		x11
_ecore_x11_NAME=		ecore_x

#
# Assign values for variables which were not defined explicitly
#
.for COMP in ${_EFL_ECORE_ALL}
. if !defined(_ecore_${COMP}_CATEGORY)
_ecore_${COMP}_CATEGORY=	${_EFL_ECORE_CATEGORY}
. endif
. if !defined(_ecore_${COMP}_PORTNAME)
_ecore_${COMP}_PORTNAME=	ecore-${COMP}
. endif
. if !defined(_ecore_${COMP}_NAME)
_ecore_${COMP}_NAME=	ecore_${COMP}
. endif
.endfor

#
# Handle WANT_EFL feature
#
.if !defined(AFTERPORTMK)
.if !defined(EFL_Include_pre)

EFL_Include_pre=	efl.mk

HAVE_EFL?=
HAVE_EFL_ESMART?=
HAVE_EFL_ECORE?=
.if defined(WANT_EFL)
#
# General EFL components
#
. for LIB in ${_USE_EFL_ALL}
.  if exists(${_${LIB}_PREFIX}/lib/lib${_${LIB}_SLIB}.so.${_${LIB}_VERSION})
HAVE_EFL+=	${LIB}
.  endif
. endfor

#
# Esmart objects
#
. for COMP in ${_EFL_ESMART_ALL}
.  if exists(${_esmart_${COMP}_PREFIX}/lib/lib${_esmart_${COMP}_SLIB}.so.${_esmart_${COMP}_VERSION})
HAVE_EFL_ESMART+=	${COMP}
.  endif
. endfor

#
# Ecore components
#
. for COMP in ${_EFL_ECORE_ALL}
.  if exists(${_ecore_PREFIX}/lib/lib${_ecore_${COMP}_NAME}.so.${_ecore_VERSION})
HAVE_EFL_ECORE+=	${COMP}
.  endif
. endfor
.endif

.endif #EFL_Include_pre
.endif #AFTERPORTMK

#
# Handle USE_EFL, USE_EFL_ESMART, USE_EFL_EVAS_* and USE_EFL_ECORE features
#
.if !defined(BEFOREPORTMK)
.if !defined(EFL_Include_post)

.if defined(USE_EFL_ESMART)

USE_EFL+=	${_EFL_ESMART_DEPENDS} #we use EFL too

_USE_EFL_ESMART=	#empty
.if USE_EFL_ESMART=="yes"
_USE_EFL_ESMART=	${_EFL_ESMART_ALL}
.else
. for COMP in ${USE_EFL_ESMART}
.  if ${_EFL_ESMART_ALL:M${COMP}}==""
IGNORE=	cannot install: unknown Esmart component ${COMP}
.  else
_USE_EFL_ESMART+=	${COMP} ${_esmart_${COMP}_DEPENDS}
.  endif
. endfor
.endif

# Get rid of duplicates
#.if ${OSVERSION} > 3000
#_USE_EFL_ESMART_UQ=	${_USE_EFL_ESMART:O:u}
#.else
_USE_EFL_ESMART_UQ=	#empty
. for COMP in ${_USE_EFL_ESMART}
.  if ${_USE_EFL_ESMART_UQ:M${COMP}}==""
_USE_EFL_ESMART_UQ+=	${COMP}
.  endif
. endfor
#.endif

.for COMP in ${_USE_EFL_ESMART_UQ}
LIB_DEPENDS+=	${_esmart_${COMP}_SLIB}.${_esmart_${COMP}_VERSION}:${PORTSDIR}/${_esmart_${COMP}_CATEGORY}/${_esmart_${COMP}_PORTNAME}
.endfor

.endif #USE_EFL_ESMART

.if defined(USE_EFL_EVAS_ENGINES)

USE_EFL+=	evas

_USE_EFL_EVAS_ENGINES=	#empty
. for COMP in ${USE_EFL_EVAS_ENGINES}
.  if ${_EFL_EVAS_ENGINES_ALL:M${COMP}}==""
IGNORE=	cannot install: unknown evas engine ${COMP}
.  else
_USE_EFL_EVAS_ENGINES+=	${COMP}
.  endif
. endfor

# Get rid of duplicates
_USE_EFL_EVAS_ENGINES_UQ=	#empty
. for COMP in ${_USE_EFL_EVAS_ENGINES}
.  if ${_USE_EFL_EVAS_ENGINES_UQ:M${COMP}}==""
_USE_EFL_EVAS_ENGINES_UQ+=	${COMP}
.  endif
. endfor

. for COMP in ${_USE_EFL_EVAS_ENGINES_UQ}
BUILD_DEPENDS+=	${_EFL_EVAS_ENGINES_MODDIR}/${_evas_engine_${COMP}_DIR}/freebsd${OSREL}-${ARCH}/module.so:${PORTSDIR}/${_evas_engine_${COMP}_CATEGORY}/${_evas_engine_${COMP}_PORTNAME}
RUN_DEPENDS+=	${_EFL_EVAS_ENGINES_MODDIR}/${_evas_engine_${COMP}_DIR}/freebsd${OSREL}-${ARCH}/module.so:${PORTSDIR}/${_evas_engine_${COMP}_CATEGORY}/${_evas_engine_${COMP}_PORTNAME}
. endfor

.endif #USE_EFL_EVAS_ENGINES

.if defined(USE_EFL_EVAS_LOADERS)

USE_EFL+=	evas

_USE_EFL_EVAS_LOADERS=	#empty
. for COMP in ${USE_EFL_EVAS_LOADERS}
.  if ${_EFL_EVAS_LOADERS_ALL:M${COMP}}==""
IGNORE=	cannot install: unknown evas loader ${COMP}
.  else
_USE_EFL_EVAS_LOADERS+=	${COMP}
.  endif
. endfor

# Get rid of duplicates
_USE_EFL_EVAS_LOADERS_UQ=	#empty
. for COMP in ${_USE_EFL_EVAS_LOADERS}
.  if ${_USE_EFL_EVAS_LOADERS_UQ:M${COMP}}==""
_USE_EFL_EVAS_LOADERS_UQ+=	${COMP}
.  endif
. endfor

. for COMP in ${_USE_EFL_EVAS_LOADERS_UQ}
BUILD_DEPENDS+=	${_EFL_EVAS_LOADERS_MODDIR}/${_evas_loader_${COMP}_DIR}/freebsd${OSREL}-${ARCH}/module.so:${PORTSDIR}/${_evas_loader_${COMP}_CATEGORY}/${_evas_loader_${COMP}_PORTNAME}
RUN_DEPENDS+=	${_EFL_EVAS_LOADERS_MODDIR}/${_evas_loader_${COMP}_DIR}/freebsd${OSREL}-${ARCH}/module.so:${PORTSDIR}/${_evas_loader_${COMP}_CATEGORY}/${_evas_loader_${COMP}_PORTNAME}
. endfor

.endif #USE_EFL_EVAS_LOADERS

.if defined(USE_EFL_ECORE)

USE_EFL+=	ecore

_USE_EFL_ECORE=	#empty
. for COMP in ${USE_EFL_ECORE}
.  if ${_EFL_ECORE_ALL:M${COMP}}==""
IGNORE=	cannot install: unknown ecore module ${COMP}
.  else
_USE_EFL_ECORE+=	${COMP}
.  endif
. endfor

# Get rid of duplicates
_USE_EFL_ECORE_UQ=	#empty
. for COMP in ${_USE_EFL_ECORE}
.  if ${_USE_EFL_ECORE_UQ:M${COMP}}==""
_USE_EFL_ECORE_UQ+=	${COMP}
.  endif
. endfor

. for COMP in ${_USE_EFL_ECORE_UQ}
LIB_DEPENDS+=	${_ecore_${COMP}_NAME}.${_ecore_VERSION}:${PORTSDIR}/${_ecore_${COMP}_CATEGORY}/${_ecore_${COMP}_PORTNAME}
. endfor

.endif #USE_EFL_ECORE

.if defined(USE_EFL)

EFL_Include_post=	efl.mk

#
# Check if we have all libraries requiested and build depends list
#
.if ${USE_EFL:Mlibrt_hack}
_USE_EFL_LIBRT_HACK=	yes
.endif
.if ${USE_EFL:Mmodarch_hack}
_USE_EFL_MODARCH_HACK=	yes
.endif
.if ${USE_EFL:Mlibtool_hack}
_USE_EFL_LIBTOOL_HACK=	yes
.endif
_USE_EFL=	#empty
.for LIB in ${USE_EFL:Nlibrt_hack:Nmodarch_hack:Nlibtool_hack}
. if ${_USE_EFL_ALL:M${LIB}}==""
IGNORE=	cannot install: unknown library ${LIB}
. else
_USE_EFL+=	${_${LIB}_DEPENDS} ${LIB}
. endif
.endfor

#
# Get rid of duplicates
#
_USE_EFL_UQ=	#empty
.for LIB in ${_USE_EFL}
. if ${_USE_EFL_UQ:M${LIB}}==""
_USE_EFL_UQ+=	${LIB}
. endif
.endfor

#
# define dependencies
#
.for LIB in ${_USE_EFL_UQ}
LIB_DEPENDS+=	${_${LIB}_SLIB}.${_${LIB}_VERSION}:${PORTSDIR}/${_${LIB}_CATEGORY}/${_${LIB}_PORTNAME}
.endfor

#
# Initialize configure enviropment
#
CPPFLAGS+=	-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib
CFLAGS+=	-I${LOCALBASE}/include

PLIST_SUB+=	E17_ARCH=freebsd${OSREL}-${ARCH}

.if defined(_USE_EFL_LIBRT_HACK)
#
# Don't use librt
#
post-patch: efl_drop_librt
efl_drop_librt:
	@${REINPLACE_CMD} -E \
	    -e '/^[[:space:]]+freebsd\*/,/^[[:space:]];;/s/-lrt//g' \
	    ${WRKSRC}/configure
.endif

.if defined(_USE_EFL_MODARCH_HACK)
#
# Use correct module arch path
#
post-patch: efl_patch_modarch
efl_patch_modarch:
	@${REINPLACE_CMD} -E \
	    -e 's/(MODULE_ARCH="\$$host_os-\$$host_cpu)-[^"]+"/\1"/g' \
	    -e 's/(MODULE_EDJE="\$$host_os-\$$host_cpu)-[^"]+"/\1"/g' \
	    ${WRKSRC}/configure
.endif

.if defined(_USE_EFL_LIBTOOL_HACK)
#
# Get rid of .la and static library files
#
post-configure: efl_drop_la
efl_drop_la:
	${REINPLACE_CMD} -E -e \
	    '/Install the pseudo-library/,/staticlibs=/s,^,#,' ${WRKSRC}/libtool
.endif

.endif #USE_EFL

.endif #EFL_Include_post
.endif #BEFOREPORTMK
