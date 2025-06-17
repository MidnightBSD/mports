_LICENSE_LIST= 	apsl2 apsl1 \
		bdb boost bzip2 cddl epl fdl1.1 fdl1.2 fdl1.3 gfdl guile \
		ibm ilm infozip iscl liberation lppl1 lppl1.1 lppl1.2 \
		mit modula3 ncsa npl nvidia NONE openldap2.8 OpenSSL opera owl OFL10 OFL11 \
		pgsql python ruby sgi subversion unlicense \
		WTFPL1 WTFPL x11 zlib zpl2.1 \
		publicdom unknown other agg restricted \
		ccasa3

# EU family
_LICENSE_LIST+= EUPL11 EUPL12

# GNU family
_LICENSE_LIST+= agpl gpl gpl2 gpl3 gpl3rle lgpl lgpl2.1 lgpl3
_LICENSE_LIST+= agpl+ gpl+ gpl2+ gpl3+ gpl3rle+ lgpl+ lgpl2.1+ lgpl3+

# BSD family
_LICENSE_LIST+= bsd bsd0 bsd1 bsd2 bsd3 bsd4

# Apache family
_LICENSE_LIST+= apache1 apache1.1 apache2

# Artistic family
_LICENSE_LIST+= artistic artistic2 perl

# PHP family
_LICENSE_LIST+= PHP202 PHP30 PHP301

# MPL family
_LICENSE_LIST+= mpl MPL10 MPL11 MPL20

# Create commons variants
_LICENSE_LIST+= CC0-1.0 \
                                CC-BY-1.0 CC-BY-2.0 CC-BY-2.5 CC-BY-3.0 CC-BY-4.0 \
                                CC-BY-ND-1.0 CC-BY-ND-2.0 CC-BY-ND-2.5 CC-BY-ND-3.0 CC-BY-ND-4.0 \
                                CC-BY-NC-1.0 CC-BY-NC-2.0 CC-BY-NC-2.5 CC-BY-NC-3.0 CC-BY-NC-4.0 \
                                CC-BY-NC-ND-1.0 CC-BY-NC-ND-2.0 CC-BY-NC-ND-2.5 CC-BY-NC-ND-3.0 CC-BY-NC-ND-4.0 \
                                CC-BY-NC-SA-1.0 CC-BY-NC-SA-2.0 CC-BY-NC-SA-2.5 CC-BY-NC-SA-3.0 CC-BY-NC-SA-4.0 \
                                CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0 CC-BY-SA-4.0

# List of groups (only names must be present)

_LICENSE_NAME_FSF=	Free Software Foundation Approved

_LICENSE_NAME_GPL=	GPL Compatible

_LICENSE_NAME_OSI=	OSI Approved

_LICENSE_NAME_COPYFREE= Comply with Copyfree Standard Definition.

_LICENSE_NAME_FONTS=	Font licenses

# Default permissions for licenses here, if not defined

_LICENSE_PERMS_DEFAULT=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

# Properties of license "xxx" (similar to port variables, but single)
#
# _LICENSE_NAME_xxx	- Full name/description of license/group
# _LICENSE_PERMS_xxx	- Permissions (if not defined defaults to
# 						  ${_LICENSE_PERMS_DEFAULT}.
# _LICENSE_GROUPS_xxx	- Groups (optional)
#
# Notes:
# - General permissions from groups are added to each license, if not defined.
#

_LICENSE_NAME_agg=	Aggregate (depricated)
_LICENSE_GROUPS_agg=

_LICENSE_NAME_agpl=	GNU Affero General Public License version 3
_LICENSE_GROUPS_agpl=	FSF GPL OSI
_LICENSE_NAME_apgl+ =       ${_LICENSE_NAME_agpl} (or later)
_LICENSE_GROUPS_agpl+ =     ${_LICENSE_GROUPS_agpl}

_LICENSE_NAME_apache1=	Apache License 1.0
_LICENSE_GROUPS_apache1=	FSF

_LICENSE_NAME_apache1.1=	Apache License 1.1
_LICENSE_GROUPS_apache1.1=	FSF OSI

_LICENSE_NAME_apache2=	Apache License 2.0
_LICENSE_GROUPS_apache2=	FSF OSI

_LICENSE_NAME_artistic=	Artistic License version 1.0
_LICENSE_GROUPS_artistic=	OSI

_LICENSE_NAME_perl=Artistic License (perl) version 1.0
_LICENSE_GROUPS_perl=	OSI

