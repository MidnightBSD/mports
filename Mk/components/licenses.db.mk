# $MidnightBSD$

_LICENSES= 	agpl gpl gpl2 gpl3 lgpl lgpl2.1 lgpl3 bsd4 bsd3 bsd2 \
		apache2 apache1.1 apache1 apsl2 apsl1 artistic artistic2 \
		bdb boost bzip2 cddl epl fdl1.1 fdl1.2 fdl1.3 guile \
		ibm ilm infozip iscl liberation lppl1 lppl1.1 lppl1.2 \
		mit modula3 mpl npl nvidia openldap2.8 opera owl \
		perl pgsql php python ruby sgi subversion x11 zlib \
		publicdom unknown other agg restricted \
		ccasa3

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

_LICENSE_NAME_boost=	Boost Software License
_LICENSE_GROUPS_boost=	FSF OSI COPYFREE
 
_LICENSE_NAME_bsd2=	BSD 2-clause "Simplified" License
_LICENSE_GROUPS_bsd2=	FSF OSI COPYFREE

_LICENSE_NAME_bsd3=	BSD 3-clause "New" or "Revised" License
_LICENSE_GROUPS_bsd3=	FSF OSI COPYFREE
	
_LICENSE_NAME_bsd4=	BSD 4-clause "Original" or "Old" License
_LICENSE_GROUPS_bsd4=	FSF

_LICENSE_NAME_bzip2=	BZIP License
_LICENSE_GROUPS_bzip2=

_LICENSE_NAME_ccasa3=	Creative Commons Attribution-Share Alike 3.0
_LICENSE_GROUPS_ccasa3=

_LICENSE_NAME_cddl=	Common Development and Distribution License
_LICENSE_GROUPS_cddl=	FSF OSI

_LICENSE_NAME_epl=	Eclipse Public License
_LICENSE_GROUPS_epl=	FSF OSI

_LICENSE_NAME_gfdl=	GNU Free Documentation License
_LICENSE_GROUPS_gfdl=	FSF

_LICENSE_NAME_gpl=	GNU General Public License version 1
_LICENSE_GROUPS_gpl=	FSF GPL OSI

_LICENSE_NAME_gpl2=	GNU General Public License version 2
_LICENSE_GROUPS_gpl2=	FSF GPL OSI

_LICENSE_NAME_gpl3=	GNU General Public License version 3
_LICENSE_GROUPS_gpl3=	FSF GPL OSI

_LICENSE_NAME_ibm=	IBM License
_LICENSE_GROUPS_ibm=

_LICENSE_NAME_infozip=	Info-ZIP License
_LICENSE_GROUPS_infozip=

_LICENSE_NAME_iscl=	Internet Systems Consortium License
_LICENSE_GROUPS_iscl=	FSF GPL OSI COPYFREE

_LICENSE_NAME_lgpl=	GNU Library General Public License generic depricated
_LICENSE_GROUPS_lgpl=	FSF GPL OSI

_LICENSE_NAME_lgpl20=	GNU Library General Public License version 2.0
_LICENSE_GROUPS_lgpl20=	FSF GPL OSI

_LICENSE_NAME_lgpl2.1=	GNU Lesser General Public License version 2.1
_LICENSE_GROUPS_lgpl2.1=	FSF GPL OSI

_LICENSE_NAME_lgpl3=	GNU Lesser General Public License version 3
_LICENSE_GROUPS_lgpl3=	FSF GPL OSI

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

_LICENSE_NAME_nvidia= NVIDIA License
_LICENSE_GROUPS_nvidia=

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

_LICENSE_NAME_owl=	Open Works License (owl.apotheon.org)
_LICENSE_GROUPS_owl=	COPYFREE

_LICENSE_NAME_pgsql=	PostgreSQL Licence (PostgreSQL)
_LICENSE_GROUPS_pqgsql=	OSI COPYFREE

_LICENSE_NAME_php=	PHP License version 3.01
_LICENSE_GROUPS_php=	FSF OSI

_LICENSE_NAME_publicdom=	Public Domain
_LICENSE_GROUPS_publicdom=

_LICENSE_NAME_python=	Python Software Foundation License
_LICENSE_GROUPS_python=	FSF GPL OSI

_LICENSE_NAME_ruby=	Ruby License
_LICENSE_GROUPS_ruby=	FSF

_LICENSE_NAME_sgi=	SGI License
_LICENSE_GROUPS_sgi=	

_LICENSE_NAME_unknown=	Unknown license
_LICENSE_GROUPS_unknown=

_LICENSE_NAME_zlib=		zlib License
_LICENSE_GROUPS_zlib=	GPL FSF OSI

# Set default permissions if not defined

.for lic in ${_LICENSES}
.	if !defined(_LICENSE_PERMS_${lic})
_LICENSE_PERMS_${lic}=	${_LICENSE_PERMS_DEFAULT}
.	endif
.endfor