_LICENSE_NAME_artistic2=	Artistic License version 2.0
_LICENSE_GROUPS_artistic2=	FSF GPL OSI

_LICENSE_NAME_bdb=	Oracle BDB License
_LICENSE_GROUPS_bdb=	

_LICENSE_NAME_boost=	Boost Software License 1.0
_LICENSE_GROUPS_boost=	FSF OSI COPYFREE

_LICENSE_NAME_bsd=	BSD license Generic Version (deprecated)
_LICENSE_GROUPS_bsd=	FSF OSI COPYFREE

_LICENSE_NAME_bsd0=	BSD Zero Clause License
_LICENSE_GROUPS_bsd0=	OSI
 
_LICENSE_NAME_bsd1=	BSD 1-clause License
_LICENSE_GROUPS_bsd1=	COPYFREE

_LICENSE_NAME_bsd2=	BSD 2-clause "Simplified" License
_LICENSE_GROUPS_bsd2=	FSF OSI COPYFREE

_LICENSE_NAME_bsd3=	BSD 3-clause "New" or "Revised" License
_LICENSE_GROUPS_bsd3=	FSF OSI COPYFREE
	
_LICENSE_NAME_bsd4=	BSD 4-clause "Original" or "Old" License
_LICENSE_GROUPS_bsd4=	FSF

_LICENSE_NAME_bzip2=	bzip2 and libbzip2 License v1.0.6
_LICENSE_GROUPS_bzip2=

# todo: remove
_LICENSE_NAME_ccasa3=	Creative Commons Attribution-Share Alike 3.0
_LICENSE_GROUPS_ccasa3=

_LICENSE_NAME_CC0-1.0=		Creative Commons Zero v1.0 Universal
_LICENSE_GROUPS_CC0-1.0=	FSF GPL COPYFREE

_LICENSE_NAME_CC-BY-ND-1.0=     Creative Commons Attribution No Derivatives 1.0
_LICENSE_GROUPS_CC-BY-ND-1.0=   # empty

_LICENSE_NAME_CC-BY-ND-2.0=     Creative Commons Attribution No Derivatives 2.0
_LICENSE_GROUPS_CC-BY-ND-2.0=   # empty

_LICENSE_NAME_CC-BY-ND-2.5=     Creative Commons Attribution No Derivatives 2.5
_LICENSE_GROUPS_CC-BY-ND-2.5=   # empty

_LICENSE_NAME_CC-BY-ND-3.0=     Creative Commons Attribution No Derivatives 3.0
_LICENSE_GROUPS_CC-BY-ND-3.0=   # empty

_LICENSE_NAME_CC-BY-ND-4.0=     Creative Commons Attribution No Derivatives 4.0
_LICENSE_GROUPS_CC-BY-ND-4.0=   # empty

_LICENSE_NAME_CC-BY-NC-1.0=     Creative Commons Attribution Non Commercial 1.0
_LICENSE_GROUPS_CC-BY-NC-1.0=   # empty
_LICENSE_PERMS_CC-BY-NC-1.0=    dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-2.0=     Creative Commons Attribution Non Commercial 2.0
_LICENSE_GROUPS_CC-BY-NC-2.0=   # empty
_LICENSE_PERMS_CC-BY-NC-2.0=    dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-2.5=     Creative Commons Attribution Non Commercial 2.5
_LICENSE_GROUPS_CC-BY-NC-2.5=   # empty
_LICENSE_PERMS_CC-BY-NC-2.5=    dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-3.0=     Creative Commons Attribution Non Commercial 3.0
_LICENSE_GROUPS_CC-BY-NC-3.0=   # empty
_LICENSE_PERMS_CC-BY-NC-3.0=    dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-4.0=     Creative Commons Attribution Non Commercial 4.0
_LICENSE_GROUPS_CC-BY-NC-4.0=   # empty
_LICENSE_PERMS_CC-BY-NC-4.0=    dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-ND-1.0=  Creative Commons Attribution Non Commercial No Derivatives 1.0
_LICENSE_GROUPS_CC-BY-NC-ND-1.0=        # empty
_LICENSE_PERMS_CC-BY-NC-ND-1.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-ND-2.0=  Creative Commons Attribution Non Commercial No Derivatives 2.0
_LICENSE_GROUPS_CC-BY-NC-ND-2.0=        # empty
_LICENSE_PERMS_CC-BY-NC-ND-2.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-ND-2.5=  Creative Commons Attribution Non Commercial No Derivatives 2.5
_LICENSE_GROUPS_CC-BY-NC-ND-2.5=        # empty
_LICENSE_PERMS_CC-BY-NC-ND-2.5= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-ND-3.0=  Creative Commons Attribution Non Commercial No Derivatives 3.0
_LICENSE_GROUPS_CC-BY-NC-ND-3.0=        # empty
_LICENSE_PERMS_CC-BY-NC-ND-3.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-ND-4.0=  Creative Commons Attribution Non Commercial No Derivatives 4.0
_LICENSE_GROUPS_CC-BY-NC-ND-4.0=        # empty
_LICENSE_PERMS_CC-BY-NC-ND-4.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-SA-1.0=  Creative Commons Attribution Non Commercial Share Alike 1.0
_LICENSE_GROUPS_CC-BY-NC-SA-1.0=        # empty
_LICENSE_PERMS_CC-BY-NC-SA-1.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-SA-2.0=  Creative Commons Attribution Non Commercial Share Alike 2.0
_LICENSE_GROUPS_CC-BY-NC-SA-2.0=        # empty
_LICENSE_PERMS_CC-BY-NC-SA-2.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-SA-2.5=  Creative Commons Attribution Non Commercial Share Alike 2.5
_LICENSE_GROUPS_CC-BY-NC-SA-2.5=        # empty
_LICENSE_PERMS_CC-BY-NC-SA-2.5= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-SA-3.0=  Creative Commons Attribution Non Commercial Share Alike 3.0
_LICENSE_GROUPS_CC-BY-NC-SA-3.0=        # empty
_LICENSE_PERMS_CC-BY-NC-SA-3.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-NC-SA-4.0=  Creative Commons Attribution Non Commercial Share Alike 4.0
_LICENSE_GROUPS_CC-BY-NC-SA-4.0=        # empty
_LICENSE_PERMS_CC-BY-NC-SA-4.0= dist-mirror pkg-mirror auto-accept

_LICENSE_NAME_CC-BY-SA-1.0=     Creative Commons Attribution Share Alike 1.0
_LICENSE_GROUPS_CC-BY-SA-1.0=   # empty

_LICENSE_NAME_CC-BY-SA-2.0=     Creative Commons Attribution Share Alike 2.0
_LICENSE_GROUPS_CC-BY-SA-2.0=   # empty

_LICENSE_NAME_CC-BY-SA-2.5=     Creative Commons Attribution Share Alike 2.5
_LICENSE_GROUPS_CC-BY-SA-2.5=   # empty

_LICENSE_NAME_CC-BY-SA-3.0=     Creative Commons Attribution Share Alike 3.0
_LICENSE_GROUPS_CC-BY-SA-3.0=   # empty

_LICENSE_NAME_CC-BY-SA-4.0=     Creative Commons Attribution Share Alike 4.0
_LICENSE_GROUPS_CC-BY-SA-4.0=   # empty

_LICENSE_NAME_CC-BY-4.0=        Creative Commons Attribution 4.0
_LICENSE_GROUPS_CC-BY-4.0=      # empty

_LICENSE_NAME_cddl=	Common Development and Distribution License
_LICENSE_GROUPS_cddl=	FSF OSI

_LICENSE_NAME_epl=	Eclipse Public License
_LICENSE_GROUPS_epl=	FSF OSI

_LICENSE_NAME_gfdl=	GNU Free Documentation License
_LICENSE_GROUPS_gfdl=	FSF

_LICENSE_NAME_gpl=	GNU General Public License version 1
_LICENSE_GROUPS_gpl=	FSF GPL OSI
_LICENSE_NAME_gpl+ =	${_LICENSE_NAME_gpl} (or later)
_LICENSE_GROUPS_gpl+ =	${_LICENSE_GROUPS_gpl}

_LICENSE_NAME_gpl2=	GNU General Public License version 2
_LICENSE_GROUPS_gpl2=	FSF GPL OSI
_LICENSE_NAME_gpl2+ =	${_LICENSE_NAME_gpl2} (or later)
_LICENSE_GROUPS_gpl2+ =	${_LICENSE_GROUPS_gpl2}

_LICENSE_NAME_gpl3=	GNU General Public License version 3
_LICENSE_GROUPS_gpl3=	FSF GPL OSI
_LICENSE_NAME_gpl3+ =	${_LICENSE_NAME_gpl3} (or later)
_LICENSE_GROUPS_gpl3+ =	${_LICENSE_GROUPS_gpl3}

_LICENSE_NAME_gpl3rle=	GNU GPL version 3 Runtime Library Exception
_LICENSE_GROUPS_gpl3rle=	FSF GPL OSI

_LICENSE_NAME_gpl3rle+ =	${_LICENSE_NAME_gpl3rle} (or later)
_LICENSE_GROUPS_gpl3rle+ =	${_LICENSE_GROUPS_gpl3rle}

_LICENSE_NAME_EUPL11=	European Union Public Licence version 1.1
_LICENSE_GROUPS_EUPL11=	EU OSI
_LICENSE_NAME_EUPL12=	European Union Public Licence version 1.2
_LICENSE_GROUPS_EUPL12=	EU OSI

_LICENSE_NAME_ibm=	IBM License
_LICENSE_GROUPS_ibm=

_LICENSE_NAME_infozip=	Info-ZIP License
_LICENSE_GROUPS_infozip=

_LICENSE_NAME_iscl=	Internet Systems Consortium License
_LICENSE_GROUPS_iscl=	FSF GPL OSI COPYFREE

_LICENSE_NAME_lgpl=	GNU Library General Public License generic depricated
_LICENSE_GROUPS_lgpl=	FSF GPL OSI
_LICENSE_NAME_lgpl+ =	${_LICENSE_NAME_lgpl} (or later)
_LICENSE_GROUPS_lgpl+ =	${_LICENSE_GROUPS_lgpl}

_LICENSE_NAME_lgpl20=	GNU Library General Public License version 2.0
_LICENSE_GROUPS_lgpl20=	FSF GPL OSI
_LICENSE_NAME_lgpl20+ =	${_LICENSE_NAME_lgpl20} (or later)
_LICENSE_GROUPS_lgpl20+ =	${_LICENSE_GROUPS_lgpl20}

_LICENSE_NAME_lgpl2.1=	GNU Lesser General Public License version 2.1
_LICENSE_GROUPS_lgpl2.1=	FSF GPL OSI
_LICENSE_NAME_lgpl2.1+ =	${_LICENSE_NAME_lgpl2.1} (or later)
_LICENSE_GROUPS_lgpl2.1+ =	${_LICENSE_GROUPS_lgpl2.1}

_LICENSE_NAME_lgpl3=	GNU Lesser General Public License version 3
_LICENSE_GROUPS_lgpl3=	FSF GPL OSI
_LICENSE_NAME_lgpl3+ =	${_LICENSE_NAME_lgpl3} (or later)
_LICENSE_GROUPS_lgpl3+ =	${_LICENSE_GROUPS_lgpl3}

_LICENSE_NAME_lppl1=	LaTeX Project Public License version 1.0
_LICENSE_GROUPS_lppl1=	FSF OSI
_LICENSE_PERMS_lppl1=	dist-mirror dist-sell

_LICENSE_NAME_lppl1.1=	LaTeX Project Public License version 1.1
_LICENSE_GROUPS_lppl1.1=	FSF OSI
_LICENSE_PERMS_lppl1.1= dist-mirror dist-sell

_LICENSE_NAME_lppl1.2=	LaTeX Project Public License version 1.2
_LICENSE_GROUPS_lppl1.2=	FSF OSI
_LICENSE_PERMS_lppl1.2=	dist-mirror dist-sell

_LICENSE_NAME_LPPL13=	LaTeX Project Public License version 1.3
_LICENSE_GROUPS_LPPL13=	FSF OSI
_LICENSE_PERMS_LPPL13=	dist-mirror dist-sell

_LICENSE_NAME_LPPL13a=	LaTeX Project Public License version 1.3a
_LICENSE_GROUPS_LPPL13a=	FSF OSI
_LICENSE_PERMS_LPPL13a=	xdist-mirror dist-sell

_LICENSE_NAME_LPPL13b=	LaTeX Project Public License version 1.3b
_LICENSE_GROUPS_LPPL13b=	FSF OSI
_LICENSE_PERMS_LPPL13b=	dist-mirror dist-sell

_LICENSE_NAME_LPPL13c=	LaTeX Project Public License version 1.3c
_LICENSE_GROUPS_LPPL13c=	FSF OSI
_LICENSE_PERMS_LPPL13c=	dist-mirror dist-sell

_LICENSE_NAME_mit=	MIT license / X11 license
_LICENSE_GROUPS_mit=	FSF GPL OSI COPYFREE

_LICENSE_NAME_modula3=	Modula 3 license
_LICENSE_GROUPS_modula3=

_LICENSE_NAME_mpl=	Mozilla Public License
_LICENSE_GROUPS_mpl=	FSF OSI

_LICENSE_NAME_MPL10=	Mozilla Public License version 1.0
_LICENSE_GROUPS_MPL10=	FSF OSI

_LICENSE_NAME_MPL11=	Mozilla Public License version 1.1
_LICENSE_GROUPS_MPL11=	FSF OSI

_LICENSE_NAME_MPL20=	Mozilla Public License version 2.0
_LICENSE_GROUPS_MPL20=	FSF OSI

_LICENSE_NAME_ncsa=     University of Illinois/NCSA Open Source License
_LICENSE_GROUPS_ncsa=   COPYFREE FSF GPL OSI

_LICENSE_NAME_nvidia= NVIDIA License
_LICENSE_GROUPS_nvidia=

_LICENSE_NAME_NONE=	No license specified
_LICENSE_GROUPS_NONE=	# empty
_LICENSE_PERMS_NONE=	none

_LICENSE_NAME_OFL10=	SIL Open Font License version 1.0 (http://scripts.sil.org/OFL)
_LICENSE_GROUPS_OFL10=	FONTS

_LICENSE_NAME_OFL11=	SIL Open Font License version 1.1 (http://scripts.sil.org/OFL)
_LICENSE_GROUPS_OFL11=	FONTS

_LICENSE_NAME_openldap2.8= OpenLDAP License version 2.8
_LICENSE_GROUPS_openldap2.8=

_LICENSE_NAME_opera=	Opera License
_LICENSE_GROUPS_opera=

_LICENSE_NAME_other=	Other License (not yet defined)
_LICENSE_GROUPS_other=	

_LICENSE_NAME_OpenSSL=  OpenSSL License
_LICENSE_GROUPS_OpenSSL=        FSF

_LICENSE_NAME_owl=	Open Works License (owl.apotheon.org)
_LICENSE_GROUPS_owl=	COPYFREE

_LICENSE_NAME_pgsql=	PostgreSQL Licence
_LICENSE_GROUPS_pgsql=	FSF GPL OSI COPYFREE

_LICENSE_NAME_php=	PHP License version 3.01
_LICENSE_GROUPS_php=	FSF OSI

_LICENSE_NAME_PHP202=	PHP License version 2.02
_LICENSE_GROUPS_PHP202=	FSF OSI

_LICENSE_NAME_PHP30=	PHP License version 3.0
_LICENSE_GROUPS_PHP30=	FSF OSI

_LICENSE_NAME_PHP301=	PHP License version 3.01
_LICENSE_GROUPS_PHP301=	FSF OSI

_LICENSE_NAME_publicdom=	Public Domain
_LICENSE_GROUPS_publicdom=

_LICENSE_NAME_python=	Python Software Foundation License
_LICENSE_GROUPS_python=	FSF GPL OSI

_LICENSE_NAME_unlicense=      The Unlicense                                                                                                                             
_LICENSE_GROUPS_unlicense=    COPYFREE FSF GPL

_LICENSE_NAME_ruby=	Ruby License
_LICENSE_GROUPS_ruby=	FSF

_LICENSE_NAME_sgi=	SGI License
_LICENSE_GROUPS_sgi=	

_LICENSE_NAME_unknown=	Unknown license
_LICENSE_GROUPS_unknown=

_LICENSE_NAME_WTFPL1=	Do What the Fuck You Want To Public License version 1
_LICENSE_GROUPS_WTFPL1=	GPL FSF COPYFREE

_LICENSE_NAME_WTFPL=	Do What the Fuck You Want To Public License version 2
_LICENSE_GROUPS_WTFPL=	GPL FSF COPYFREE

_LICENSE_NAME_zlib=		zlib License
_LICENSE_GROUPS_zlib=	GPL FSF OSI

_LICENSE_NAME_zpl2.1=    Zope Public License version 2.1 
_LICENSE_GROUPS_zpl2.1=  GPL OSI

# Set default permissions if not defined

.for lic in ${_LICENSE_LIST}
.	if !defined(_LICENSE_PERMS_${lic})
_LICENSE_PERMS_${lic}=	${_LICENSE_PERMS_DEFAULT}
.	endif
.endfor
