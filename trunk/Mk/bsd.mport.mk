#-*- mode: makefile; tab-width: 4; -*-
# ex:ts=4
#
# $MidnightBSD: mports/Mk/bsd.mport.mk,v 1.53 2007/08/07 17:54:18 ctriv Exp $
# $FreeBSD: ports/Mk/bsd.port.mk,v 1.540 2006/08/14 13:24:18 erwin Exp $
#
#   bsd.mport.mk - 2007/04/01 Chris Reinhardt
#   Based on:
#		bsd.port.mk - 940820 Jordan K. Hubbard.
#	This file is in the public domain.
#
# Please view me with 4 column tabs!

# This is the master file for the most common elements to all port
# Makefile in the ports system.  For a more general overview of its
# use and importance, see the Porter's Handbook.

# There are two different types of "maintainers" in the ports framework.
# The maintainer alias of the bsd.port.mk file is listed below in the
# MidnightBSD_MAINTAINER entry.  You should consult them if you have any
# questions/suggestions regarding this file.
#
# DO NOT COMMIT CHANGES TO THIS FILE BY YOURSELF, EVEN IF YOU DID NOT GET
# A RESPONSE FROM THE MAINTAINER(S) WITHIN A REASONABLE TIMEFRAME! ALL
# UNAUTHORISED CHANGES WILL BE UNCONDITIONALLY REVERTED!

MidnightBSD_MAINTAINER=	ctriv@MidnightBSD.org

# For each port, the MAINTAINER variable is what you should consult for
# contact information on the person(s) to contact if you have questions/
# suggestions about that specific port.  By default (if no MAINTAINER
# is listed), a port is maintained by the subscribers of the ports@FreeBSD.org
# mailing list, and any correspondence should be directed there.
#
# MAINTAINER	- The e-mail address of the contact person for this port.
#				  Default: ports@midnightbsd.org
#
# These are meta-variables that are automatically set to the system
# you are running on.  These are provided in case you need to take
# different actions for different values.
#
# ARCH			- The architecture of the target machine, such as would be
#				  returned by "uname -p".  (Note: Ports should test against
#				  ARCH, and not the host machine's architecture which is
#				  MACHINE_ARCH, to enable ports to be cross-built.)
# OPSYS			- Portability clause.  This is the operating system the
#				  makefile is being used on.  Automatically set to
#				  "FreeBSD," "NetBSD," or "OpenBSD" as appropriate.
# OSREL			- The release version (numeric) of the operating system.
# OSVERSION		- The value of __FreeBSD_version.
# PORTOBJFORMAT	- The object format ("aout" or "elf").
#
# This is the beginning of the list of all variables that need to be
# defined in a port, listed in order that they should be included
# to fit in with existing conventions.  (Exception: MAINTAINER actually
# should appear after EXTRACT_ONLY and before MASTER_SITE_BACKUP).
#
# These variables are used to identify your port.
#
# PORTNAME		- Name of software.  Mandatory.
# PORTVERSION	- Version of software.  Mandatory when no DISTVERSION is given.
# PORTREVISION	- Version of port.  Optional.  Commonly used to indicate
#				  that an update has happened that affects the port
#				  framework itself, but not the distributed software
#				  (e.g., local patches or Makefile changes).
# PORTEPOCH		- Optional.  In certain odd cases, the PORTREVISION logic
#				  can be fooled by ports that appear to go backwards
#				  numerically (e.g. if port-0.3 is newer than port-1998).
#				  In this case, incrementing PORTEPOCH forces the revision.
#				  Default: 0 (no effect).
# PKGNAME		- Always defined as
#				  ${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}-${PORTVERSION}.
#				  Do not define this in your Makefile.
# PKGNAMEPREFIX	- Prefix to specify that port is language-specific, etc.
#				  Optional.
# PKGNAMESUFFIX	- Suffix to specify compilation options.  Optional.
# PKGVERSION	- Always defined as
#		  ${PORTVERSION},
#		  Do not define this in your Makefile.
# UNIQUENAME	- A name for your port that is globally unique.  By default,
#				  this is set to ${LATEST_LINK} when LATEST_LINK is set,
#				  and to ${PKGNAMEPREFIX}${PORTNAME} otherwise.
# DISTVERSION	- Vendor version of the distribution.
#				  Default: ${PORTVERSION}
# DISTNAME		- Name of port or distribution used in generating
#				  WRKSRC and DISTFILES below.
#				  Default:
#				  ${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION}${DISTVERSIONSUFFIX}
# CATEGORIES	- A list of descriptive categories into which this port falls.
#				  Mandatory.
#
# These variable describe how to fetch files required for building the port.
#
# DISTFILES		- Name(s) of archive file(s) containing distribution.
#				  Set this to an empty string if the port doesn't require it.
#				  Default: ${DISTNAME}${EXTRACT_SUFX}
# EXTRACT_SUFX	- Suffix for archive names
#				  You never have to set both DISTFILES and EXTRACT_SUFX.
#				  Default: .tar.bz2 if USE_BZIP2 is set, .zip if USE_ZIP is
#				  set, .tar.gz otherwise.
# MASTER_SITES	- Primary location(s) for distribution files if not found
#				  locally.  See bsd.sites.mk for common choices for
#				  MASTER_SITES.
# MASTER_SITE_SUBDIR
#				- Subdirectory of MASTER_SITES. Will sometimes need to be
#				  set to ${PORTNAME} for (e.g.) MASTER_SITE_SOURCEFORGE.
#				  Only guaranteed to work for choices of ${MASTER_SITES}
#				  defined in bsd.sites.mk.
#				  Default: not set.
# PATCHFILES	- Name(s) of additional files that contain distribution
#				  patches. Make will look for them at PATCH_SITES (see below).
#				  They will automatically be uncompressed before patching if
#				  the names end with ".gz", ".bz2" or ".Z".
#				  Default: not set.
# PATCH_SITES	- Primary location(s) for distribution patch files
#				  if not found locally.
# DIST_SUBDIR	- Suffix to ${DISTDIR}.  If set, all ${DISTFILES} and
#				  ${PATCHFILES} will be put in this subdirectory of
#				  ${DISTDIR} (see below).  Also they will be fetched in this
#				  subdirectory from FreeBSD mirror sites.
# ALLFILES		- All of ${DISTFILES} and ${PATCHFILES}.
# IGNOREFILES	- If set, don't perform checksum checks on these files.
# NOFETCHFILES	- If set, don't download these files from the ${MASTER_SITES}
#				  or ${MASTER_SITE_BACKUP} (but do from
#				  ${MASTER_SITE_OVERRIDE})
# EXTRACT_ONLY	- If set, a subset of ${DISTFILES} you want to
#				  actually extract.
# ALWAYS_KEEP_DISTFILES
#				- If set, the package building cluster will save the distfiles
#				  along with the packages. This may be required to comply with
#				  some licenses, e.g. GPL in some cases.
#				  Default: not set.
#
# (NOTE: by convention, the MAINTAINER entry (see above) should go here.)
#
# These variables are typically set in /etc/make.conf to indicate
# the user's preferred location to fetch files from.  You should
# rarely need to set these.
#
# MASTER_SITE_BACKUP
#				- Backup location(s) for distribution files and patch
#				  files if not found locally and ${MASTER_SITES}/${PATCH_SITES}
#				  Default:
#				  ftp://ftp.FreeBSD.org/pub/FreeBSD/ports/distfiles/${DIST_SUBDIR}/
# MASTER_SITE_OVERRIDE
#				- If set, override the MASTER_SITES setting with this
#				  value.
# MASTER_SITE_FREEBSD
#				- If set, only use ${MASTER_SITE_BACKUP} for
#				  MASTER_SITES.
# CD_MOUNTPTS	- List of CDROM mountpoints to look for distfiles under.
#				  This variable supercedes CD_MOUNTPT, which is
#				  obsolete.
#
# 
# Set these if your port should not be built under certain circumstances.
# These are string variables; you should set them to the reason why
# they are necessary.  Over time, many of the variables will be replaced
# by the LICENSE variable.
#
# LICENSE		- The license of the port.  This variable is required. 
#				  Run 'make license-list' to see the list of valid licenses.
#
# RESTRICTED	- Prevent the distribution of distfiles and packages to
#				  the FTP sites or on CDROM (e.g. forbidden by license
#				  considerations).
# NO_CDROM		- Packages and distfiles may not go on CDROM (e.g. must
#				  not be re-sold) but can go on FTP sites.
# NO_PACKAGE	- Port should not be packaged for ftp sites or CDROMs,
#				  but distfiles can be put on ftp sites and CDROMs.
# FORBIDDEN		- Package build should not be attempted because of
#				  security vulnerabilities.
# IGNORE		- Package build should be skipped entirely (e.g.
#				  because of serious unfixable problems in the build,
#				  because it cannot be manually fetched, etc).  Error
#				  logs will not appear on pointyhat, so this should be
#				  used sparingly.
# BROKEN		- Port is believed to be broken.  Package builds will
#				  still be attempted on the pointyhat package cluster to
#				  test this assumption.
# DEPRECATED	- Port is deprecated to install. Advisory only.
# EXPIRATION_DATE
#				- If DEPRECATED is set, determines a date when
#				  the port is planed to remove. The date format is
#				  ISO 8601 (YYYY-MM-DD).
#
# DISABLE_VULNERABILITIES
#				- If set, do not check if the port is listed in the
#				  vulnerabilities database.
#
# In addition to RESTRICTED or NO_CDROM, if only a subset of distfiles
# or patchfiles have redistribution restrictions, set the following
# to the list of such files.
#
# RESTRICTED_FILES
#				- List of files that cannot be redistributed.
#				  Default: "${DISTFILES} ${PATCHFILES}" if RESTRICTED
#				  or NO_CDROM is set, empty otherwise.
#
# These variables are booleans, so you don't need to set them to the reason.
#
# IS_INTERACTIVE
#				- Set this if your port needs to interact with the user
#				  during any step in a package build.  User can then decide
#				  to skip this port by setting ${BATCH}, or compiling only
#				  the interactive ports by setting ${INTERACTIVE}.
#				  Default: not set.
# USE_SUBMAKE	- Set this if you want that each of the port's main 6 targets
#				  (extract, patch, configure, build, install and package) to be
#				  executed in a separate make(1) process. Useful when one of
#				  the stages needs to influence make(1) variables of the later
#				  stages using ${WRKDIR}/Makefile.inc generated on the fly.
#				  Default: not set.
#
# Set these if your port only makes sense to certain architectures.
# They are lists containing names for them (e.g., "alpha i386").
# (Defaults: not set.)
#
# ONLY_FOR_ARCHS
#				- Only build ports if ${ARCH} matches one of these.
# NOT_FOR_ARCHS	- Only build ports if ${ARCH} doesn't match one of these.
# ONLY_FOR_ARCHS_REASON
# ONLY_FOR_ARCHS_REASON_${ARCH}
#				- Reason why it's only for ${ONLY_FOR_ARCHS}s
# NOT_FOR_ARCHS_REASON
# NOT_FOR_ARCHS_REASON_${ARCH}
#				- Reason why it's not for ${NOT_FOR_ARCHS}s
# IA32_BINARY_PORT	- Set this instead of ONLY_FOR_ARCHS if the given port
#				  fetches and installs compiled i386 binaries.
#
# Dependency checking.  Use these if your port requires another port
# not in the list below.  (Default: empty.)
#
# EXTRACT_DEPENDS
#				- A list of "path:dir[:target]" tuples of other ports this
#				  package depends on in the "extract" stage.  "path" is
#				  the name of a file if it starts with a slash (/), an
#				  executable otherwise.  make will test for the existence
#				  (if it is a full pathname) or search for it in your
#				  $PATH (if it is an executable) and go into "dir" to do
#				  a "make all install" if it's not found.  If the third
#				  field ("target") exists, it will be used instead of
#				  ${DEPENDS_TARGET}.
# PATCH_DEPENDS	- A list of "path:dir[:target]" tuples of other ports this
#				  package depends on in the "patch" stage.  "path" is the
#				  name of a file if it starts with a slash (/), an
#				  executable otherwise.  make will test for the existence
#				  (if it is a full pathname) or search for it in your
#				  $PATH (if it is an executable) and go into "dir" to do
#				  a "make all install" if it's not found.  If the third
#				  field ("target") exists, it will be used instead of
#				  ${DEPENDS_TARGET}.
# FETCH_DEPENDS	- A list of "path:dir[:target]" tuples of other ports this
#				  package depends in the "fetch" stage.  "path" is the
#				  name of a file if it starts with a slash (/), an
#				  executable otherwise.  make will test for the
#				  existence (if it is a full pathname) or search for
#				  it in your $PATH (if it is an executable) and go
#				  into "dir" to do a "make all install" if it's not
#				  found.  If the third field ("target") exists, it will
#				  be used instead of ${DEPENDS_TARGET}.
# BUILD_DEPENDS	- A list of "path:dir[:target]" tuples of other ports this
#				  package depends to build (between the "extract" and
#				  "build" stages, inclusive).  The test done to
#				  determine the existence of the dependency is the
#				  same as FETCH_DEPENDS.  If the third field ("target")
#				  exists, it will be used instead of ${DEPENDS_TARGET}.
# RUN_DEPENDS	- A list of "path:dir[:target]" tuples of other ports this
#				  package depends to run.  The test done to determine
#				  the existence of the dependency is the same as
#				  FETCH_DEPENDS.  This will be checked during the
#				  "install" stage and the name of the dependency will
#				  be put into the package as well.  If the third field
#				  ("target") exists, it will be used instead of
#				  ${DEPENDS_TARGET}.
# LIB_DEPENDS	- A list of "lib:dir[:target]" tuples of other ports this
#				  package depends on.  "lib" is the name of a shared library.
#				  make will use "ldconfig -r" to search for the library.
#				  lib can contain extended regular expressions.
# DEPENDS		- A list of "dir[:target]" tuples of other ports this
#				  package depends on being made first.  Use this only for
#				  things that don't fall into the above four categories.
#				  If the second field ("target") exists, it will be used
#				  instead of ${DEPENDS_TARGET}.
#
# DEPENDS_TARGET
#				- The default target to execute when a port is calling a
#				  dependency.
#				  Default: cached-install
#
# These variables control options about how a port gets built and/or
# are shorthand notations for common sets of dependencies.
# Use these if your port uses some of the common software packages. By
# convention these should be set to 'yes', although they only need to be
# defined. Defaults: not set, unless explicitly indicated below.
#
# Note: the distinction between the USE_* and WANT_* variables, and the
# WITH_* and WITHOUT_* variables, are that the former are restricted to
# usage inside the ports framework, and the latter are reserved for user-
# settable options.  (Setting USE_* in /etc/make.conf is always wrong).
#
# WITH_DEBUG            - If set, debugging flags are added to CFLAGS and the
#                         binaries don't get stripped by INSTALL_PROGRAM.
#                         Besides, individual ports might add their specific
#                         to produce binaries for debugging purposes.
#                         You can override the debug flags that are passed to
#                         the compiler by setting DEBUG_FLAGS. It is set to
#                         "-g" at default.
#
# USE_BZIP2		- If set, this port tarballs use bzip2, not gzip, for
#				  compression.
# USE_ZIP		- If set, this port distfile uses zip, not tar w/[bg]zip
#				  for compression.
# USE_DOS2UNIX	- If set to "YES", remove the ^M from all files
#				  under ${WRKSRC}. If set to a string, remove in all
#				  files under ${WRKSRC} with one of these names the ^Ms.
# USE_GCC		- If set, this port requires this version of gcc, either in
#				  the system or installed from a port.
# USE_GCPIO		- if set, uses GNU cpio.  Required for ${CPIO} usage.
# USE_GMAKE		- If set, this port uses gmake.
# GMAKE			- Set to path of GNU make if not in $PATH.
#				  Default: gmake
##
# USE_ICONV		- If set, this port uses libiconv.
# USE_GETTEXT	- If set, this port uses GNU gettext (libintl).
#
# USE_GHOSTSCRIPT
#				- If set, this port needs ghostscript to both
#				  build and run.
# USE_GHOSTSCRIPT_BUILD
#				- If set, this port needs ghostscript to build.
# USE_GHOSTSCRIPT_RUN
#				- If set, this port needs ghostscript to run.
# GHOSTSCRIPT_PORT
#				- The port that provides postscript functionality.
#				  Some installations may wish to override the default
#				  to specify a version without X11 and/or localized
#				  versions for their nationality.
# WITH_GHOSTSCRIPT_GPL
#				- If set, this port uses the GPL version of the ghostscript
#				  software instead of the GNU version, which is used otherwise.
# WITH_GHOSTSCRIPT_AFPL
#				- If set, this port uses the AFPL version of the ghostscript
#				  software instead of the GNU version, which is used otherwise.
##
# USE_BISON		- If set, this port uses bison for building.
##
# USE_IMAKE		- If set, this port uses imake.  Implies USE_X_PREFIX 
# XMKMF			- Set to path of `xmkmf' if not in $PATH
#				  Default: xmkmf -a
# USE_X_PREFIX	- If set, this port installs in ${X11BASE}.  
# USE_XLIB		- If set, this port uses the X libraries. In the USE_LINUX
#				  case the linux X libraries are referenced.
#
# USE_FREETYPE	- If set, this port uses the freetype print libraries.
# USE_GL               - If set, this port uses libGL
# USE_MOTIF		- If set, this port uses a Motif toolkit.  Implies USE_XPM.
# NO_OPENMOTIF	- If set, this port uses a custom Motif toolkit
#				  instead of Openmotif.
#				  Used only when USE_MOTIF is set.
# WANT_LESSTIF	- If set, this port uses Lesstif as Motif toolkit.
#				  Used only when USE_MOTIF is set.  Implies
#				  NO_OPENMOTIF.
##
# USE_SDL		- If set, this port uses the sdl libraries.
#				  See bsd.sdl.mk for more information.
# USE_XPM		- If set, this port uses the xpm graphics libraries.
##
# USE_OPENSSL	- If set, this port relies on the OpenSSL package.
##
# USE_OPENLDAP	- If set, this port uses the OpenLDAP libraries.
#				  Implies: WANT_OPENLDAP_VER?=23
# WANT_OPENLDAP_VER
#				- Legal values are: 22, 23, 24
#				  If set to an unkown value, the port is marked BROKEN.
# WANT_OPENLDAP_SASL
#				- If set, the system should use OpenLDAP libraries
#				  with SASL support.
##
# USE_FAM		- If set, this port uses the File Alteration Monitor.
#
# WANT_FAM_SYSTEM
#				- Legal values are: gamin (default),fam
#				  If set to an unknown value, the port is marked IGNORE.
##
# USE_AUTOTOOLS	- If set, this port uses various GNU autotools
#				  (libtool, autoconf, autoheader, automake et al.)
#				  See bsd.autotools.mk for more details.
##
# USE_SCONS - If set, this port uses the Python-based SCons build system
#				  See bsd.scons.mk for more details.
##
# USE_JAVA		- If set, this port relies on the Java language.
#				  Implies inclusion of bsd.java.mk.  (Also see
#				  that file for more information on USE_JAVA_*).
# USE_PYTHON	- If set, this port relies on the Python language.
#				  Implies inclusion of bsd.python.mk. (Also see
#				  that file for more information on USE_PYTHON_*
#				  and USE_PYDISTUTILS).
# USE_RUBY		- If set, this port relies on the Ruby language.
#				  Implies inclusion of bsd.ruby.mk.  (Also see
#				  that file for more information on USE_RUBY_*).
# USE_GNUSTEP	- If set, this port relies on the GNUstep system.
#				  Implies the inclusion of bsd.gnustep.mk.
#				  (Also see that file for more information on
#				  USE_GNUSTEP_*).
##
# USE_GNOME		- A list of the Gnome dependencies the port has (e.g.,
#				  glib12, gtk12).  Implies that the port needs Gnome.
#				  Implies inclusion of bsd.gnome.mk.  See bsd.gnome.mk
#				  or http://www.FreeBSD.org/gnome/docs/porting.html
#				  for more details.
##
# USE_WX			- If set, this port uses the WxWidgets library and related
#				  components.  See bsd.wx.mk for more details.
# USE_KDEBASE_VER
#				- Set to 3 to use the KDE windowing system.
#				  Implies inclusion of bsd.kde.mk.
# USE_KDELIBS_VER
#				- Set to 3 to use the KDE libraries.
#				  Implies inclusion of bsd.kde.mk.
# USE_QT_VER	- Set to 3 to use the QT libraries.
#				  Implies inclusion of bsd.kde.mk.
##
# USE_LINUX		- Set to yes to say the port needs the default linux base port.
#				  Set to value <X>, if the port needs emulators/linux_base-<X>.
#				  If set to "7", a dependency is registered to emulators/linux_base.
#				  Implies appropriate settings for NO_FILTER_SHLIBS,
#				  STRIP and STRIP_CMD.
# USE_LINUX_PREFIX
#				- controls the action of PREFIX (see above). Only use this
#				  if the port is a linux infrastructure port (e.g. contains libs
#				  or a sound server which supports the FreeBSD native one),
#				  use the default or the X11 prefix if it's a leaf port
#				  (e.g. a game or program).
#				  Implies NO_MTREE=yes, and, if INSTALLS_SHLIB is defined:
#				    - USE_LINUX=yes
#				    - appropriate invocation of the Linux ldconfig
# USE_LINUX_RPM	- Set to yes to pull in variables and targets useful to Linux
#				  RPM ports.
#				  Implies inclusion of bsd.linux-rpm.mk.
# AUTOMATIC_PLIST
#				- Set to yes to enable automatic packing list generation.
#				  Currently has no effect unless USE_LINUX_RPM is set.
#
# OVERRIDE_LINUX_BASE_PORT
#				- This specifies the default linux base to use, for valid
#				  values have a look at the description of USE_LINUX. This is
#				  an user-only variable. Don't use it in any port, it's meant
#				  to be used in make.conf.
#
# LINUX_BASE_PORT
#				- This is a read-only variable, it gets set to a value which is
#				  usable in *_DEPENDS (e.g. BUILD_DEPENDS=${LINUX_BASE_PORT}).
#				  It honors USE_LINUX=foo and OVERRIDE_LINUX_BASE_PORT.
# USE_RC_SUBR	- If set, the ports startup/shutdown script uses the common
#				  routines found in etc/rc.subr and may need to
#				  depend on the sysutils/rc_subr port.
#				  If this is set to a list of files, these files will be
#				  automatically added to ${SUB_FILES}, some %%VAR%%'s will
#				  automatically be expanded, they will be installed in
#				  ${TARGETDIR}/etc/rc.d and added to the packing list.
# USE_RCORDER	- List of rc.d startup scripts to be called early in the boot
#				  process. This acts exactly like USE_RC_SUBR except that
#				  scripts are installed in /etc/rc.d.
# RC_SUBR		- Set to path of rc.subr.
#				  Default: ${LOCALBASE}/etc/rc.subr.
##
# USE_APACHE	- If set, this port relies on an apache webserver.
#
# Conflict checking.  Use if your port cannot be installed at the same time as
# another package.
#
# CONFLICTS		- A list of package name patterns that the port conflicts
#				  with, separated by blanks.  The names may include shell
#				  pattern meta-characters "*", "?", "[", "]", and "!".
#				  Example: apache*-1.2* apache*-1.3.[012345] apache-*+ssl_*
#
# Various directory definitions and variables to control them.
# You rarely need to redefine any of these except WRKSRC and NO_WRKSUBDIR.
#
# TARGETDIR		- The fully qualified path, where everything is installed.
#				  See the other variables below.
#				  Default: ${DESTDIR}${PREFIX}
#
# DESTDIR		- The path to the environment we are installing to.  Define
#				  this if you want to install packages into a jail
#				  or into an another FreeBSD environment mounted
#				  elsewhere than /.  ${PREFIX} is relative to
#				  ${DESTDIR}.  E.g. setting DESTDIR=/bla PREFIX=/opt will
#				  result packages installed under /bla/opt and registered
#				  under /bla/var/db/pkg.
#				  Default: not set (means /)
#
# X11BASE		- Where X11 ports install things.
#				  Default: ${DESTDIR}/usr/X11R6
# X11BASE_REL		- Same as X11BASE, but relative to DESTDIR
#				  Default: /usr/X11R6
# LOCALBASE		- Where non-X11 ports install things.
#				  Default: ${DESTDIR}/usr/local
# LOCALBASE_REL		- Same as LOCALBASE, but relative to DESTDIR
#				  Default: /usr/local
# LINUXBASE		- Where Linux ports install things.
#				  Default: ${DESTDIR}/compat/linux
# LINUXBASE_REL		- Same as LINUXBASE, but relative to DESTDIR
#				  Default: /compat/linux
# PREFIX		- Where *this* port installs its files.
#				  Default: ${X11BASE_REL} if USE_X_PREFIX is set,
#				  ${LINUXBASE_REL} if  USE_LINUX_PREFIX is set,
#				  otherwise ${LOCALBASE_REL}
#
# IGNORE_PATH_CHECKS	- There are some sanity checks against PREFIX and DESTDIR.
#				  You can diasble these checks with defining
#				  this variable, but this is not recommended!
#				  Only do this if you really know what you are
#				  doing.  These sanity checks are the following:
#				    - DESTDIR can't be /.  Just leave it undefined
#				      if you want to install to /.
#				    - DESTDIR has to be an absolute path.
#				    - DESTDIR can't have a trailing slash.
#				    - PREFIX has to be an absolute path.
#				    - PREFIX can't have a trailing slash.
#
# MASTERDIR		- Where the port finds patches, package files, etc.  Define
#				  this is you have two or more ports that share most of the
#				  files.
#				  Default: ${.CURDIR}
# PORTSDIR		- The root of the ports tree.
#				  Default: /usr/mports
# DISTDIR		- Where to search for and store copies of original sources
#				  Default: ${PORTSDIR}/Distfiles
# PACKAGES		- A top level directory where all packages go (rather than
#				  going locally to each port).
#				  Default: ${PORTSDIR}/Packages/${ARCH}
# WRKDIRPREFIX	- The place to root the temporary working directory
#				  hierarchy.
#				  Default: none
# WRKDIR		- A temporary working directory that gets *clobbered* on clean
#				  Default: ${WRKDIRPREFIX}${.CURDIR}/work
# WRKSRC		- A subdirectory of ${WRKDIR} where the distribution actually
#				  unpacks to.
#				  Default: ${WRKDIR}/${DISTNAME} unless NO_WRKSUBDIR is set,
#				  in which case simply ${WRKDIR}
# NO_WRKSUBDIR	- Assume port unpacks directly into ${WRKDIR}.
# PATCHDIR		- A directory containing any additional patches you made
#				  to port this software to FreeBSD.
#				  Default: ${MASTERDIR}/files
# SCRIPTDIR		- A directory containing any auxiliary scripts
#				  Default: ${MASTERDIR}/scripts
# FILESDIR		- A directory containing any miscellaneous additional files.
#				  Default: ${MASTERDIR}/files
# PKGDIR		- A directory containing any package creation files.
#				  Default: ${MASTERDIR}
#
#
# MPORT_MAINTAINER_MODE - 	If set, the mports system will perform checks to see if several
#							steps are successfully completed.  Use must install perl with
#							this variable unset before setting it.
#
# The following are used by the fake system.  The fake system installs a dist's files into
# a temporary directory before 
#
# FAKE_OPTS			- Set options for fake.  Available options:
#						libs 		-- fake targets need access to the port's shared libs.
# 						bin  		-- fake targets need the port's binaries in $PATH
#						trueprefix 	-- the dist's makefile correctly honors PREFIX and DESTDIR.
# FAKE_INSTALLDIR	- A relative directory used to by fake. An install is "faked" into
#					  this dir. 
#					  Default: "fake-inst-${ARCH}"
# FAKE_DESTDIR		- The absolute fake directory.  You almost never want to set this,
#					  but it can be useful for target like do-install or post-install
#					  Default: ${WRKDIR}/${FAKE_INSTALLDIR}
# FAKE_MAKEARGS		- Arguments passed to the dist's makefile by the default fake target.
#					  Default: ${DESTDIRNAME}=${FAKE_DESTDIR}                               
# FAKE_TARGET		- When fake runs the dist's makefile, this is the target used.
#					  Default: ${INSTALL_TARGET}
# FAKE_SETUP		- A list of environment variables used to create the fake environment,
#					  suitable for use with env.  This variable should be considered read-
#                     only. It is documented because often it is useful for calling make
#                     in {pre,post}-install.
#
# Variables that serve as convenient "aliases" for your *-install targets.
# Use these like: "${INSTALL_PROGRAM} ${WRKSRC}/prog ${PREFIX}/bin".
#
# INSTALL_PROGRAM
#				- A command to install binary executables.  (By
#				  default, also strips them, unless ${STRIP} is
#				  overridden to be the empty string).
# INSTALL_SCRIPT
#				- A command to install executable scripts.
# INSTALL_DATA	- A command to install sharable data.
# INSTALL_MAN	- A command to install manpages.  May or not compress,
#				  depending on the value of MANCOMPRESSED (see below).
#
# Boolean to control whether manpages are installed.
#
# NO_INSTALL_MANPAGES
#				- If set, this port doesn't want to install any manpages.
#				  Default: not set, i.e. manpages are installed by default.
#
# Set the following to specify all manpages that your port installs.
# These manpages will be automatically listed in ${PLIST}.  Depending
# on the setting of NOMANCOMPRESS, the make rules will compress the
# manpages for you.
#
# MAN<sect>		- A list of manpages, categorized by section.  For
#				  example, if your port has "man/man1/foo.1" and
#				  "man/mann/bar.n", set "MAN1=foo.1" and "MANN=bar.n".
#				  The available sections chars are "123456789LN".
# MLINKS		- A list of <source, target> tuples for creating links
#				  for manpages.  For example, "MLINKS= a.1 b.1 c.3 d.3"
#				  will do an "ln -sf a.1 b.1" and "ln -sf c.3 d.3" in
#				  appropriate directories.  (Use this even if the port
#				  installs its own manpage links so they will show up
#				  correctly in ${PLIST}.)
# MANPREFIX		- The directory prefix for ${MAN<sect>} and ${MLINKS}.
#				  Default: ${TARGETDIR}
# MAN<sect>PREFIX
#				- If manual pages of some sections install in different
#				  locations than others, use these.
#				  Default: ${MANPREFIX}
# MANCOMPRESSED	- This variable can take values "yes", "no" or
#				  "maybe".  "yes" means manpages are installed
#				  compressed; "no" means they are not; "maybe" means
#				  it changes depending on the value of NOMANCOMPRESS.
#				  Default: "yes" if USE_IMAKE is set and NO_INSTALL_MANPAGES
#				  is not set, and "no" otherwise.
#
# Set the following to specify all .info files your port installs.
#
# INFO			- A list of .info files (omitting the trailing ".info");
#				  only one entry per document!
# INFO_PATH		- Path, where all .info files will be installed by your
#				  port, relative to ${PREFIX}
#				  Default: "share/info" if ${PREFIX} is equal to /usr
#				  and "info" otherwise.
#
# Set the following to specify all documentation your port installs into
# ${DOCSDIR}
#
# PORTDOCS		- A list of files and directories relative to DOCSDIR.
#				  Shell glob patterns can be used, directories include
#				  the entire subtree of contained files and directories.
#				  Should not be set when no documentation files are
#				  installed (for example because NOPORTDOCS is defined).
#				  Useful for dynamically generated documentation.
#
# Default targets and their behaviors:
#
# fetch			- Retrieves ${DISTFILES} (and ${PATCHFILES} if defined)
#				  into ${DISTDIR} as necessary.
# fetch-list	- Show list of files that would be retrieved by fetch.
# fetch-recursive
#				- Retrieves ${DISTFILES} (and ${PATCHFILES} if defined),
#				  for port and dependencies into ${DISTDIR} as necessary.
# fetch-recursive-list
#				- Show list of files that would be retrieved by
#				  fetch-recursive.
# fetch-required-list
#				- Show list of files that would be retrieved by
#				  fetch-required.
# fetch-required
#				- Retrieves ${DISTFILES} (and ${PATCHFILES} if defined),
#				  for port and dependencies that are not already installed
#				  into ${DISTDIR}.
# all-depends-list
#				- Show all directories which are dependencies
#				  for this port.
# build-depends-list
#				- Show all directories which are build-dependencies
#				  for this port.
# package-depends-list
#				- Show all directories which are
#				  package-dependencies for this port.
# run-depends-list
#				- Show all directories which are run-dependencies
#				  for this port.
#
# extract		- Unpacks ${DISTFILES} into ${WRKDIR}.
# patch			- Apply any provided patches to the source.
# configure		- Runs either GNU configure, one or more local configure
#				  scripts or nothing, depending on what's available.
# build			- Actually compile the sources.
# install		- Install the results of a build.
# reinstall		- Install the results of a build, ignoring "already installed"
#				  flag.
# deinstall		- Remove the installation.
# deinstall-all	- Remove all installations with the same PKGORIGIN.
# package		- Create a package from an _installed_ port.
# package-recursive
#				- Create a package for a port and _all_ of its dependancies.
# describe		- Try to generate a one-line description for each port for
#				  use in INDEX files and the like.
# checkpatch	- Do a "patch -C" instead of a "patch".  Note that it may
#				  give incorrect results if multiple patches deal with
#				  the same file.
# checksum		- Use distinfo to ensure that your distfiles are valid.
# checksum-recursive
#				- Run checksum in this port and all dependencies.
# makesum		- Generate distinfo (only do this for your own ports!).
# clean			- Remove ${WRKDIR} and other temporary files used for building.
# clean-depends	- Do a "make clean" for all dependencies.
# config		- Configure options for this port (using ${DIALOG}).
#				  Automatically run prior to extract, patch, configure, build,
#				  install, and package.
# config-recursive
#				- Configure options for this port for this port and all dependencies.
# showconfig	- Display options config for this port.
# rmconfig		- Remove the options config for this port.
# rmconfig-recursive
#				- Remove the options config for this port and all dependencies.
#
# Default sequence for "all" is:
#
#     check-sanity fetch checksum extract patch configure build
#
# Please read the comments in the targets section below; you
# should be able to use the pre-* or post-* targets/scripts
# (which are available for every stage except checksum) or
# override the do-* targets to do pretty much anything you want.
#
# NEVER override the "regular" targets unless you want to open
# a major can of worms.
#
# Set these variables if your port doesn't need some of the steps.
# Note that there are no NO_PATCH or NO_CONFIGURE variables because
# those steps are empty by default.  NO_EXTRACT is not allowed anymore
# since we need to at least create ${WRKDIR}.  Also, NO_CHECKSUM is a user
# variable and is not to be set in a port's Makefile.  See above for NO_PACKAGE.
#
# NO_BUILD		- Use a dummy (do-nothing) build target.
# NO_INSTALL	- Use a dummy (do-nothing) install target.
#
# Here are some variables used in various stages.
#
# For options:
# OPTIONS		- List of what WITH_<option> options this port accept.  The
#				  format is <option> "<description>" [on|off]
#				  Example:
#					FLEXRESP "Flexible response to events" off
#				  which tell that an option WITH_FLEXRESP exists for this port,
#				  that by default it is not defined, and that the description to
#				  show to a user in the config dialog is "Flexible response to
#				  events".  If you have more than one option, just chain them
#				  into a single variable.  NOTE: To make options work, you need
#				  to include bsd.port.pre.mk before you start testing the
#				  WITH_xyz variables.
#
# For fetch:
#
# FETCH_CMD		- Full path to ftp/http fetch command if not in $PATH.
#				  Default: "/usr/bin/fetch -ARr"
# FETCH_BEFORE_ARGS
#				- Arguments to ${FETCH_CMD} before filename.
#				  Default: none
# FETCH_AFTER_ARGS
#				- Arguments to ${FETCH_CMD} following filename.
#				  Default: none
# FETCH_ENV		- Environment to pass to ${FETCH_CMD}.
#				  Default: none
# FETCH_REGET	- Times to retry fetching of files on checksum errors.
#				  Default: 1
#
# For extract:
#
# EXTRACT_CMD	- Command for extracting archive: "bzip2" if USE_BZIP2
#				  is set, "unzip" if USE_ZIP is set, "gzip" otherwise.
# EXTRACT_BEFORE_ARGS
#				- Arguments to ${EXTRACT_CMD} before filename.
#				  Default: "-dc"
# EXTRACT_AFTER_ARGS
#				- Arguments to ${EXTRACT_CMD} following filename.
#				  default: "| tar -xf -"
# EXTRACT_PRESERVE_OWNERSHIP
#				- Normally, when run as "root", the extract stage will
#				  change the owner and group of all files under ${WRKDIR}
#				  to 0:0.  Set this variable if you want to turn off this
#				  feature.
#
# For makesum:
#
# NO_SIZE		- Don't record size data in distinfo, needed
#				  when the master site does not report file
#				  sizes, or when multiple valid versions of
#				  a distfile, having different sizes, exist.
#
# For patch:
#
# EXTRA_PATCHES	- Define this variable if you have patches not in
#				  ${PATCHDIR}.  This usually happens when you need to
#				  do some pre-processing before some distribution
#				  patches can be applied.  In that case, fetch them as
#				  extra distfiles, put the processed results in
#				  ${WRKDIR}, then point EXTRA_PATCHES to them.
#				  The patches specified by this variable will be
#				  applied after the normal distribution patches but
#				  before those in ${PATCHDIR}.
# PATCH_WRKSRC	- Directory to apply patches in.
#				  Default: ${WRKSRC}
#
# For configure:
#
# HAS_CONFIGURE	- If set, this port has its own configure script.  The
#				  configure stage will not do anything if this is not set.
# GNU_CONFIGURE	- If set, you are using GNU configure (optional).  Implies
#				  HAS_CONFIGURE.
# PERL_CONFIGURE
#				- Configure using Perl's MakeMaker.  Implies USE_PERL5.
# CONFIGURE_WRKSRC
#				- Directory to run configure in.
#				  Default: ${WRKSRC}
# CONFIGURE_SCRIPT
#				- Name of configure script, relative to ${CONFIGURE_WRKSRC}.
#				  Default: configure
# CONFIGURE_TARGET
#				- The name of target to call when GNU_CONFIGURE is
#				  defined.
#				  Default: ${ARCH}-portbld-freebsd${OSREL}
# CONFIGURE_ARGS
#				- Pass these args to configure if ${HAS_CONFIGURE} is set.
#				  Default: "--prefix=${PREFIX} ${CONFIGURE_TARGET}" if
#				  GNU_CONFIGURE is set, empty otherwise.
# CONFIGURE_ENV	- Pass these env (shell-like) to configure if
#				  ${HAS_CONFIGURE} is set.
# CONFIGURE_LOG	- The name of configure log file. It will be printed to
#				  the screen if configure fails.
#				  Default: config.log
# CONFIGURE_FAIL_MESSAGE
#				- A message displayed to users when configure
#				  fails (note: this assumes the do-configure
#				  target has not been overwritten).  This message
#				  will be passed through /usr/bin/fmt before
#				  being shown to the user.
#
# For build and install:
#
# MAKEFILE		- Name of the makefile.
#				  Default: Makefile
# ALL_TARGET	- Default target for sub-make in build stage.
#				  Default: all
# BUILD_WRKSRC	- Directory to do build in (default: ${WRKSRC}).
# MAKE_ENV		- Additional environment vars passed to sub-make in build
#				  and install stages.
#				  Default: see below
# MAKE_ARGS		- Any extra arguments to sub-make in build and install stages.
#				  Default: none
#
# NO_STACK_PROTECTOR	- If set, Propolice stack protection will be disabled.  Only set
# 			  this if there is no way for the port to work with propolice.
#
#
# For install:
#
# INSTALL_TARGET
#				- Default target for sub-make in install stage.
#				  Default: install
# INSTALL_WRKSRC
#				- Directory to install from
#				  Default: ${WRKSRC}
# NO_MTREE		- If set, will not invoke mtree from bsd.port.mk from
#				  the "install" target.
# MTREE_FILE	- The name of the mtree file.
#				  Default: /etc/mtree/BSD.x11.dist if USE_X_PREFIX is set,
#				  /etc/mtree/BSD.local.dist otherwise.
# PLIST_DIRS	- Directories to be added to packing list
# PLIST_FILES	- Files and symbolic links to be added to packing list
#
# PLIST			- Name of the `packing list' file.
#				  Change this to ${WRKDIR}/PLIST or something if you
#				  need to write to it.  (It is not a good idea for a port
#				  to write to any file outside ${WRKDIR} during a normal
#				  build.)
#				  Default: ${PKGDIR}/pkg-plist
# TMPPLIST		- Name of the `packing list' file after processing
#				  Default: ${WRKDIR}/.PLIST.mktmp
# PLIST_SUB		- List of "variable=value" pair for substitution in ${PLIST}
#				  Default: see below
#
# SUB_FILES		- Files that should be passed through sed and redirected to
#				  ${WRKDIR}.
#				- For each file specified in SUB_FILES, there must be a
#				  corresponding file in ${FILESDIR} whose suffix is ".in". For
#				  instance, if the Makefile specifies "SUB_FILES= pkg-message"
#				  then there must be a file called pkg-message.in in
#				  ${FILESDIR}.
#				- The substitution process is the same as PLIST_FILES, as
#				  described below except that any line beginning with @comment
#				  is deleted.
# SUB_LIST		- List of "variable=value" pair for substitution in ${SUB_FILES}
#				  Some pairs are added by default: eg. PREFIX=${PREFIX}
#
# INSTALLS_SHLIB
#				- If set, bsd.port.mk will automatically run ldconfig commands
#				  from post-install and also add appropriate @exec/@unexec
#				  directives to directories listed in LDCONFIG_DIRS. (deprecated)
#				  If USE_LINUX_PREFIX is defined, the Linux version of ldconfig
#				  will be used instead of the native FreeBSD version (in such
#				  case, LDCONFIG_DIRS is ignored).
# LDCONFIG_DIRS	- List of directories to run ldconfig if INSTALLS_SHLIB is set.
#				  Note that this is passed through sed just like the
#				  rest of PLIST, so ${PLIST_SUB} substitutions also
#				  apply here.  It is recommended that you use
#				  %%PREFIX%% for ${PREFIX}, %%LOCALBASE%% for
#				  ${LOCALBASE_REL} and %%X11BASE%% for ${X11BASE_REL}.
#				  Default: %%PREFIX%%/lib
# USE_LDCONFIG  - If set to "yes", it replaces the old variable INSTALLS_SHLIB.
# 				  Otherwise, it can be set to a list of directories to be added to
# 				  ${PREFIX}/libdata/ldconfig/${UNIQUENAME}. Note that this
# 				  directory is used by ldconfig startup script, it is meant to
# 				  replace ldconfig scripts installed by some ports as (sometimes)
# 				  000.${UNQUENAME}.sh.  If USE_LINUX_PREFIX is defined, then the
#				  Linux version of ldconfig will be used instead (and LDCONFIG_DIRS
#				  is ignored).				
# USE_LDCONFIG32
# 				- Same as USE_LDCONFIG but the target file is
# 				  ${PREFIX}/libdata/ldconfig32/${UNIQUENAME} instead.
# 				  Note: that should only be used on 64-bit architectures.
#
# DOCSDIR		- Name of the directory to install the packages docs in.
#				  Default: ${TARGETDIR}/share/doc/${PORTNAME}
# EXAMPLESDIR	- Name of the directory to install the packages examples in.
#				  Default: ${TARGETDIR}/share/examples/${PORTNAME}
# DATADIR		- Name of the directory to install the packages shared data in.
#				  Default: ${TARGETDIR}/share/${PORTNAME}
#
# DESKTOPDIR	- Name of the directory to install ${DESKTOP_ENTRIES} in.
#				  Default: ${TARGETDIR}/share/applications
# DESKTOP_ENTRIES
#				- List of desktop entry files to generate and install in
#				  ${DESKTOPDIR}. The format is
#				  "Name" "Comment" "Icon" "Exec" "Categories" StartupNotify
#				  Rules:
#					* Only add desktop entries for applications which do not
#					  require a terminal (ie. X applications).
#					* If the upstream distribution already installs .desktop
#					  files, you do not need to use this.
#					* If you require a more elaborate .desktop file than this
#					  variable permits, write it yourself and install it
#					  in ${DESKTOPDIR}.
#				  Notes:
#					* Comment and Icon may be empty strings (""). Categories
#					  may be an empty string in some cases (see below). The
#					  other fields are mandatory.
#					* If Categories is an empty string, bsd.port.mk will try
#					  to deduce a default value using the CATEGORIES variable.
#					  If the deduction fails, you will have to set Categories
#					  manually. You should check the generated value using
#					  "make desktop-categories", and override it if necessary.
#					* Exec will also be used to name the .desktop file.
#					* The files will be automatically added to ${PLIST}.
#				  Example:
#					"X Window Information" \
#					"Get information about X windows" \
#					"wininfo.png" \
#					"wininfo" \
#					"Application;System;" \
#					true
#				  See http://standards.freedesktop.org/desktop-entry-spec/desktop-entry-spec-latest.html
#				  for an explanation of the fields. If you need to create more
#				  than one file, just chain them into a single variable.
#
# Note that the install target will automatically add manpages (see
# above) and also substitute special sequences of characters (delimited
# by "%%") as defined in PLIST_SUB to generate ${TMPPLIST}.  For
# instance, "OSREL=${OSREL}" in PLIST_SUB causes all occurrences of
# "%%OSREL%%" in ${PLIST} to be substituted by the value of OSREL.
# ${TMPPLIST} is generated before the do-install stage.  If you are
# generating the packing list on-the-fly, make sure it's generated before
# do-install is called!
#
# For package:
#
# NO_LATEST_LINK
#				- Do not install the "Latest" link for package.  Define this
#				  if this port is a beta version of another stable port
#				  which is also in the tree.
# LATEST_LINK	- Install the "Latest" link for the package as ___.  Define
#				  this if the "Latest" link name will be incorrectly determined.
#
# This is used in all stages:
#
# SCRIPTS_ENV	- Additional environment vars passed to scripts in
#				  ${SCRIPTDIR} executed by bsd.port.mk.
#				  Default: see below
#
# Finally, variables to change if you want a special behavior.  These
# are for debugging purposes.  Don't set them in your Makefile.
#
# ECHO_MSG		- Used to print all the '===>' style prompts - override this
#				  to turn them off.
#				  Default: ${ECHO_CMD}
# PATCH_DEBUG	- If set, print out more information about the patches as
#				  it attempts to apply them.
# PKG_DBDIR		- Where package installation is recorded; this directory
#				  must not contain anything else.
#				  Default: ${DESTDIR}/var/db/pkg
# PORT_DBDIR	- Where port configuration options are recorded.
#				  Default: ${DESTDIR}/var/db/ports
# NO_PKG_REGISTER
#				- Don't register a port installation as a package.
# FORCE_PKG_REGISTER
#				- If set, it will overwrite any existing package
#				  registration information in ${PKG_DBDIR}/${PKGNAME}.
# NO_DEPENDS	- Don't verify build of dependencies.
# CHECKSUM_ALGORITHMS
#				- Different checksum algorithms to check for verifying the
#				  integrity of the distfiles. The absence of the algorithm
#				  in distinfo doesn't make it fail. 
#				  Default: md5 sha256
# NO_CHECKSUM	- Don't verify the checksum.  Typically used when
#				  when you noticed the distfile you just fetched has
#				  a different checksum and you intend to verify if
#				  the port still works with it.
# USE_PACKAGE_DEPENDS
#				- Install dependencies from existing packages instead
#				  of building the port from scratch.
# INSTALL_AS_USER
#				- Define this to install as the current user, intended
#				  for systems where you have no root access.
# DISABLE_SIZE	- Do not check the size of a distfile even if the SIZE field
#				  has been specified in distinfo.  This is useful
#				  when using an alternate FETCH_CMD.
#
# End of the list of all variables that need to be defined in a port.
# Most port authors should not need to understand anything after this point.
#

# Look for ${WRKSRC}/.../*.orig files, and (re-)create
# ${FILEDIR}/patch-* files from them.

.if !target(makepatch)
makepatch:
	@cd ${.CURDIR} && ${MKDIR} ${FILESDIR}
	@(cd ${WRKSRC}; \
		for i in `find . -type f -name '*.orig'`; do \
			ORG=$$i; \
			NEW=$${i%.orig}; \
			OUT=${FILESDIR}`${ECHO} $${NEW} | \
				${SED} -e 's|/|__|g' \
					-e 's|^\.__|/patch-|'`; \
			${ECHO} ${DIFF} -ud $${ORG} $${NEW} '>' $${OUT}; \
			${DIFF} -ud $${ORG} $${NEW} > $${OUT} || ${TRUE}; \
		done \
	)
.endif




# Start of pre-makefile section.
.if !defined(AFTERPORTMK)

.if defined(_PREMKINCLUDED)
check-makefile::
	@${ECHO_MSG} "${PKGNAME}: Makefile error: you cannot include bsd.port[.pre].mk twice"
	@${FALSE}
.endif

_PREMKINCLUDED=	yes

.if defined(MAKE_VERSION)
.if ${MAKE_VERSION} >= 5200408030 || ${MAKE_VERSION} >= 4200408030 && ${MAKE_VERSION} < 5000000000
NOPRECIOUSSOFTMAKEVARS= yes
.endif
.endif

_MAKE_CMD=	/usr/bin/make

AWK?=		/usr/bin/awk
BASENAME?=	/usr/bin/basename
BRANDELF?=	/usr/bin/brandelf
BZCAT?=		/usr/bin/bzcat
BZIP2_CMD?=	/usr/bin/bzip2
CAT?=		/bin/cat
CHGRP?=		/usr/bin/chgrp
CHMOD?=		/bin/chmod
CHOWN?=		/usr/sbin/chown
CHROOT?=	/usr/sbin/chroot
COMM?=		/usr/bin/comm
CP?=		/bin/cp
CPIO?=		${LOCALBASE}/bin/gcpio
CUT?=		/usr/bin/cut
DC?=		/usr/bin/dc
DIALOG?=	/usr/bin/dialog
DIFF?=		/usr/bin/diff
DIRNAME?=	/usr/bin/dirname
EGREP?=		/usr/bin/egrep
EXPR?=		/bin/expr
FALSE?=		false				# Shell builtin
FILE?=		/usr/bin/file
FIND?=		/usr/bin/find
FMT?=		/usr/bin/fmt
GREP?=		/usr/bin/grep
GUNZIP_CMD?=	/usr/bin/gunzip -f
GZCAT?=		/usr/bin/gzcat
GZIP?=		-9
GZIP_CMD?=	/usr/bin/gzip -nf ${GZIP}
HEAD?=		/usr/bin/head
ID?=		/usr/bin/id
IDENT?=		/usr/bin/ident
LDCONFIG?=	/sbin/ldconfig
LN?=		/bin/ln
LS?=		/bin/ls
MKDIR?=		/bin/mkdir -p
MKTEMP?=	/usr/bin/mktemp
MV?=		/bin/mv
OBJCOPY?=	/usr/bin/objcopy
OBJDUMP?=	/usr/bin/objdump
PASTE?=		/usr/bin/paste
PAX?=		/bin/pax
PRINTF?=	/usr/bin/printf
REALPATH?=	/bin/realpath
RM?=		/bin/rm
RMDIR?=		/bin/rmdir
SED?=		/usr/bin/sed
SETENV?=	/usr/bin/env
SH?=		/bin/sh
SORT?=		/usr/bin/sort
STRIP_CMD?=	/usr/bin/strip
SU_CMD?=	/usr/bin/su root -c
SYSCTL?=	/sbin/sysctl
TAIL?=		/usr/bin/tail
TEST?=		test				# Shell builtin
TR?=		LANG=C /usr/bin/tr
TRUE?=		true				# Shell builtin
UNAME?=		/usr/bin/uname
UNZIP_CMD?=	${LOCALBASE}/bin/unzip
WHICH?=		/usr/bin/which
XARGS?=		/usr/bin/xargs
YACC?=		/usr/bin/yacc

# ECHO is defined in /usr/share/mk/sys.mk, which can either be "echo",
# or "true" if the make flag -s is given.  Use ECHO_CMD where you mean
# the echo command.
ECHO_CMD?=	echo				# Shell builtin

# Used to print all the '===>' style prompts - override this to turn them off.
ECHO_MSG?=		${ECHO_CMD}

# Get the default maintainer
MAINTAINER?=	ports@MidnightBSD.org

# Get the architecture
.if !defined(ARCH)
ARCH!=	${UNAME} -p
.endif

# Kludge for pre-3.0 systems
MACHINE_ARCH?=	i386

# Get the operating system type
.if !defined(OPSYS)
OPSYS!=	${UNAME} -s
.endif

# Get the operating system revision
.if !defined(OSREL)
OSREL!=	${UNAME} -r | ${SED} -e 's/[-(].*//'
.endif

# Get __FreeBSD_version
.if !defined(OSVERSION)
.if exists(${DESTDIR}/usr/include/sys/param.h)
OSVERSION!=	${AWK} '/^\#define __FreeBSD_version/ {print $$3}' < ${DESTDIR}/usr/include/sys/param.h
.elif exists(${DESTDIR}/usr/src/sys/sys/param.h)
OSVERSION!=	${AWK} '/^\#define __FreeBSD_version/ {print $$3}' < ${DESTDIR}/usr/src/sys/sys/param.h
.else
OSVERSION!=	${SYSCTL} -n kern.osreldate
.endif
.endif

# Get the object format.
.if !defined(PORTOBJFORMAT)
PORTOBJFORMAT!=		${TEST} -x /usr/bin/objformat && /usr/bin/objformat || ${ECHO_CMD} aout
.endif

MASTERDIR?=	${.CURDIR}

.if ${MASTERDIR} != ${.CURDIR}
SLAVE_PORT?=	yes
MASTER_PORT?=${MASTERDIR:C/[^\/]+\/\.\.\///:C/[^\/]+\/\.\.\///:C/^.*\/([^\/]+\/[^\/]+)$/\\1/}
.else
SLAVE_PORT?=	no
MASTER_PORT?=
.endif

# Check the compatibility layer for amd64/ia64

.if ${ARCH} == "amd64" || ${ARCH} =="ia64"
.if exists(/usr/lib32)
HAVE_COMPAT_IA32_LIBS?=  YES
.endif
.if !defined(HAVE_COMPAT_IA32_KERN)
HAVE_COMPAT_IA32_KERN!= if ${SYSCTL} -a compat.ia32.maxvmem >/dev/null 2>&1; then echo YES; fi
.endif
.endif

.if defined(IA32_BINARY_PORT) && ${ARCH} != "i386"
.if ${ARCH} == "amd64" || ${ARCH} == "ia64"
.if !defined(HAVE_COMPAT_IA32_KERN)
IGNORE= you need a kernel with compiled-in IA32 compatibility to use this port.
.elif !defined(HAVE_COMPAT_IA32_LIBS)
IGNORE= you need the 32-bit libraries installed under /usr/lib32 to use this port.
.endif
.else
IGNORE= you have to use i386 (or compatible) platform to use this port.
.endif
.endif

# If they exist, include Makefile.inc, then architecture/operating
# system specific Makefiles, then local Makefile.local.

.if ${MASTERDIR} != ${.CURDIR} && exists(${.CURDIR}/../Makefile.inc)
.include "${.CURDIR}/../Makefile.inc"
USE_SUBMAKE=	yes
.endif

.if exists(${MASTERDIR}/../Makefile.inc)
.include "${MASTERDIR}/../Makefile.inc"
USE_SUBMAKE=	yes
.endif

.if exists(${MASTERDIR}/Makefile.${ARCH}-${OPSYS})
.include "${MASTERDIR}/Makefile.${ARCH}-${OPSYS}"
USE_SUBMAKE=	yes
.elif exists(${MASTERDIR}/Makefile.${OPSYS})
.include "${MASTERDIR}/Makefile.${OPSYS}"
USE_SUBMAKE=	yes
.elif exists(${MASTERDIR}/Makefile.${ARCH})
.include "${MASTERDIR}/Makefile.${ARCH}"
USE_SUBMAKE=	yes
.endif

.if exists(${MASTERDIR}/Makefile.local)
.include "${MASTERDIR}/Makefile.local"
USE_SUBMAKE=	yes
.endif

# where 'make config' records user configuration options
PORT_DBDIR?=	${DESTDIR}/var/db/ports

LDCONFIG_DIR=	libdata/ldconfig
LDCONFIG32_DIR=	libdata/ldconfig32



.if defined(LATEST_LINK)
UNIQUENAME?=	${LATEST_LINK}
.else
UNIQUENAME?=	${PKGNAMEPREFIX}${PORTNAME}
.endif
OPTIONSFILE?=	${PORT_DBDIR}/${UNIQUENAME}/options
_OPTIONSFILE!=	${ECHO_CMD} "${OPTIONSFILE}"
.if defined(OPTIONS)
.	if defined(PACKAGE_BUILDING) || (defined(BATCH) && !exists(${_OPTIONSFILE}))
WITHOUT:=
WITH:=
.	if defined(OPTIONS)
REALOPTIONS=${OPTIONS:C/".*"//g}
.	for O in ${REALOPTIONS}
RO:=${O}
.	if ${RO:L} == off
WITHOUT:=	${WITHOUT} ${OPT}
.	endif
.	if ${RO:L} == on
WITH:=		${WITH} ${OPT}
.	endif
OPT:=${RO}
.	endfor
.	endif
.	for W in ${WITH}
WITH_${W}:=	true
.	endfor
.	for W in ${WITHOUT}
WITHOUT_${W}:=	true
.	endfor
.	undef WITH
.	undef WITHOUT
.	undef RO
.	undef REALOPTIONS
.	endif
.	if exists(${_OPTIONSFILE}) && !make(rmconfig)
.	include "${_OPTIONSFILE}"
.	endif
.	if exists(${_OPTIONSFILE}.local)
.	include "${_OPTIONSFILE}.local"
.	endif
.endif

# check for old, crufty, makefile types, part 1:
.if !defined(PORTNAME) || !( defined(PORTVERSION) || defined (DISTVERSION) ) || defined(PKGNAME)
check-makefile::
	@${ECHO_MSG} "Makefile error: you need to define PORTNAME and PORTVERSION instead of PKGNAME."
	@${ECHO_MSG} "(This port is too old for your bsd.port.mk, please update it to match"
	@${ECHO_MSG} " your bsd.port.mk.)"
	@${FALSE}
.endif

.if defined(PORTVERSION)
.if ${PORTVERSION:M*[-_,]*}x != x
IGNORE=			PORTVERSION ${PORTVERSION} may not contain '-' '_' or ','
.endif
DISTVERSION?=	${PORTVERSION:S/:/::/g}
.elif defined(DISTVERSION)
PORTVERSION=	${DISTVERSION:L:C/([a-z])[a-z]+/\1/g:C/([0-9])([a-z])/\1.\2/g:C/:(.)/\1/g:C/[^a-z0-9+]+/./g}
.endif

PORTREVISION?=	0
.if ${PORTREVISION} != 0
_SUF1=	_${PORTREVISION}
.endif

PORTEPOCH?=		0
.if ${PORTEPOCH} != 0
_SUF2=	,${PORTEPOCH}
.endif

# check for old, crufty, makefile types, part 2.  The "else" case
# should have been handled in part 1, above.
.if !defined(PKGVERSION)
PKGVERSION=	${PORTVERSION:C/[-_,]/./g}${_SUF1}${_SUF2}
.endif
.if !defined(PKGNAME)
PKGNAME=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}-${PKGVERSION}
.endif
DISTNAME?=	${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION:C/:(.)/\1/g}${DISTVERSIONSUFFIX}

# These need to be absolute since we don't know how deep in the ports
# tree we are and thus can't go relative.  They can, of course, be overridden
# by individual Makefiles or local system make configuration.
PORTSDIR?=		/usr/mports
LOCALBASE?=		/usr/local
X11BASE?=		/usr/X11R6
LINUXBASE?=		/compat/linux
LOCALBASE_REL:=		${LOCALBASE}
X11BASE_REL:=		${X11BASE}
LINUXBASE_REL:=		${LINUXBASE}
LOCALBASE:=		${DESTDIR}${LOCALBASE_REL}
X11BASE:=		${DESTDIR}${X11BASE_REL}
LINUXBASE:=		${DESTDIR}${LINUXBASE_REL}
DISTDIR?=		${PORTSDIR}/Distfiles
_DISTDIR?=		${DISTDIR}/${DIST_SUBDIR}
INDEXDIR?=		${PORTSDIR}
# XXX Can we just call it 'INDEX' ?
INDEXFILE?=		INDEX-${OSVERSION:C/([0-9]).*/\1/}

TARGETDIR:=		${DESTDIR}${PREFIX}

.if defined(USE_LINUX_RPM)
.include "${PORTSDIR}/Mk/bsd.linux-rpm.mk"
.endif

.if defined(USE_GCPIO)
EXTRACT_DEPENDS+=       gcpio:${PORTSDIR}/archivers/gcpio
.endif

.if defined(USE_BZIP2)
EXTRACT_SUFX?=			.tar.bz2
.elif defined(USE_ZIP)
EXTRACT_SUFX?=			.zip
.else
EXTRACT_SUFX?=			.tar.gz
.endif
PACKAGES?=		${PORTSDIR}/Packages/${ARCH}
TEMPLATES?=		${PORTSDIR}/Templates

.if (!defined(PKGDIR) && exists(${MASTERDIR}/pkg/DESCR)) || \
	(!defined(MD5_FILE) && exists(${MASTERDIR}/files/md5))
check-makefile::
	@${ECHO_MSG} "Makefile error: your port uses an old layout.  Please update it to match this bsd.port.mk.  If you have updated your ports collection via cvsup and are still getting this error, see Q12 and Q13 in the cvsup FAQ on http://www.polstra.com for further information."
	@${FALSE}
.endif
PATCHDIR?=		${MASTERDIR}/files
FILESDIR?=		${MASTERDIR}/files
SCRIPTDIR?=		${MASTERDIR}/scripts
PKGDIR?=		${MASTERDIR}


# Set up PREFIX.
.if defined(USE_X_PREFIX) && ${USE_X_PREFIX} == "no"
.undef USE_X_PREFIX
.endif

.if defined(USE_X_PREFIX) || defined(USE_IMAKE)
PREFIX?=	${X11BASE_REL}
.elif defined(USE_LINUX_PREFIX)
PREFIX?=	${LINUXBASE_REL}
.else
PREFIX?=	${LOCALBASE_REL}
.endif

# Fake targets override this when they submake.
TRUE_PREFIX?=		${PREFIX} 


.if defined(USE_LINUX_PREFIX)
_LINUX_LDCONFIG=			${LINUXBASE_REL}/sbin/ldconfig -r ${LINUXBASE_REL}
LDCONFIG_PLIST_EXEC_CMD?=	${_LINUX_LDCONFIG}
LDCONFIG_PLIST_UNEXEC_CMD?=	${_LINUX_LDCONFIG}
.else
LDCONFIG_PLIST_EXEC_CMD?=	${LDCONFIG} -m ${USE_LDCONFIG:S|${PREFIX}|%D|g}
LDCONFIG_PLIST_UNEXEC_CMD?=	${LDCONFIG} -R
.endif

PKGCOMPATDIR?=		${LOCALBASE}/lib/compat/pkg


.if defined(USE_LOCAL_MK)
.include "${PORTSDIR}/Mk/bsd.local.mk"
.endif

.if defined(USE_PERL5) || defined(PERL_CONFIGURE) || defined(PERL_MODBUILD) || defined(USE_PERL5_BUILD) || defined(USE_PERL5_RUN)
.include "${PORTSDIR}/Mk/bsd.perl.mk"
.endif

.if defined(USE_OPENSSL)
.include "${PORTSDIR}/Mk/bsd.openssl.mk"
.endif

.if defined(USE_EMACS)
.include "${PORTSDIR}/Mk/bsd.emacs.mk"
.endif

.if defined(USE_GNUSTEP)
.include "${PORTSDIR}/Mk/bsd.gnustep.mk"
.endif

.if defined(USE_PHP)
.include "${PORTSDIR}/Mk/bsd.php.mk"
.endif

.if defined(USE_PYTHON) || defined(USE_PYTHON_BUILD) || defined(USE_PYTHON_RUN)
.include "${PORTSDIR}/Mk/bsd.python.mk"
.endif

.if defined(USE_JAVA)
.include "${PORTSDIR}/Mk/bsd.java.mk"
.endif

.if defined(USE_RUBY) || defined(USE_LIBRUBY)
.include "${PORTSDIR}/Mk/bsd.ruby.mk"
.endif

.if defined(USE_TCL) || defined(USE_TCL_BUILD) || defined(USE_TK)
.include "${PORTSDIR}/Mk/bsd.tcl.mk"
.endif

.if defined(USE_APACHE) || defined(APACHE_COMPAT)
.include "${PORTSDIR}/Mk/bsd.apache.mk"
.endif

.if defined(USE_QT_VER) || defined(USE_KDELIBS_VER) || defined(USE_KDEBASE_VER)
.include "${PORTSDIR}/Mk/bsd.kde.mk"
.endif

.if defined(WANT_GNOME) || defined(USE_GNOME) || defined(USE_GTK)
.include "${PORTSDIR}/Mk/bsd.gnome.mk"
.endif

.if defined(WANT_LUA) || defined(USE_LUA) || defined(USE_LUA_NOT)
.include "${PORTSDIR}/Mk/bsd.lua.mk"
.endif

.if defined(WANT_WX) || defined(USE_WX) || defined(USE_WX_NOT)
.include "${PORTSDIR}/Mk/bsd.wx.mk"
.endif

.if defined(WANT_GSTREAMER) || defined(USE_GSTREAMER) || defined(USE_GSTREAMER80)
.include "${PORTSDIR}/Mk/bsd.gstreamer.mk"
.endif

.if defined(USE_QMAIL) || defined(USE_QMAIL_RUN) || defined(USE_QMAIL_BUILD) || defined(WANT_QMAIL)
.include "${PORTSDIR}/Mk/bsd.mail.mk"
.endif

.if defined(USE_SDL) || defined(WANT_SDL)
.include "${PORTSDIR}/Mk/bsd.sdl.mk"
.endif

# These do some path checks if DESTDIR is set correctly.
# You can force skipping these test by defining IGNORE_PATH_CHECKS
.if !defined(IGNORE_PATH_CHECKS)
.if (${PREFIX:C,(^.).*,\1,} != "/")
.BEGIN:
	@${ECHO_MSG} "PREFIX must be defined as an absolute path so that when 'make'"
	@${ECHO_MSG} "is invoked in the work area PREFIX points to the right place."
	@${FALSE}
.endif
.if defined(DESTDIR)
.if (${DESTDIR:C,(^.).*,\1,} != "/")
.if ${DESTDIR} == "/"
.BEGIN:
	@${ECHO_MSG} "You can't set DESTDIR to /. Please re-run make with"
	@${ECHO_MSG} "DESTDIR unset."
	@${FALSE}
.else
.BEGIN:
	@${ECHO_MSG} "DESTDIR must be defined as an absolute path so that when 'make'"
	@${ECHO_MSG} "is invoked in the work area DESTDIR points to the right place."
	@${FALSE}
.endif
.endif
.if (${DESTDIR:C,^.*(/)$$,\1,} == "/")
.BEGIN:
	@${ECHO_MSG} "DESTDIR can't have a trailing slash. Please remove the trailing"
	@${ECHO_MSG} "slash and re-run 'make'"
	@${FALSE}
.endif
.endif
.endif

# We only support xorg.
X_WINDOW_SYSTEM ?= xorg

################
#
# Fake Setup 
#
# Tmp dir used for building a package.
FAKE_INSTALLDIR?=	fake-inst-${ARCH}
FAKE_TARGET?=		${INSTALL_TARGET}
DESTDIRNAME?=   	DESTDIR
FAKE_DESTDIR?= 		${WRKDIR}/${FAKE_INSTALLDIR}
FAKE_MAKEARGS?=		${MAKE_ARGS} ${DESTDIRNAME}=${FAKE_DESTDIR}

FAKE_SETUP=		TRUE_PREFIX=${TRUE_PREFIX} PREFIX=${FAKE_DESTDIR}${TRUE_PREFIX} \
				LINUXBASE=${FAKE_DESTDIR}${LINUXBASE:S/^${FAKE_DESTDIR}//} \
				HOME=/${PORTNAME}_installs_to_home \
				KMODDIR=${FAKE_DESTDIR}${KMODDIR:S/^${FAKE_DESTDIR}//}

.if defined(FAKE_OPTS)
.if ${FAKE_OPTS:Mtrueprefix}x != "x" 
# do this to FAKE_MAKEARGS so that post-install,pre-install still get a twiddled ${PREFIX}
FAKE_MAKEARGS+=	PREFIX=${TRUE_PREFIX}
.endif
.if ${FAKE_OPTS:Mlibs}x != "x"
FAKE_SETUP+=	LD_LIBRARY_PATH=${FAKE_DESTDIR}${PREFIX}/lib
.endif
.if ${FAKE_OPTS:Mbin}x != "x"
FAKE_SETUP+=	PATH=${PATH}:${FAKE_DESTDIR}${PREFIX}/bin:${FAKE_DESTDIR}${PREFIX}/sbin
.endif
.endif

# Location of mounted CDROM(s) to search for files
CD_MOUNTPTS?=	/cdrom ${CD_MOUNTPT}

WANT_OPENLDAP_VER?=	23

# Owner and group of the WWW user
WWWOWN?=	www
WWWGRP?=	www

.endif
# End of pre-makefile section.

# Start of post-makefile section.
.if !defined(BEFOREPORTMK)

.if defined(_POSTMKINCLUDED)
check-makefile::
	@${ECHO_MSG} "${PKGNAME}: Makefile error: you cannot include bsd.port[.post].mk twice"
	@${FALSE}
.endif

_POSTMKINCLUDED=	yes

WRKDIR?=		${WRKDIRPREFIX}${.CURDIR}/work
.if defined(NO_WRKSUBDIR)
WRKSRC?=		${WRKDIR}
.else
WRKSRC?=		${WRKDIR}/${DISTNAME}
.endif

PATCH_WRKSRC?=	${WRKSRC}
CONFIGURE_WRKSRC?=	${WRKSRC}
BUILD_WRKSRC?=	${WRKSRC}
INSTALL_WRKSRC?=${WRKSRC}

PLIST_SUB+=	OSREL=${OSREL} PREFIX=%D LOCALBASE=${LOCALBASE_REL} X11BASE=${X11BASE_REL} \
		DESTDIR=${DESTDIR} TARGETDIR=${TARGETDIR}
SUB_LIST+=	PREFIX=${PREFIX} LOCALBASE=${LOCALBASE_REL} X11BASE=${X11BASE_REL} \
		DATADIR=${DATADIR} DOCSDIR=${DOCSDIR} EXAMPLESDIR=${EXAMPLESDIR} \
		DESTDIR=${DESTDIR} TARGETDIR=${TARGETDIR}


.if defined(WITHOUT_CPU_CFLAGS)
.if defined(_CPUCFLAGS)
.if !empty(_CPUCFLAGS)
CFLAGS:=	${CFLAGS:C/${_CPUCFLAGS}//}
.endif
.endif
.endif

.if defined(NO_STACK_PROTECTOR)
CFLAGS+=	-fno-stack-protector
.endif

.if defined(WITH_DEBUG) && ${WITH_DEBUG} != "no"
.undef STRIP
DEBUG_FLAGS?=	-g
CFLAGS+=	${DEBUG_FLAGS}
.endif
.if defined(NOPORTDOCS)
PLIST_SUB+=	        PORTDOCS="@comment "
.else
PLIST_SUB+=	        PORTDOCS=""
.endif

CONFIGURE_SHELL?=	${SH}
MAKE_SHELL?=	${SH}

CONFIGURE_ENV+=	SHELL=${SH} CONFIG_SHELL=${SH} PORTOBJFORMAT=${PORTOBJFORMAT}
SCRIPTS_ENV+=	PORTOBJFORMAT=${PORTOBJFORMAT}
MAKE_ENV+=		SHELL=${SH} PORTOBJFORMAT=${PORTOBJFORMAT} NO_LINT=YES
PLIST_SUB+=		PORTOBJFORMAT=${PORTOBJFORMAT}



.if defined(MANCOMPRESSED)
.if ${MANCOMPRESSED} != yes && ${MANCOMPRESSED} != no && \
	${MANCOMPRESSED} != maybe
check-makevars::
	@${ECHO_MSG} "${PKGNAME}: Makefile error: value of MANCOMPRESSED (is \"${MANCOMPRESSED}\") can only be \"yes\", \"no\" or \"maybe\"".
	@${FALSE}
.endif
.endif

.if defined(USE_IMAKE) && !defined(NO_INSTALL_MANPAGES)
MANCOMPRESSED?=	yes
.else
MANCOMPRESSED?=	no
.endif

.if defined(PATCHFILES)
.if ${PATCHFILES:M*.zip}x != x
PATCH_DEPENDS+=		unzip:${PORTSDIR}/archivers/unzip
.endif
.endif

.if defined(USE_ZIP)
EXTRACT_DEPENDS+=	unzip:${PORTSDIR}/archivers/unzip
.endif
.if defined(USE_GMAKE)
BUILD_DEPENDS+=		gmake:${PORTSDIR}/devel/gmake
CONFIGURE_ENV+=		MAKE=${GMAKE}
_MAKE_CMD=		${GMAKE}
.endif

.if defined(USE_GCC)
.include "${PORTSDIR}/Mk/bsd.gcc.mk"
.endif

.if defined(USE_OPENLDAP_VER)
USE_OPENLDAP?=		yes
WANT_OPENLDAP_VER=	${USE_OPENLDAP_VER}
.endif

.if defined(USE_OPENLDAP)
.if defined(WANT_OPENLDAP_SASL)
_OPENLDAP_FLAVOUR=	-sasl
.else
_OPENLDAP_FLAVOUR=
.endif
.if ${WANT_OPENLDAP_VER} == 22
LIB_DEPENDS+=		ldap-2.2.7:${PORTSDIR}/net/openldap22${_OPENLDAP_FLAVOUR}-client
.elif ${WANT_OPENLDAP_VER} == 23
LIB_DEPENDS+=		ldap-2.3.2:${PORTSDIR}/net/openldap23${_OPENLDAP_FLAVOUR}-client
.elif ${WANT_OPENLDAP_VER} == 24
LIB_DEPENDS+=		ldap-2.4.1:${PORTSDIR}/net/openldap24${_OPENLDAP_FLAVOUR}-client
.else
IGNORE=				unknown OpenLDAP version: ${WANT_OPENLDAP_VER}
.endif
.endif

.if defined(USE_FAM)
DEFAULT_FAM_SYSTEM=	gamin
# Currently supported FAM systems
FAM_SYSTEM_FAM=		fam.0:${PORTSDIR}/devel/fam
FAM_SYSTEM_GAMIN=	fam.0:${PORTSDIR}/devel/gamin

.if exists(${LOCALBASE}/libexec/gam_server)
_HAVE_FAM_SYSTEM=	gamin
.elif exists(${LOCALBASE}/bin/fam)
_HAVE_FAM_SYSTEM=	fam
.endif

.if defined(WANT_FAM_SYSTEM)
.if defined(WITH_FAM_SYSTEM) && ${WITH_FAM_SYSTEM}!=${WANT_FAM_SYSTEM}
IGNORE=	The port wants to use ${WANT_FAM_SYSTEM} as its FAM system and you wish to use ${WITH_FAM_SYSTEM}
.endif
FAM_SYSTEM=	${WANT_FAM_SYSTEM}
.elif defined(WITH_FAM_SYSTEM)
FAM_SYSTEM=	${WITH_FAM_SYSTEM}
.else
.if defined(_HAVE_FAM_SYSTEM)
FAM_SYSTEM=	${_HAVE_FAM_SYSTEM}
.else
FAM_SYSTEM=	${DEFAULT_FAM_SYSTEM}
.endif
.endif # WANT_FAM_SYSTEM

.if defined(_HAVE_FAM_SYSTEM)
.if ${_HAVE_FAM_SYSTEM}!= ${FAM_SYSTEM}
BROKEN=	FAM system mismatch: ${_HAVE_FAM_SYSTEM} is installed and desired FAM system is ${FAM_SYSTEM}
.endif
.endif

.if defined(FAM_SYSTEM_${FAM_SYSTEM:U})
LIB_DEPENDS+=	${FAM_SYSTEM_${FAM_SYSTEM:U}}
.else
IGNORE=			unknown FAM system: ${FAM_SYSTEM}
.endif
.endif # USE_FAM


.if defined(USE_RC_SUBR) || defined(USE_RCORDER)
RC_SUBR=	/etc/rc.subr
SUB_LIST+=	RC_SUBR=${RC_SUBR}
.if defined(USE_RC_SUBR) && ${USE_RC_SUBR:U} != "YES"
SUB_FILES+=	${USE_RC_SUBR}
.endif
.if defined(USE_RCORDER)
SUB_FILES+=	${USE_RCORDER}
.endif
.endif

.if defined(USE_LDCONFIG) && ${USE_LDCONFIG:L} == "yes"
USE_LDCONFIG=	${PREFIX}/lib
.endif

.if defined(USE_LDCONFIG32) && ${USE_LDCONFIG32:L} == "yes"
IGNORE=			has USE_LDCONFIG32 set to yes, which is not correct
.endif

.if defined(USE_ICONV)
LIB_DEPENDS+=	iconv.3:${PORTSDIR}/converters/libiconv
.endif

.if defined(USE_GETTEXT)
.	if ${USE_GETTEXT:L} == "yes"
LIB_DEPENDS+=	intl:${PORTSDIR}/devel/gettext
.	else
LIB_DEPENDS+=	intl.${USE_GETTEXT}:${PORTSDIR}/devel/gettext
.	endif
.endif

.if defined(USE_LINUX_PREFIX) && defined(INSTALLS_SHLIB)
# we need ${LINUXBASE}/sbin/ldconfig
USE_LINUX?=	yes
.endif

.if defined(USE_LINUX)

# install(1) also does a brandelf on strip, so don't strip with FreeBSD tools.
STRIP=
.	if exists(${LINUXBASE}/usr/bin/strip)
STRIP_CMD=	${LINUXBASE}/usr/bin/strip
.	else
STRIP_CMD=	${TRUE}
.	endif

NO_FILTER_SHLIBS=	yes

# Allow the user to specify another linux_base version.
.	if defined(OVERRIDE_LINUX_BASE_PORT)
.		if ${USE_LINUX:L} == yes
USE_LINUX=	${OVERRIDE_LINUX_BASE_PORT}
.		endif
.	endif

# NOTE: when you update the default linux_base version (case "yes"),
# don't forget to update the Handbook!

.	if exists(${PORTSDIR}/emulators/linux_base-${USE_LINUX})
LINUX_BASE_PORT=	${LINUXBASE}/bin/sh:${PORTSDIR}/emulators/linux_base-${USE_LINUX}
.	else
.			if ${USE_LINUX:L} == "yes"
LINUX_BASE_PORT=	${LINUXBASE}/etc/fedora-release:${PORTSDIR}/emulators/linux_base-fc4
.			else
IGNORE=	There is no emulators/linux_base-${USE_LINUX}, perhaps wrong use of USE_LINUX or OVERRIDE_LINUX_BASE_PORT.
.		endif
.	endif

BUILD_DEPENDS+=	${LINUX_BASE_PORT}
RUN_DEPENDS+=	${LINUX_BASE_PORT}
.endif

.if defined(USE_MOTIF)
USE_XPM=			yes
.if defined(WANT_LESSTIF)
LIB_DEPENDS+=		Xm:${PORTSDIR}/x11-toolkits/lesstif
NO_OPENMOTIF=		yes
.endif
.if !defined(NO_OPENMOTIF)
LIB_DEPENDS+=		Xm.3:${PORTSDIR}/x11-toolkits/open-motif
.endif
.endif

.if defined(USE_FREETYPE)
LIB_DEPENDS+=			ttf.4:${PORTSDIR}/print/freetype
.endif

.if defined(X_WINDOW_SYSTEM) && ${X_WINDOW_SYSTEM:L} == xorg
X_IMAKE_PORT=		${PORTSDIR}/devel/imake-6
X_LIBRARIES_PORT=	${PORTSDIR}/x11/xorg-libraries
X_CLIENTS_PORT=		${PORTSDIR}/x11/xorg-clients
X_SERVER_PORT=		${PORTSDIR}/x11-servers/xorg-server
X_FONTSERVER_PORT=	${PORTSDIR}/x11-servers/xorg-fontserver
X_PRINTSERVER_PORT=	${PORTSDIR}/x11-servers/xorg-printserver
X_VFBSERVER_PORT=	${PORTSDIR}/x11-servers/xorg-vfbserver
X_NESTSERVER_PORT=	${PORTSDIR}/x11-servers/xorg-nestserver
X_FONTS_ENCODINGS_PORT=	${PORTSDIR}/x11-fonts/xorg-fonts-encodings
X_FONTS_MISC_PORT=	${PORTSDIR}/x11-fonts/xorg-fonts-miscbitmaps
X_FONTS_100DPI_PORT=	${PORTSDIR}/x11-fonts/xorg-fonts-100dpi
X_FONTS_75DPI_PORT=	${PORTSDIR}/x11-fonts/xorg-fonts-75dpi
X_FONTS_CYRILLIC_PORT=	${PORTSDIR}/x11-fonts/xorg-fonts-cyrillic
X_FONTS_TTF_PORT=	${PORTSDIR}/x11-fonts/xorg-fonts-truetype
X_FONTS_TYPE1_PORT=	${PORTSDIR}/x11-fonts/xorg-fonts-type1
X_MANUALS_PORT=		${PORTSDIR}/x11/xorg-manpages
.else
IGNORE=	cannot install: bad X_WINDOW_SYSTEM setting; valid values are 'xorg'
.endif

.if defined(USE_IMAKE)
BUILD_DEPENDS+=			imake:${X_IMAKE_PORT}
.endif


.if defined(USE_XPM) || defined(USE_GL)
USE_XLIB=			yes
.endif

# This will always be xorg right now, but we might add xorg7 soon.
.if ${X_WINDOW_SYSTEM:L} == xorg
XAWVER=				8
.endif


PKG_IGNORE_DEPENDS?=		'this_port_does_not_exist'

PLIST_SUB+=			XAWVER=${XAWVER}

.if defined(USE_BISON)
BUILD_DEPENDS+=	bison:${PORTSDIR}/devel/bison
.endif



.if defined(USE_LOCAL_MK)
.include "${PORTSDIR}/Mk/bsd.local.mk"
.endif

.if defined(USE_MYSQL) || defined(WANT_MYSQL_VER) || \
	defined(USE_PGSQL) || defined(WANT_PGSQL_VER) || \
	defined(USE_BDB) || defined(USE_SQLITE)
.include "${PORTSDIR}/Mk/bsd.database.mk"
.endif

.if defined(WANT_GSTREAMER) || defined(USE_GSTREAMER) || defined(USE_GSTREAMER80)
.include "${PORTSDIR}/Mk/bsd.gstreamer.mk"
.endif

.if defined(USE_PERL5) || defined(PERL_CONFIGURE) || defined(PERL_MODBUILD) || defined(USE_PERL5_BUILD) || defined(USE_PERL5_RUN) 
.include "${PORTSDIR}/Mk/bsd.perl.mk"
.endif

.if defined(USE_GNUSTEP)
.include "${PORTSDIR}/Mk/bsd.gnustep.mk"
.endif

.if defined(USE_JAVA)
.include "${PORTSDIR}/Mk/bsd.java.mk"
.endif

.if defined(USE_LINUX_RPM)
.include "${PORTSDIR}/Mk/bsd.linux-rpm.mk"
.endif

.if defined(USE_SCONS)
.include "${PORTSDIR}/Mk/bsd.scons.mk"
.endif

.if defined(USE_SDL) || defined(WANT_SDL)
.include "${PORTSDIR}/Mk/bsd.sdl.mk"
.endif

.if defined(USE_PYTHON)
.include "${PORTSDIR}/Mk/bsd.python.mk"
.endif

.if defined(USE_TCL) || defined(USE_TCL_BUILD) || defined(USE_TK)
.include "${PORTSDIR}/Mk/bsd.tcl.mk"
.endif

.if defined(USE_LUA) || defined(USE_LUA_NOT)
.include "${PORTSDIR}/Mk/bsd.lua.mk"
.endif

.if defined(USE_WX) || defined(USE_WX_NOT)
.include "${PORTSDIR}/Mk/bsd.wx.mk"
.endif

.if defined(USE_APACHE) || defined(APACHE_COMPAT)
.include "${PORTSDIR}/Mk/bsd.apache.mk"
.endif

.if defined(USE_AUTOTOOLS)
.include "${PORTSDIR}/Mk/bsd.autotools.mk"
.endif

.if defined(WANT_GNOME) || defined(USE_GNOME) || defined(USE_GTK)
.include "${PORTSDIR}/Mk/bsd.gnome.mk"
.endif


.if exists(${PORTSDIR}/../Makefile.inc)
.include "${PORTSDIR}/../Makefile.inc"
USE_SUBMAKE=	yes
.endif

.if defined(USE_XLIB)
.	if defined(USE_LINUX)
RUN_DEPENDS+=	${LINUXBASE}/usr/X11R6/lib/libXrender.so.1:${PORTSDIR}/x11/linux-xorg-libs
.	else
LIB_DEPENDS+=	X11.6:${X_LIBRARIES_PORT}
.	endif
# 	Add explicit X options to avoid problems with false positives in configure
.	if defined(GNU_CONFIGURE)
CONFIGURE_ARGS+=--x-libraries=${X11BASE}/lib --x-includes=${X11BASE}/include
.	else
CFLAGS+= -I${X11BASE}/include -L${X11BASE}/lib
.	endif
.endif

# Set the default for the installation of Postscript(TM)-
# compatible functionality.
.if !defined(WITHOUT_X11)
.if defined(WITH_GHOSTSCRIPT_AFPL)
GHOSTSCRIPT_PORT?=	print/ghostscript-afpl
.else
GHOSTSCRIPT_PORT?=	print/ghostscript-gpl
.endif
.else
.if defined(WITH_GHOSTSCRIPT_AFPL)
GHOSTSCRIPT_PORT?=	print/ghostscript-afpl-nox11
.else
GHOSTSCRIPT_PORT?=	print/ghostscript-gpl-nox11
.endif
.endif

# Set up the ghostscript dependencies.
.if defined(USE_GHOSTSCRIPT) || defined(USE_GHOSTSCRIPT_BUILD)
BUILD_DEPENDS+=	gs:${PORTSDIR}/${GHOSTSCRIPT_PORT}
.endif
.if defined(USE_GHOSTSCRIPT) || defined(USE_GHOSTSCRIPT_RUN)
RUN_DEPENDS+=	gs:${PORTSDIR}/${GHOSTSCRIPT_PORT}
.endif

# Macro for doing in-place file editing using regexps
REINPLACE_ARGS?=	-i.bak
REINPLACE_CMD?=	${SED} ${REINPLACE_ARGS}

# Names of cookies used to skip already completed stages
EXTRACT_COOKIE?=	${WRKDIR}/.extract_done.${PORTNAME}.${PREFIX:S/\//_/g}
CONFIGURE_COOKIE?=	${WRKDIR}/.configure_done.${PORTNAME}.${PREFIX:S/\//_/g}
INSTALL_COOKIE?=	${WRKDIR}/.install_done.${PORTNAME}.${PREFIX:S/\//_/g}
BUILD_COOKIE?=		${WRKDIR}/.build_done.${PORTNAME}.${PREFIX:S/\//_/g}
PATCH_COOKIE?=		${WRKDIR}/.patch_done.${PORTNAME}.${PREFIX:S/\//_/g}
PACKAGE_COOKIE?=	${WRKDIR}/.package_done.${PORTNAME}.${PREFIX:S/\//_/g}
FAKE_COOKIE?=		${WRKDIR}/.fake_done.${PORTNAME}.${PREFIX:S/\//_/g}

# How to do nothing.  Override if you, for some strange reason, would rather
# do something.
DO_NADA?=		${TRUE}

# Use this as the first operand to always build dependency.
NONEXISTENT?=	/nonexistent

# Miscellaneous overridable commands:
GMAKE?=			gmake
XMKMF?=			xmkmf -a
.if exists(/sbin/md5)
MD5?=			/sbin/md5
.else
MD5?=			md5
.endif
.if exists(/sbin/sha256)
SHA256?=		/sbin/sha256
.elif exists(${LOCALBASE_REL}/sbin/sha256)
SHA256?=		${LOCALBASE_REL}/sbin/sha256
.else
SHA256?=		NO
.endif

CHECKSUM_ALGORITHMS?= md5 sha256

MD5_FILE?=		${MASTERDIR}/distinfo

MAKE_FLAGS?=	-f
MAKEFILE?=		Makefile
MAKE_ENV+=		TARGETDIR=${TARGETDIR} DESTDIR=${DESTDIR} PREFIX=${PREFIX} \
			LOCALBASE=${LOCALBASE_REL} X11BASE=${X11BASE_REL} \
			MOTIFLIB="${MOTIFLIB}" LIBDIR="${LIBDIR}" CFLAGS="${CFLAGS}" \
			CXXFLAGS="${CXXFLAGS}" MANPREFIX="${MANPREFIX}"

PTHREAD_CFLAGS?=
PTHREAD_LIBS?=		-pthread

.if exists(/usr/bin/fetch)
FETCH_CMD?=		/usr/bin/fetch -ApRr
FETCH_REGET?=	1
.if !defined(DISABLE_SIZE)
FETCH_BEFORE_ARGS+=	$${CKSIZE:+-S $$CKSIZE}
.endif
.else
FETCH_CMD?=		/usr/bin/ftp
FETCH_REGET?=	0
.endif

.if defined(RANDOMIZE_MASTER_SITES) && exists(/usr/games/random)
RANDOM_CMD?=	/usr/games/random
RANDOM_ARGS?=	"-w -f -"
_RANDOMIZE_SITES=	" |${RANDOM_CMD} ${RANDOM_ARGS}"
.endif

TOUCH?=			/usr/bin/touch
TOUCH_FLAGS?=	-f

DISTORIG?=	.bak.orig
PATCH?=			/usr/bin/patch
PATCH_STRIP?=	-p0
PATCH_DIST_STRIP?=	-p0
.if defined(PATCH_DEBUG)
PATCH_DEBUG_TMP=	yes
PATCH_ARGS?=	-d ${PATCH_WRKSRC} -E ${PATCH_STRIP}
PATCH_DIST_ARGS?=	--suffix ${DISTORIG} -d ${PATCH_WRKSRC} -E ${PATCH_DIST_STRIP}
.else
PATCH_DEBUG_TMP=	no
PATCH_ARGS?=	-d ${PATCH_WRKSRC} --forward --quiet -E ${PATCH_STRIP}
PATCH_DIST_ARGS?=	--suffix ${DISTORIG} -d ${PATCH_WRKSRC} --forward --quiet -E ${PATCH_DIST_STRIP}
.endif
.if defined(BATCH)
PATCH_ARGS+=		--batch
PATCH_DIST_ARGS+=	--batch
.endif

# Prevent breakage with VERSION_CONTROL=numbered
PATCH_ARGS+=	-V simple

.if defined(PATCH_CHECK_ONLY)
PATCH_ARGS+=	-C
PATCH_DIST_ARGS+=	-C
.endif

.if ${PATCH} == "/usr/bin/patch"
PATCH_ARGS+=	--suffix .orig
PATCH_DIST_ARGS+=	--suffix .orig
.endif

TAR?=	/usr/bin/tar

# EXTRACT_SUFX is defined in .pre.mk section
.if defined(USE_ZIP)
EXTRACT_CMD?=		${UNZIP_CMD}
EXTRACT_BEFORE_ARGS?=	-qo
EXTRACT_AFTER_ARGS?=	-d ${WRKDIR}
.else
EXTRACT_BEFORE_ARGS?=	-dc
.if defined(EXTRACT_PRESERVE_OWNERSHIP)
EXTRACT_AFTER_ARGS?=	| ${TAR} -xf - --no-same-owner
.else
EXTRACT_AFTER_ARGS?=	| ${TAR} -xf -
.endif
.if defined(USE_BZIP2)
EXTRACT_CMD?=			${BZIP2_CMD}
.else
EXTRACT_CMD?=			${GZIP_CMD}
.endif
.endif

# Figure out where the local mtree file is
.if !defined(MTREE_FILE) 
.if ${PREFIX} == ${X11BASE_REL} || defined(USE_X_PREFIX)
# User may have specified non-standard PREFIX for installing a port that
# uses X
MTREE_FILE=	/etc/mtree/BSD.x11-4.dist
.elif ${PREFIX} == /usr
MTREE_FILE=	/etc/mtree/BSD.usr.dist
.elif ${PREFIX} == ${LINUXBASE_REL}
MTREE_FILE=	${MTREE_LINUX_FILE}
.else
MTREE_FILE=	/etc/mtree/BSD.local.dist
.endif
.endif

MTREE_CMD?=			/usr/sbin/mtree
MTREE_LINUX_FILE?=	${LOCALBASE}/etc/mtree/bsd.linux-compat.mtree 
MTREE_ARGS?=		-U ${MTREE_FOLLOWS_SYMLINKS} -f ${MTREE_FILE} -d -e -p
MTREE_LINUX_ARGS?=	-U ${MTREE_FOLLOWS_SYMLINKS} -f ${MTREE_LINUX_FILE} -d -e -p

# Determine whether or not we can use rootly owner/group functions.
.if !defined(UID)
UID!=	${ID} -u
.endif
.if ${UID} == 0
_BINOWNGRP=	-o ${BINOWN} -g ${BINGRP}
_SHROWNGRP=	-o ${SHAREOWN} -g ${SHAREGRP}
_MANOWNGRP=	-o ${MANOWN} -g ${MANGRP}
.else
_BINOWNGRP=
_SHROWNGRP=
_MANOWNGRP=
.endif

# A few aliases for *-install targets
INSTALL_PROGRAM= \
	${INSTALL} ${COPY} ${STRIP} ${_BINOWNGRP} -m ${BINMODE}
INSTALL_SCRIPT= \
	${INSTALL} ${COPY} ${_BINOWNGRP} -m ${BINMODE}
INSTALL_DATA= \
	${INSTALL} ${COPY} ${_SHROWNGRP} -m ${SHAREMODE}
INSTALL_MAN= \
	${INSTALL} ${COPY} ${_MANOWNGRP} -m ${MANMODE}

INSTALL_MACROS=	BSD_INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
			BSD_INSTALL_SCRIPT="${INSTALL_SCRIPT}" \
			BSD_INSTALL_DATA="${INSTALL_DATA}" \
			BSD_INSTALL_MAN="${INSTALL_MAN}"
MAKE_ENV+=	${INSTALL_MACROS}
SCRIPTS_ENV+=	${INSTALL_MACROS}

# The user can override the NO_PACKAGE by specifying this from
# the make command line
.if defined(FORCE_PACKAGE)
.undef NO_PACKAGE
.endif

COMMENTFILE?=	${PKGDIR}/pkg-comment
DESCR?=			${PKGDIR}/pkg-descr
PLIST?=			${PKGDIR}/pkg-plist
PKGINSTALL?=	${PKGDIR}/pkg-install
PKGDEINSTALL?=	${PKGDIR}/pkg-deinstall
PKGREQ?=		${PKGDIR}/pkg-req
PKGMESSAGE?=	${PKGDIR}/pkg-message

TMPPLIST?=	${WRKDIR}/.PLIST.mktmp

.for _CATEGORY in ${CATEGORIES}
PKGCATEGORY?=	${_CATEGORY}
.endfor
_PORTDIRNAME=	${.CURDIR:T}
PORTDIRNAME?=	${_PORTDIRNAME}
PKGORIGIN?=		${PKGCATEGORY}/${PORTDIRNAME}


.if !defined(DESTDIR)
PKG_CMD?=		/usr/sbin/pkg_create
PKG_ADD?=		/usr/sbin/pkg_add
PKG_DELETE?=	/usr/sbin/pkg_delete
PKG_INFO?=		/usr/sbin/pkg_info
PKG_VERSION?=		/usr/sbin/pkg_version
.else
PKG_CMD?=		/usr/sbin/mport
PKG_ADD?=		${CHROOT} ${DESTDIR} /usr/sbin/pkg_add
PKG_DELETE?=	${CHROOT} ${DESTDIR} /usr/sbin/pkg_delete
PKG_INFO?=		${CHROOT} ${DESTDIR} /usr/sbin/pkg_info
PKG_VERSION?=	${CHROOT} ${DESTDIR} /usr/sbin/pkg_version
.endif

.if !defined(PKG_ARGS)
PKG_ARGS=	-v -c -${COMMENT:Q} -S ${FAKE_DESTDIR} -d ${DESCR} -f ${TMPPLIST} -p ${PREFIX}\
			-P "`cd ${.CURDIR} && ${MAKE} package-depends | ${GREP} -v -E ${PKG_IGNORE_DEPENDS} | ${SORT} -u`" \
			${EXTRA_PKG_ARGS} $${_LATE_PKG_ARGS} 
.if !defined(NO_MTREE)
PKG_ARGS+=		-m ${MTREE_FILE}
.endif
.if defined(PKGORIGIN)
PKG_ARGS+=		-o ${PKGORIGIN}
.endif
.if defined(CONFLICTS) && !defined(DISABLE_CONFLICTS)
PKG_ARGS+=		-C "${CONFLICTS}"
.endif
.endif

.if defined(PKG_NOCOMPRESS)
PKG_SUFX?=		.tar
.else
PKG_SUFX?=		.tbz
.endif

# where pkg_add records its dirty deeds.
PKG_DBDIR?=		${DESTDIR}/var/db/pkg

MOTIFLIB?=	-L${X11BASE}/lib -lXm -lXp

ALL_TARGET?=		all
INSTALL_TARGET?=	install

# This is a mid-term solution patch while pkg-comment files are
# phased out.
# The final simpler patch will come afterwards
.if !defined(COMMENT)
check-makevars::
		@${ECHO_MSG} 'Makefile error: there is no COMMENT variable defined'
		@${ECHO_MSG} 'for this port. Please, rectify this.'
		@${FALSE}
.else
.if exists(${COMMENTFILE})
check-makevars::
		@${ECHO_MSG} 'Makefile error: There is a COMMENTFILE in this port.'
		@${ECHO_MSG} 'COMMENTFILEs have been deprecated in'
		@${ECHO_MSG} 'favor of COMMENT variables.'
		@${ECHO_MSG} 'Please, rectify this.'
		@${FALSE}
.endif
.endif

# Popular master sites
.include "bsd.sites.mk"

# Empty declaration to avoid "variable MASTER_SITES recursive" error
MASTER_SITES?=
PATCH_SITES?=
_MASTER_SITES_DEFAULT?=
_PATCH_SITES_DEFAULT?=

# Feed internal _{MASTER,PATCH}_SITES_n where n is a group designation
# as per grouping rules (:something)
# Organize _{MASTER,PATCH}_SITES_{DEFAULT,[^/:]+} according to grouping
# rules (:something)
.for _S in ${MASTER_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "Makefile error: the words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your MASTER_SITES"
				@${FALSE}
.			endif
_MASTER_SITES_${_group}+=	${_S:C@^(.*/):[^/:]+$@\1@}
.		endfor
.	else
_MASTER_SITES_DEFAULT+=	${_S:C@^(.*/):[^/:]+$@\1@}
.	endif
.endfor
.for _S in ${PATCH_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "The words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your PATCH_SITES"
				@${FALSE}
.			endif
_PATCH_SITES_${_group}+=	${_S:C@^(.*/):[^/:]+$@\1@}
.		endfor
.	else
_PATCH_SITES_DEFAULT+=	${_S:C@^(.*/):[^/:]+$@\1@}
.	endif
.endfor

# Feed internal _{MASTER,PATCH}_SITE_SUBDIR_n where n is a group designation
# as per grouping rules (:something)
# Organize _{MASTER,PATCH}_SITE_SUBDIR_{DEFAULT,[^/:]+} according to grouping
# rules (:something)
.for _S in ${MASTER_SITE_SUBDIR}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "Makefile error: the words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your MASTER_SITE_SUBDIR"
				@${FALSE}
.			endif
.			if defined(_MASTER_SITES_${_group})
_MASTER_SITE_SUBDIR_${_group}+= ${_S:C@^(.*)/:[^/:]+$@\1@}
.			endif
.		endfor
.	else
.		if defined(_MASTER_SITES_DEFAULT)
_MASTER_SITE_SUBDIR_DEFAULT+=	${_S:C@^(.*)/:[^/:]+$@\1@}
.		endif
.	endif
.endfor
.for _S in ${PATCH_SITE_SUBDIR}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "Makefile error: the words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your PATCH_SITE_SUBDIR"
				@${FALSE}
.			endif
.			if defined(_PATCH_SITES_${_group})
_PATCH_SITE_SUBDIR_${_group}+= ${_S:C@^(.*)/:[^/:]+$@\1@}
.			endif
.		endfor
.	else
.		if defined(_PATCH_SITES_DEFAULT)
_PATCH_SITE_SUBDIR_DEFAULT+=	${_S:C@^(.*)/:[^/:]+$@\1@}
.		endif
.	endif
.endfor

# Substitute subdirectory names
# XXX simpler/faster solution but not the best space wise, suggestions please
.for _S in ${MASTER_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
.			if !defined(_MASTER_SITE_SUBDIR_${_group})
MASTER_SITES_TMP=	${_MASTER_SITES_${_group}:S^%SUBDIR%/^^}
.			else
_S_TEMP_TEMP=		${_MASTER_SITES_${_group}:M*%SUBDIR%/*}
.				if empty(_S_TEMP_TEMP)
MASTER_SITES_TMP=	${_MASTER_SITES_${_group}}
.				else
MASTER_SITES_TMP=
.					for site in ${_MASTER_SITES_${_group}}
_S_TEMP_TEMP=	${site:M*%SUBDIR%/*}
.						if empty(_S_TEMP_TEMP)
MASTER_SITES_TMP+=	${site}
.						else
.							for dir in ${_MASTER_SITE_SUBDIR_${_group}}
MASTER_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.							endfor
.						endif
.					endfor
.				endif
.			endif
_MASTER_SITES_${_group}:=	${MASTER_SITES_TMP}
.		endfor
.	endif
.endfor
.if defined(_MASTER_SITE_SUBDIR_DEFAULT)
_S_TEMP=	${_MASTER_SITES_DEFAULT:M*%SUBDIR%/*}
.	if empty(_S_TEMP)
MASTER_SITES_TMP=	${_MASTER_SITES_DEFAULT}
.	else
MASTER_SITES_TMP=
.		for site in ${_MASTER_SITES_DEFAULT}
_S_TEMP_TEMP=		${site:M*%SUBDIR%/*}
.			if empty(_S_TEMP_TEMP)
MASTER_SITES_TMP+=	${site}
.			else
.				for dir in ${_MASTER_SITE_SUBDIR_DEFAULT}
MASTER_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.				endfor
.			endif
.		endfor
.	endif
.else
MASTER_SITES_TMP=	${_MASTER_SITES_DEFAULT:S^%SUBDIR%/^^}
.endif
_MASTER_SITES_DEFAULT:=	${MASTER_SITES_TMP}
MASTER_SITES_TMP=
.for _S in ${PATCH_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
.			if !defined(_PATCH_SITE_SUBDIR_${_group})
PATCH_SITES_TMP=	${_PATCH_SITES_${_group}:S^%SUBDIR%/^^}
.			else
_S_TEMP_TEMP=		${_PATCH_SITES_${_group}:M*%SUBDIR%/*}
.				if empty(_S_TEMP_TEMP)
PATCH_SITES_TMP=	${_PATCH_SITES_${_group}}
.				else
PATCH_SITES_TMP=
.					for site in ${_PATCH_SITES_${_group}}
_S_TEMP_TEMP=	${site:M*%SUBDIR%/*}
.						if empty(_S_TEMP_TEMP)
PATCH_SITES_TMP+=	${site}
.						else
.							for dir in ${_PATCH_SITE_SUBDIR_${_group}}
PATCH_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.							endfor
.						endif
.					endfor
.				endif
.			endif
_PATCH_SITES_${_group}:=	${PATCH_SITES_TMP}
.		endfor
.	endif
.endfor
.if defined(_PATCH_SITE_SUBDIR_DEFAULT)
_S_TEMP=	${_PATCH_SITES_DEFAULT:M*%SUBDIR%/*}
.	if empty(_S_TEMP)
PATCH_SITES_TMP=	${_PATCH_SITES_DEFAULT}
.	else
PATCH_SITES_TMP=
.		for site in ${_PATCH_SITES_DEFAULT}
_S_TEMP_TEMP=		${site:M*%SUBDIR%/*}
.			if empty(_S_TEMP_TEMP)
PATCH_SITES_TMP+=	${site}
.			else
.				for dir in ${_PATCH_SITE_SUBDIR_DEFAULT}
PATCH_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.				endfor
.			endif
.		endfor
.	endif
.else
PATCH_SITES_TMP=	${_PATCH_SITES_DEFAULT:S^%SUBDIR%/^^}
.endif
_PATCH_SITES_DEFAULT:=	${PATCH_SITES_TMP}
PATCH_SITES_TMP=

# The primary backup site.
MASTER_SITE_BACKUP?=	\
	ftp://ftp.freeBSD.org/pub/FreeBSD/ports/distfiles/${DIST_SUBDIR}/
MASTER_SITE_BACKUP:=	${MASTER_SITE_BACKUP:S^\${DIST_SUBDIR}/^^}

# If the user has MASTER_SITE_FREEBSD set, go to the FreeBSD repository
# for everything, but don't search it twice by appending it to the end.
.if defined(MASTER_SITE_FREEBSD)
_MASTER_SITE_OVERRIDE:=	${MASTER_SITE_BACKUP}
_MASTER_SITE_BACKUP:=	# empty
.else
_MASTER_SITE_OVERRIDE=	${MASTER_SITE_OVERRIDE}
_MASTER_SITE_BACKUP=	${MASTER_SITE_BACKUP}
.endif

# Search CDROM first if mounted, symlink instead of copy if
# FETCH_SYMLINK_DISTFILES is set
.for MOUNTPT in ${CD_MOUNTPTS}
.if exists(${MOUNTPT}/mports/distfiles)
_MASTER_SITE_OVERRIDE:=	file:${MOUNTPT}/mports/distfiles/${DIST_SUBDIR}/ ${_MASTER_SITE_OVERRIDE}
.if defined(FETCH_SYMLINK_DISTFILES)
FETCH_BEFORE_ARGS+=	-l
.endif
.endif
.endfor

NOFETCHFILES?=

# Organize DISTFILES, PATCHFILES, _MASTER_SITES_ALL, _PATCH_SITES_ALL
# according to grouping rules (:something)
DISTFILES?=		${DISTNAME}${EXTRACT_SUFX}
_MASTER_SITES_ALL=	${_MASTER_SITES_DEFAULT}
_PATCH_SITES_ALL=	${_PATCH_SITES_DEFAULT}
_G_TEMP=	DEFAULT
.for _D in ${DISTFILES}
_D_TEMP=	${_D:S/^${_D:C/:[^:]+$//}//}
.	if !empty(_D_TEMP)
.		for _group in ${_D_TEMP:S/^://:S/,/ /g}
.			if !defined(_MASTER_SITES_${_group})
_G_TEMP_TEMP=	${_G_TEMP:M/${_group}/}
.				if empty(_G_TEMP_TEMP)
_G_TEMP+=	${_group}
_MASTER_SITES_ALL+=	${_MASTER_SITES_${_group}}
.				endif
.			endif
.		endfor
_DISTFILES+=	${_D:C/:[^:]+$//}
.	else
_DISTFILES+=	${_D}
.	endif
.endfor
_G_TEMP=	DEFAULT
.for _P in ${PATCHFILES}
_P_TEMP=	${_P:S/^${_P:C/:[^:]+$//}//}
.	if !empty(_P_TEMP)
.		for _group in ${_P_TEMP:S/^://:S/,/ /g}
.			if !defined(_PATCH_SITES_${_group})
_G_TEMP_TEMP=	${_G_TEMP:M/${_group}/}
.				if empty(_G_TEMP_TEMP)
_G_TEMP+=	${_group}
_PATCH_SITES_ALL+=	${_PATCH_SITES_${_group}}
.				endif
.			endif
.		endfor
_PATCHFILES+=	${_P:C/:[^:]+$//}
.	else
_PATCHFILES+=	${_P}
.	endif
.endfor
_G_TEMP=
_G_TEMP_TEMP=
ALLFILES?=	${_DISTFILES} ${_PATCHFILES}

#
# Sort the master site list according to the patterns in MASTER_SORT
#
MASTER_SORT?=
MASTER_SORT_REGEX?=
MASTER_SORT_REGEX+=	${MASTER_SORT:S|.|\\.|g:S|^|://[^/]*|:S|$|/|}

MASTER_SORT_AWK=	BEGIN { RS = " "; ORS = " "; IGNORECASE = 1 ; gl = "${MASTER_SORT_REGEX:S|\\|\\\\|g}"; }
.for srt in ${MASTER_SORT_REGEX}
MASTER_SORT_AWK+=	/${srt:S|/|\\/|g}/ { good["${srt:S|\\|\\\\|g}"] = good["${srt:S|\\|\\\\|g}"] " " $$0 ; next; }
.endfor
MASTER_SORT_AWK+=	{ rest = rest " " $$0; } END { n=split(gl, gla); for(i=1;i<=n;i++) { print good[gla[i]]; } print rest; }

SORTED_MASTER_SITES_DEFAULT_CMD=	cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} master-sites-DEFAULT
SORTED_PATCH_SITES_DEFAULT_CMD=		cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} patch-sites-DEFAULT
SORTED_MASTER_SITES_ALL_CMD=	cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} master-sites-ALL
SORTED_PATCH_SITES_ALL_CMD=	cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} patch-sites-ALL

#
# Sort the master site list according to the patterns in MASTER_SORT
# according to grouping rules (:something)
#
# for use in the fetch targets
.for _S in ${MASTER_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/^://:S/,/ /g}
.			if !target(master-sites-${_group})
SORTED_MASTER_SITES_${_group}_CMD=	cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} master-sites-${_group}
master-sites-${_group}:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_MASTER_SITES_${_group}}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
.			endif
.		endfor
.	endif
.endfor
.for _S in ${PATCH_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/^://:S/,/ /g}
.			if !target(patch-sites-${_group})
SORTED_PATCH_SITES_${_group}_CMD=	cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} patch-sites-${_group}
patch-sites-${_group}:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_PATCH_SITES_${_group}}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
.			endif
.		endfor
.	endif
.endfor

#
# Hackery to enable simple fetch targets with several dynamic MASTER_SITES
#
_MASTER_SITES_ENV=	_MASTER_SITES_DEFAULT="${_MASTER_SITES_DEFAULT}"
.for _F in ${DISTFILES}
_F_TEMP=	${_F:S/^${_F:C/:[^:]+$//}//:S/^://}
.	if !empty(_F_TEMP)
.		for _group in ${_F_TEMP:S/,/ /g}
.			if defined(_MASTER_SITES_${_group})
_MASTER_SITES_ENV+=	_MASTER_SITES_${_group}="${_MASTER_SITES_${_group}}"
.			endif
.		endfor
.	endif
.endfor
_PATCH_SITES_ENV=	_PATCH_SITES_DEFAULT="${_PATCH_SITES_DEFAULT}"
.for _F in ${PATCHFILES}
_F_TEMP=	${_F:S/^${_F:C/:[^:]+$//}//:S/^://}
.	if !empty(_F_TEMP)
.		for _group in ${_F_TEMP:S/,/ /g}
.			if defined(_PATCH_SITES_${_group})
_PATCH_SITES_ENV+=	_PATCH_SITES_${_group}="${_PATCH_SITES_${_group}}"
.			endif
.		endfor
.	endif
.endfor

master-sites-ALL:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_MASTER_SITES_ALL}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
patch-sites-ALL:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_PATCH_SITES_ALL}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
# has similar effect to old targets, i.e., access only {MASTER,PATCH}_SITES, not working with the new _n variables
master-sites-DEFAULT:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_MASTER_SITES_DEFAULT}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
patch-sites-DEFAULT:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_PATCH_SITES_DEFAULT}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}

# synonyms, mnemonics
master-sites-all: master-sites-ALL
patch-sites-all: patch-sites-ALL
master-sites-default: master-sites-DEFAULT
patch-sites-default: patch-sites-DEFAULT

# compatibility with old behavior
master-sites: master-sites-DEFAULT
patch-sites: patch-sites-DEFAULT

.if defined(IGNOREFILES)
.if !defined(CKSUMFILES)
CKSUMFILES!=	\
	for file in ${ALLFILES}; do \
		ignore=0; \
		for tmp in ${IGNOREFILES}; do \
			if [ "$$file" = "$$tmp" ]; then \
				ignore=1; \
			fi; \
		done; \
		if [ "$$ignore" = 0 ]; then \
			${ECHO_CMD} "$$file"; \
		fi; \
	done
.endif
.else
CKSUMFILES=		${ALLFILES}
.endif

# List of all files, with ${DIST_SUBDIR} in front.  Used for checksum.
.if defined(DIST_SUBDIR)
.if defined(CKSUMFILES) && ${CKSUMFILES}!=""
_CKSUMFILES?=	${CKSUMFILES:S/^/${DIST_SUBDIR}\//}
.endif
.if defined(IGNOREFILES) && ${IGNOREFILES}!=""
_IGNOREFILES?=	${IGNOREFILES:S/^/${DIST_SUBDIR}\//}
.endif
.else
_CKSUMFILES?=	${CKSUMFILES}
_IGNOREFILES?=	${IGNOREFILES}
.endif

# This is what is actually going to be extracted, and is overridable
#  by user.
EXTRACT_ONLY?=	${_DISTFILES}

.if !target(maintainer)
maintainer:
	@${ECHO_CMD} "${MAINTAINER}"
.endif

.if !target(check-makefile)
check-makefile::
	@${DO_NADA}
.endif

.if !defined(CATEGORIES)
check-categories:
	@${ECHO_MSG} "${PKGNAME}: Makefile error: CATEGORIES is mandatory."
	@${FALSE}
.else

VALID_CATEGORIES+= accessibility afterstep arabic archivers astro audio \
	benchmarks biology cad comms converters databases \
	deskutils devel dns editors elisp emulators finance french ftp \
	games geography german gnome gnustep graphics hamradio haskell hebrew hungarian \
	ipv6 irc japanese java kde korean lang linux lisp \
	mail math mbone misc multimedia net net-im net-mgmt net-p2p news \
	palm parallel pear perl5 picobsd plan9 polish portuguese ports-mgmt print \
	python ruby rubygems russian \
	scheme science security shells spanish sysutils \
	tcl80 tcl81 tcl82 tcl83 tcl84 textproc \
	tk80 tk82 tk83 tk84 tkstep80 \
	ukrainian vietnamese windowmaker www \
	x11 x11-clocks x11-fm x11-fonts x11-servers x11-themes x11-toolkits \
	x11-wm xfce zope

check-categories:
.for cat in ${CATEGORIES}
	@if ${ECHO_CMD} ${VALID_CATEGORIES} | ${GREP} -wq ${cat}; then \
		${TRUE}; \
	else \
		${ECHO_MSG} "${PKGNAME}: Makefile error: category ${cat} not in list of valid categories."; \
		${FALSE}; \
	fi
.endfor
.endif

.if !target(check-makevars)
check-makevars::
	@${DO_NADA}
.endif

.if !target(check-depends)
check-depends:
	@${DO_NADA}
.endif

PKGREPOSITORYSUBDIR?=	All
PKGREPOSITORY?=		${PACKAGES}/${PKGREPOSITORYSUBDIR}

PKGFILE?=		${PKGREPOSITORY}/${PKGNAME}${PKG_SUFX}


# The "latest version" link -- ${PKGNAME} minus everthing after the last '-'
PKGLATESTREPOSITORY?=	${PACKAGES}/Latest
PKGBASE?=			${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}
LATEST_LINK?=		${PKGBASE}
PKGLATESTFILE=		${PKGLATESTREPOSITORY}/${LATEST_LINK}${PKG_SUFX}


CONFIGURE_SCRIPT?=	configure
CONFIGURE_TARGET?=	${ARCH}-portbld-freebsd6.0
CONFIGURE_LOG?=		config.log

# A default message to print if do-configure fails.
CONFIGURE_FAIL_MESSAGE?=	"Please report the problem to ${MAINTAINER} [maintainer] and attach the \"${CONFIGURE_WRKSRC}/${CONFIGURE_LOG}\" including the output of the failure of your make command. Also, it might be a good idea to provide an overview of all packages installed on your system (e.g. an \`ls ${PKG_DBDIR}\`)."

.if defined(GNU_CONFIGURE)
# Maximum command line length
.if !defined(CONFIGURE_MAX_CMD_LEN)
CONFIGURE_MAX_CMD_LEN!=	${SYSCTL} -n kern.argmax
.endif
CONFIGURE_ARGS+=	--prefix=${PREFIX} ${CONFIGURE_TARGET}
CONFIGURE_ENV+=		lt_cv_sys_max_cmd_len=${CONFIGURE_MAX_CMD_LEN}
HAS_CONFIGURE=		yes
.endif

# Passed to most of script invocations
SCRIPTS_ENV+=	CURDIR=${MASTERDIR} DISTDIR=${DISTDIR} \
		  WRKDIR=${WRKDIR} WRKSRC=${WRKSRC} PATCHDIR=${PATCHDIR} \
		  SCRIPTDIR=${SCRIPTDIR} FILESDIR=${FILESDIR} \
		  PORTSDIR=${PORTSDIR} DEPENDS="${DEPENDS}" \
		  PREFIX=${PREFIX} LOCALBASE=${LOCALBASE} X11BASE=${X11BASE} \
		  DESTDIR=${DESTDIR} TARGETDIR=${DESTDIR}

.if defined(BATCH)
SCRIPTS_ENV+=	BATCH=yes
.endif

.if ${PREFIX} == /usr
MANPREFIX?=	${DESTDIR}/usr/share
.else
MANPREFIX?=	${TARGETDIR}
.endif

.for sect in 1 2 3 4 5 6 7 8 9
MAN${sect}PREFIX?=	${MANPREFIX}
.endfor
MANLPREFIX?=	${MANPREFIX}
MANNPREFIX?=	${MANPREFIX}

MANLANG?=	""	# english only by default

.if !defined(NOMANCOMPRESS)
MANEXT?=	.gz
.endif

.if (defined(MLINKS) || defined(_MLINKS_PREPEND)) && !defined(_MLINKS)
__pmlinks!=	${ECHO_CMD} '${MLINKS:S/	/ /}' | ${AWK} \
 '{ if (NF % 2 != 0) { print "broken"; exit; } \
	for (i=1; i<=NF; i++) { \
		if ($$i ~ /^-$$/ && i != 1 && i % 2 != 0) \
			{ $$i = $$(i-2); printf " " $$i " "; } \
		else if ($$i ~ /^[^ ]+\.[1-9ln][^. ]*$$/ || $$i ~ /^\//) \
			printf " " $$i " "; \
		else \
			{ print "broken"; exit; } \
	} \
  }' | ${SED} -e 's \([^/ ][^ ]*\.\(.\)[^. ]*\) $${MAN\2PREFIX}/$$$$$$$${__lang}/man\2/\1${MANEXT}g' -e 's/ //g' -e 's/MANlPREFIX/MANLPREFIX/g' -e 's/MANnPREFIX/MANNPREFIX/g'
.if ${__pmlinks:Mbroken} == "broken"
check-makevars::
	@${ECHO_MSG} "${PKGNAME}: Makefile error: unable to parse MLINKS."
	@${FALSE}
.endif
_MLINKS=	${_MLINKS_PREPEND}
# XXX 20040119 This next line should read:
# .for lang in ${MANLANG:S%^%man/%:S%^man/""$%man%}
# but there is currently a bug in make(1) that prevents the double-quote
# substitution from working correctly.  Once that problem is addressed,
# and has had a enough time to mature, this hack should be removed.
.for lang in ${MANLANG:S%^%man/%:S%^man/""$%man%:S%^man/"$%man%}
.for ___pmlinks in ${__pmlinks}
.for __lang in ${lang}
_MLINKS+=	${___pmlinks:S// /g}
.endfor
.endfor
.endfor
.endif
_COUNT=0
.for ___tpmlinks in ${_MLINKS}
.if ${_COUNT} == "1"
_TMLINKS+=	${___tpmlinks}
_COUNT=0
.else
_COUNT=1
.endif
.endfor


.for ___link in ${_MLINKS}
_FAKE_MLINKS += ${FAKE_DESTDIR}${___link}
.endfor

# XXX 20040119 This next line should read:
# .for manlang in ${MANLANG:S%^%man/%:S%^man/""$%man%}
# but there is currently a bug in make(1) that prevents the double-quote
# substitution from working correctly.  Once that problem is addressed,
# and has had a enough time to mature, this hack should be removed.
.for manlang in ${MANLANG:S%^%man/%:S%^man/""$%man%:S%^man/"$%man%}

.for sect in 1 2 3 4 5 6 7 8 9 L N
.if defined(MAN${sect})
_MANPAGES+=	${MAN${sect}:S%^%${MAN${sect}PREFIX}/${manlang}/man${sect:L}/%}
.endif
.endfor

.endfor

.if !defined(_TMLINKS)
_TMLINKS=
.endif

.if defined(_MANPAGES)

.if defined(NOMANCOMPRESS)
__MANPAGES:=	${_MANPAGES:S%^${TARGETDIR}/%%}
.else
__MANPAGES:=	${_MANPAGES:S%^${TARGETDIR}/%%:S%$%.gz%}
.endif

.for m in ${_MANPAGES}
_FAKEMAN += ${FAKE_DESTDIR}${m}         
.endfor

.endif

.if ${PREFIX} == /usr
INFO_PATH?=	share/info
.else
INFO_PATH?=	info
.endif

DOCSDIR?=	${TARGETDIR}/share/doc/${PORTNAME}
EXAMPLESDIR?=	${TARGETDIR}/share/examples/${PORTNAME}
DATADIR?=	${TARGETDIR}/share/${PORTNAME}

PLIST_SUB+=	DOCSDIR="${DOCSDIR:S,^${TARGETDIR}/,,}" \
		EXAMPLESDIR="${EXAMPLESDIR:S,^${TARGETDIR}/,,}" \
		DATADIR="${DATADIR:S,^${TARGETDIR}/,,}"

DESKTOPDIR?=		${TARGETDIR}/share/applications
_DESKTOPDIR_REL=	${DESKTOPDIR:S,^${TARGETDIR}/,,}/

.if ${_DESKTOPDIR_REL} == ${DESKTOPDIR}/
# DESKTOPDIR is not beneath PREFIX
_DESKTOPDIR_REL=
.endif

# Put this as far down as possible so it will catch all PLIST_SUB definitions.

.if defined(INSTALLS_SHLIB)
LDCONFIG_DIRS?=	%%PREFIX%%/lib
USE_LDCONFIG!=	${ECHO_CMD} ${LDCONFIG_DIRS} | ${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/}
.endif

.MAIN: all

#
# LICENSE Setup
#
_LICENSES= 	gpl gpl2 gpl3 lgpl bsd4 bsd3 bsd2 python ruby x11 guile artistic artistic2 \
			bdb mpl npl publicdom zlib apache2 apache1.1 apache1 apsl2 apsl1 php \
			restricted perl modula3 unknown




################################################################
# Many ways to disable a port.
#
# If we're in BATCH mode and the port is interactive, or we're
# in interactive mode and the port is non-interactive, skip all
# the important targets.  The reason we have two modes is that
# one might want to leave a build in BATCH mode running
# overnight, then come back in the morning and do _only_ the
# interactive ones that required your intervention.
#
# Ignore ports that can't be resold if building for a CDROM.
#
# Don't build a port if it's restricted and we don't want to get
# into that.
#
# Don't build a port if it's broken, unless we're running a parallel
# build (in case it's fixed).
#
# Don't build a port if it's forbidden for whatever reason.
#
# Don't build a port if the system is too old.
################################################################

# Check the machine architectures
.if defined(ONLY_FOR_ARCHS)
.for __ARCH in ${ONLY_FOR_ARCHS}
.if ${ARCH:M${__ARCH}} != ""
__ARCH_OK?=     1
.endif
.endfor
.else
__ARCH_OK?=     1
.endif

.if defined(NOT_FOR_ARCHS)
.for __NARCH in ${NOT_FOR_ARCHS}
.if ${ARCH:M${__NARCH}} != ""
.undef __ARCH_OK
.endif
.endfor
.endif

.if !defined(__ARCH_OK)
.if defined(ONLY_FOR_ARCHS)
IGNORE=		is only for ${ONLY_FOR_ARCHS},
.else # defined(NOT_FOR_ARCHS)
IGNORE=		does not run on ${NOT_FOR_ARCHS}.
.endif
IGNORE+=	and you are running ${ARCH}.

.if defined(ONLY_FOR_ARCHS_REASON_${ARCH})
IGNORE+=	Reason: ${ONLY_FOR_ARCHS_REASON_${ARCH}}
.elif defined(ONLY_FOR_ARCHS_REASON)
IGNORE+=	Reason: ${ONLY_FOR_ARCHS_REASON}
.endif

.if defined(NOT_FOR_ARCHS_REASON_${ARCH})
IGNORE+=	Reason: ${NOT_FOR_ARCHS_REASON_${ARCH}}
.elif defined(NOT_FOR_ARCHS_REASON)
IGNORE+=	Reason: ${NOT_FOR_ARCHS_REASON}
.endif

.endif

# Check the user interaction and legal issues
.if !defined(NO_IGNORE)
.if (defined(IS_INTERACTIVE) && defined(BATCH))
IGNORE=	is an interactive port
.elif (!defined(IS_INTERACTIVE) && defined(INTERACTIVE))
IGNORE=	is not an interactive port
.elif (defined(NO_CDROM) && defined(FOR_CDROM))
IGNORE=	may not be placed on a CDROM: ${NO_CDROM}
.elif (defined(RESTRICTED) && defined(NO_RESTRICTED))
IGNORE=	is restricted: ${RESTRICTED}
.elif defined(BROKEN)
.if !defined(TRYBROKEN)
IGNORE=	is marked as broken: ${BROKEN}
.endif
.elif defined(FORBIDDEN)
IGNORE=	is forbidden: ${FORBIDDEN}
.endif

.if (defined(MANUAL_PACKAGE_BUILD) && defined(PACKAGE_BUILDING))
IGNORE=	has to be built manually: ${MANUAL_PACKAGE_BUILD}
clean:
	@${IGNORECMD}
.endif

.if defined(IGNORE)
.if defined(IGNORE_SILENT)
IGNORECMD=	${DO_NADA}
.else
IGNORECMD=	${ECHO_MSG} "===>  ${PKGNAME} "${IGNORE:Q}.;exit 1
.endif

.for target in check-sanity fetch checksum extract patch configure all build fake install reinstall package
.if !target(${target})
${target}:
	@${IGNORECMD}
.if defined(INSTALLS_DEPENDS)
	@${FALSE}
.endif
.endif
.endfor

.endif

.endif

.if defined(IGNORE) || defined(NO_PACKAGE)
ignorelist: package-name
.else
ignorelist:
	@${DO_NADA}
.endif

################################################################
# Clean directories for ftp or CDROM.
################################################################

.if defined(RESTRICTED)
clean-restricted:	delete-distfiles delete-package
clean-restricted-list: delete-distfiles-list delete-package-list
RESTRICTED_FILES?=	${_DISTFILES} ${_PATCHFILES}
.else
clean-restricted:
clean-restricted-list:
.endif

.if defined(NO_CDROM)
clean-for-cdrom:	delete-distfiles delete-package
clean-for-cdrom-list:	delete-distfiles-list delete-package-list
RESTRICTED_FILES?=	${_DISTFILES} ${_PATCHFILES}
.else
clean-for-cdrom:
clean-for-cdrom-list:
.endif

.if defined(ALL_HOOK)
all:
	@cd ${.CURDIR} && ${SETENV} CURDIR=${.CURDIR} DISTNAME=${DISTNAME} \
	  DISTDIR=${DISTDIR} WRKDIR=${WRKDIR} WRKSRC=${WRKSRC} \
	  PATCHDIR=${PATCHDIR} SCRIPTDIR=${SCRIPTDIR} \
	  FILESDIR=${FILESDIR} PORTSDIR=${PORTSDIR} DESTDIR=${DESTDIR} PREFIX=${PREFIX} \
	  DEPENDS="${DEPENDS}" BUILD_DEPENDS="${BUILD_DEPENDS}" \
	  RUN_DEPENDS="${RUN_DEPENDS}" X11BASE=${X11BASE} \
	  CONFLICTS="${CONFLICTS}" \
	${ALL_HOOK}
.endif

.if !target(all)
all: build
.endif

.if !defined(DEPENDS_TARGET)
.if make(reinstall)
DEPENDS_TARGET=	reinstall
.else
DEPENDS_TARGET=	cached-install
.endif
.if defined(DEPENDS_CLEAN)
DEPENDS_TARGET+=	clean
DEPENDS_ARGS+=	NOCLEANDEPENDS=yes
.endif
.else
DEPENDS_ARGS+=	FORCE_PKG_REGISTER=yes
.endif
.if defined(DEPENDS)
# pretty much guarantees overwrite of existing installation
.MAKEFLAGS:	FORCE_PKG_REGISTER=yes
.endif

################################################################
#
# Do preliminary work to detect if we need to run the config
# target or not.
#
################################################################
.if (!defined(OPTIONS) || defined(CONFIG_DONE) || \
	defined(PACKAGE_BUILDING) || defined(BATCH) || \
	exists(${_OPTIONSFILE}) || exists(${_OPTIONSFILE}.local))
_OPTIONS_OK=yes
.endif

################################################################
# The following are used to create easy dummy targets for
# disabling some bit of default target behavior you don't want.
# They still check to see if the target exists, and if so don't
# do anything, since you might want to set this globally for a
# group of ports in a Makefile.inc, but still be able to
# override from an individual Makefile.
################################################################

# Disable checksum
.if defined(NO_CHECKSUM) && !target(checksum)
checksum: fetch
	@${DO_NADA}
.endif

# Disable build
.if defined(NO_BUILD) && !target(build)
build: configure
	@${TOUCH} ${TOUCH_FLAGS} ${BUILD_COOKIE}
.endif

# Disable install
.if defined(NO_INSTALL) && !target(install)
install: build
	@${TOUCH} ${TOUCH_FLAGS} ${INSTALL_COOKIE}
.endif

# Disable package
.if defined(NO_PACKAGE) && !target(package)
package:
.if defined(IGNORE_SILENT)
	@${DO_NADA}
.else
	@${ECHO_MSG} "===>  ${PKGNAME} may not be packaged: "${NO_PACKAGE:Q}.
.endif
.endif

# Disable describe
.if defined(NO_DESCRIBE) && !target(describe)
describe:
	@${DO_NADA}
.endif

################################################################
# More standard targets start here.
#
# These are the body of the build/install framework.  If you are
# not happy with the default actions, and you can't solve it by
# adding pre-* or post-* targets/scripts, override these.
################################################################

# Pre-everything

# XXX MCL suggests deprecating this in favor of something
# less likely to be abused by overloading
pre-everything::
	@${DO_NADA}

buildanyway-message:
.if defined(TRYBROKEN) && defined(BROKEN)
	@${ECHO_MSG} "Trying build of ${PKGNAME} even though it is marked BROKEN."
.else
	@${DO_NADA}
.endif

options-message:
.if defined(GNOME_OPTION_MSG) && (!defined(PACKAGE_BUILDING) || !defined(BATCH))
	@for m in ${GNOME_OPTION_MSG}; do \
		${ECHO_MSG} $$m; \
	done
.else
	@${DO_NADA}
.endif
.if defined(_OPTIONS_READ)
	@${ECHO_MSG} "===>  Found saved configuration for ${_OPTIONS_READ}"
.if ${OPTIONSFILE} != ${_OPTIONSFILE}
	@${ECHO_MSG} "===>  *** CAUTION *** Using wrong configuration file ${_OPTIONSFILE}"
.endif
.endif


#
# List of valid licenses
#
.if !target(license-list)
license-list:
	@${ECHO_MSG} ${_LICENSES} 
.endif


# Warn user about deprecated packages.  Advisory only.

.if !target(check-deprecated)
check-deprecated:
.if defined(DEPRECATED)
	@${ECHO_MSG} "===>   NOTICE:"
	@${ECHO_MSG}
	@${ECHO_MSG} "This port is deprecated; you may wish to reconsider installing it:"
	@${ECHO_MSG}
	@${ECHO_MSG} ${DEPRECATED:Q}.
	@${ECHO_MSG}
.if defined(EXPIRATION_DATE)
	@${ECHO_MSG} "It is scheduled to be removed on or after ${EXPIRATION_DATE}."
	@${ECHO_MSG}
.endif
.endif
.endif

# Check if the port is listed in the vulnerability database

AUDITFILE?=		/var/db/portaudit/auditfile.tbz
_EXTRACT_AUDITFILE=	${TAR} -jxOf "${AUDITFILE}" auditfile

check-vulnerable:
.if !defined(DISABLE_VULNERABILITIES) && !defined(PACKAGE_BUILDING)
	@if [ -f "${AUDITFILE}" ]; then \
		audit_created=`${_EXTRACT_AUDITFILE} | \
			${SED} -nEe "1s/^#CREATED: *([0-9]{4})-?([0-9]{2})-?([0-9]{2}).*$$/\1\2\3/p"`; \
		audit_expiry=`/bin/date -u -v-14d "+%Y%m%d"`; \
		if [ "$$audit_created" -lt "$$audit_expiry" ]; then \
			${ECHO_MSG} "===>  WARNING: Vulnerability database out of date, checking anyway"; \
		fi; \
		vlist=`${_EXTRACT_AUDITFILE} | ${GREP} "${PORTNAME}" | \
			${AWK} -F\| ' /^[^#]/ { \
				if (!system("${PKG_VERSION} -T \"${PKGNAME}\" \"" $$1 "\"")) \
					print "=> " $$3 ".\n   Reference: <" $$2 ">" \
			} \
		'`; \
		if [ -n "$$vlist" ]; then \
			${ECHO_MSG} "===>  ${PKGNAME} has known vulnerabilities:"; \
			${ECHO_MSG} "$$vlist"; \
			${ECHO_MSG} "=> Please update your ports tree and try again."; \
			exit 1; \
		fi; \
	else \
		${ECHO_MSG} "===>  Vulnerability check disabled, database not found"; \
	fi
.endif

# Fetch

.if !target(do-fetch)
do-fetch:
	@${MKDIR} ${_DISTDIR}
	@(cd ${_DISTDIR}; \
	 ${_MASTER_SITES_ENV} ; \
	 for _file in ${DISTFILES}; do \
		file=`${ECHO_CMD} $$_file | ${SED} -E -e 's/:[^:]+$$//'` ; \
		select=`${ECHO_CMD} $${_file#$${file}} | ${SED} -e 's/^://' -e 's/,/ /g'` ; \
		force_fetch=false; \
		filebasename=`${BASENAME} $$file`; \
		for afile in ${FORCE_FETCH}; do \
			afile=`${BASENAME} $$afile`; \
			if [ "x$$afile" = "x$$filebasename" ]; then \
				force_fetch=true; \
			fi; \
		done; \
		if [ ! -f $$file -a ! -f $$filebasename -o "$$force_fetch" = "true" ]; then \
			DIR=${DIST_SUBDIR}; \
			pattern="$${DIR:+$$DIR/}`${ECHO_CMD} $$file | ${SED} -e 's/\./\\\\./g'`"; \
			if [ -L $$file -o -L $$filebasename ]; then \
				${ECHO_MSG} "=> ${_DISTDIR}/$$file is a broken symlink."; \
				${ECHO_MSG} "=> Perhaps a filesystem (most likely a CD) isn't mounted?"; \
				${ECHO_MSG} "=> Please correct this problem and try again."; \
				exit 1; \
			fi ; \
			if [ -f ${MD5_FILE} -a "x${NO_CHECKSUM}" = "x" ]; then \
				if ! ${GREP} -q "^MD5 ($$pattern)" ${MD5_FILE}; then \
					${ECHO_MSG} "=> $${DIR:+$$DIR/}$$file is not in ${MD5_FILE}."; \
					${ECHO_MSG} "=> Either ${MD5_FILE} is out of date, or"; \
					${ECHO_MSG} "=> $${DIR:+$$DIR/}$$file is spelled incorrectly."; \
					exit 1; \
				fi; \
			fi; \
			${ECHO_MSG} "=> $$file doesn't seem to exist in ${_DISTDIR}."; \
			if [ ! -w ${DISTDIR} ]; then \
			   ${ECHO_MSG} "=> ${DISTDIR} is not writable by you; cannot fetch."; \
			   exit 1; \
			fi; \
			if [ ! -z "$$select" ] ; then \
				__MASTER_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_MASTER_SITES_$${group}} ] ; then \
						eval ___MASTER_SITES_TMP="\$${_MASTER_SITES_$${group}}" ; \
						__MASTER_SITES_TMP="$${__MASTER_SITES_TMP} $${___MASTER_SITES_TMP}" ; \
					fi \
				done; \
				___MASTER_SITES_TMP= ; \
				SORTED_MASTER_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__MASTER_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_MASTER_SITES_CMD_TMP="${SORTED_MASTER_SITES_DEFAULT_CMD}" ; \
			fi ; \
			for site in `eval $$SORTED_MASTER_SITES_CMD_TMP ${_RANDOMIZE_SITES}`; do \
			    ${ECHO_MSG} "=> Attempting to fetch from $${site}."; \
				DIR=${DIST_SUBDIR}; \
				CKSIZE=`${GREP} "^SIZE ($${DIR:+$$DIR/}$$file)" ${MD5_FILE} | ${AWK} '{print $$4}'`; \
				case $${file} in \
				*/*)	${MKDIR} $${file%/*}; \
						args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				if ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} ${FETCH_AFTER_ARGS}; then \
					continue 2; \
				fi \
			done; \
			${ECHO_MSG} "=> Couldn't fetch it - please try to retrieve this";\
			${ECHO_MSG} "=> port manually into ${_DISTDIR} and try again."; \
			exit 1; \
	    fi \
	 done)
.if defined(PATCHFILES)
	@(cd ${_DISTDIR}; \
	 ${_PATCH_SITES_ENV} ; \
	 for _file in ${PATCHFILES}; do \
		file=`${ECHO_CMD} $$_file | ${SED} -E -e 's/:[^:]+$$//'` ; \
		select=`${ECHO_CMD} $${_file#$${file}} | ${SED} -e 's/^://' -e 's/,/ /g'` ; \
		force_fetch=false; \
		filebasename=`${BASENAME} $$file`; \
		for afile in ${FORCE_FETCH}; do \
			afile=`${BASENAME} $$afile`; \
			if [ "x$$afile" = "x$$filebasename" ]; then \
				force_fetch=true; \
			fi; \
		done; \
		if [ ! -f $$file -a ! -f $$filebasename -o "$$force_fetch" = "true" ]; then \
			if [ -L $$file -o -L `${BASENAME} $$file` ]; then \
				${ECHO_MSG} "=> ${_DISTDIR}/$$file is a broken symlink."; \
				${ECHO_MSG} "=> Perhaps a filesystem (most likely a CD) isn't mounted?"; \
				${ECHO_MSG} "=> Please correct this problem and try again."; \
				exit 1; \
			fi ; \
			${ECHO_MSG} "=> $$file doesn't seem to exist in ${_DISTDIR}."; \
			if [ ! -z "$$select" ] ; then \
				__PATCH_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_PATCH_SITES_$${group}} ] ; then \
						eval ___PATCH_SITES_TMP="\$${_PATCH_SITES_$${group}}" ; \
						__PATCH_SITES_TMP="$${__PATCH_SITES_TMP} $${___PATCH_SITES_TMP}" ; \
					fi \
				done; \
				___PATCH_SITES_TMP= ; \
				SORTED_PATCH_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__PATCH_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_PATCH_SITES_CMD_TMP="${SORTED_PATCH_SITES_DEFAULT_CMD}" ; \
			fi ; \
			for site in `eval $$SORTED_PATCH_SITES_CMD_TMP`; do \
			    ${ECHO_MSG} "=> Attempting to fetch from $${site}."; \
				DIR=${DIST_SUBDIR}; \
				pattern="$${DIR:+$$DIR/}`${ECHO_CMD} $$file | ${SED} -e 's/\./\\\\./g'`"; \
				CKSIZE=`${GREP} "^SIZE ($$pattern)" ${MD5_FILE} | ${AWK} '{print $$4}'`; \
				case $${file} in \
				*/*)	${MKDIR} $${file%/*}; \
						args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				if ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} ${FETCH_AFTER_ARGS}; then \
					continue 2; \
				fi \
			done; \
			${ECHO_MSG} "=> Couldn't fetch it - please try to retrieve this";\
			${ECHO_MSG} "=> port manually into ${_DISTDIR} and try again."; \
			exit 1; \
	    fi \
	 done)
.endif
.endif

#
# Extract
#
.if !target(do-extract)
do-extract:
	@${RM} -rf ${WRKDIR}
	@${MKDIR} ${WRKDIR}
	@for file in ${EXTRACT_ONLY}; do \
		if ! (cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/$$file ${EXTRACT_AFTER_ARGS});\
		then \
			exit 1; \
		fi \
	done
.if !defined(EXTRACT_PRESERVE_OWNERSHIP)
	@if [ `${ID} -u` = 0 ]; then \
		${CHMOD} -R ug-s ${WRKDIR}; \
		${CHOWN} -R 0:0 ${WRKDIR}; \
	fi
.endif
.endif


.if !target(check-license) 
.if defined(MPORT_MAINTAINER_MODE)
check-license:
.if !defined(LICENSE) 
	@${ECHO_MSG} "${PKGNAME}: Makefile error: LICENSE not set."
	@sleep 5
.else
	@if ! ${ECHO_CMD} ${_LICENSES} | ${GREP} ${LICENSE} >/dev/null; then \
		${ECHO_MSG} "${PKGNAME}: Makefile error: Invalid LICENSE: ${LICENSE}"; \
		sleep 5; \
	else \
		${DO_NADA}; \
	fi
.endif
.else 
check-license:
	@${DO_NADA}
.endif
.endif
	


#
# Patch
#
.if !target(patch-dos2unix)
patch-dos2unix:
.if defined(USE_DOS2UNIX)
.if ${USE_DOS2UNIX:U}=="YES"
	@${ECHO_MSG} "===>   Converting DOS text files to UNIX text files"
	@${FIND} ${WRKSRC} -type f -print0 | \
			${XARGS} -0 ${REINPLACE_CMD} -i '' -e 's/$$//'
.else
.for f in ${USE_DOS2UNIX}
	@${ECHO_MSG} "===>   Converting DOS text file to UNIX text file: ${f}"
	@${REINPLACE_CMD} -i '' -e 's/$$//' ${WRKSRC}/${f}
.endfor
.endif
.else
	@${DO_NADA}
.endif
.endif

.if !target(do-patch)
do-patch:
.if defined(PATCHFILES)
	@${ECHO_MSG} "===>  Applying distribution patches for ${PKGNAME}"
	@(cd ${_DISTDIR}; \
	  for i in ${_PATCHFILES}; do \
		if [ ${PATCH_DEBUG_TMP} = yes ]; then \
			${ECHO_MSG} "===>   Applying distribution patch $$i" ; \
		fi; \
		case $$i in \
			*.Z|*.gz) \
				${GZCAT} $$i | ${PATCH} ${PATCH_DIST_ARGS}; \
				;; \
			*.bz2) \
				${BZCAT} $$i | ${PATCH} ${PATCH_DIST_ARGS}; \
				;; \
			*) \
				${PATCH} ${PATCH_DIST_ARGS} < $$i; \
				;; \
		esac; \
	  done)
.endif
.if defined(EXTRA_PATCHES)
	@for i in ${EXTRA_PATCHES}; do \
		${ECHO_MSG} "===>  Applying extra patch $$i"; \
		${PATCH} ${PATCH_ARGS} < $$i; \
	done
.endif
	@if [ -d ${PATCHDIR} ]; then \
		if [ "`${ECHO_CMD} ${PATCHDIR}/patch-*`" != "${PATCHDIR}/patch-*" ]; then \
			${ECHO_MSG} "===>  Applying ${OPSYS} patches for ${PKGNAME}" ; \
			PATCHES_APPLIED="" ; \
			for i in ${PATCHDIR}/patch-*; do \
				case $$i in \
					*.orig|*.rej|*~|*,v) \
						${ECHO_MSG} "===>   Ignoring patchfile $$i" ; \
						;; \
					*) \
						if [ ${PATCH_DEBUG_TMP} = yes ]; then \
							${ECHO_MSG} "===>   Applying ${OPSYS} patch $$i" ; \
						fi; \
						if ${PATCH} ${PATCH_ARGS} < $$i ; then \
							PATCHES_APPLIED="$$PATCHES_APPLIED $$i" ; \
						else \
							${ECHO_MSG} `${ECHO_CMD} "=> Patch $$i failed to apply cleanly." | ${SED} "s|${PATCHDIR}/||"` ; \
							if [ x"$$PATCHES_APPLIED" != x"" ]; then \
								${ECHO_MSG} `${ECHO_CMD} "=> Patch(es) $$PATCHES_APPLIED applied cleanly." | ${SED} "s|${PATCHDIR}/||g"` ; \
							fi; \
							${FALSE} ; \
						fi; \
						;; \
				esac; \
			done; \
		fi; \
	fi
.endif

.if !target(run-autotools)
run-autotools:
	@${DO_NADA}
.endif

# Configure

.if !target(do-configure)
do-configure:
	@if [ -f ${SCRIPTDIR}/configure ]; then \
		cd ${.CURDIR} && ${SETENV} ${SCRIPTS_ENV} ${SH} \
		  ${SCRIPTDIR}/configure; \
	fi
.if defined(GNU_CONFIGURE)
	@CONFIG_GUESS_DIRS=$$(${FIND} ${WRKDIR} -name config.guess -o -name config.sub \
		| ${XARGS} -n 1 ${DIRNAME}); \
	for _D in $${CONFIG_GUESS_DIRS}; do \
		${CP} -f ${TEMPLATES}/config.guess $${_D}/config.guess; \
		${CHMOD} a+rx $${_D}/config.guess; \
	    ${CP} -f ${TEMPLATES}/config.sub $${_D}/config.sub; \
		${CHMOD} a+rx $${_D}/config.sub; \
	done
.endif
.if defined(HAS_CONFIGURE)
	@(cd ${CONFIGURE_WRKSRC} && \
		if ! ${SETENV} CC="${CC}" CXX="${CXX}" \
	    CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" \
	    INSTALL="/usr/bin/install -c ${_BINOWNGRP}" \
	    INSTALL_DATA="${INSTALL_DATA}" \
	    INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
	    INSTALL_SCRIPT="${INSTALL_SCRIPT}" \
	    ${CONFIGURE_ENV} ./${CONFIGURE_SCRIPT} ${CONFIGURE_ARGS}; then \
			 ${ECHO_MSG} "===>  Script \"${CONFIGURE_SCRIPT}\" failed unexpectedly."; \
			 (${ECHO_MSG} ${CONFIGURE_FAIL_MESSAGE}) | ${FMT} 75 79 ; \
			 ${FALSE}; \
		fi)
.endif
.if defined(USE_IMAKE)
	@(cd ${CONFIGURE_WRKSRC}; ${SETENV} ${MAKE_ENV} ${XMKMF})
.endif
.endif

# Build

.if !target(do-build)
do-build:
.if defined(USE_GMAKE)
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${GMAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${ALL_TARGET})
.else
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${MAKE} ${MAKE_FLAGS} ${MAKEFILE} ${MAKE_ARGS} ${ALL_TARGET})
.endif
.endif


# 
# Fake
#

.if !target(fake-dir) 
fake-dir:
	@${INSTALL} -d -m 755 -o root -g wheel ${FAKE_DESTDIR}${PREFIX}  
.if !defined(NO_MTREE)
	@${MTREE_CMD} ${MTREE_ARGS} ${FAKE_DESTDIR}${PREFIX} >/dev/null
.	if ${MTREE_FILE} == "/etc/mtree/BSD.local.dist" 
		@cd ${FAKE_DESTDIR}${PREFIX}/share/nls; \
		${LN} -shf C POSIX; \
		${LN} -shf C en_US.US-ASCII; 
.	endif
.	if defined(USE_LINUX) && ${PREFIX} != ${LINUXBASE_REL} 
		@${INSTALL} -d -m 755 -o root -g wheel ${FAKE_DESTDIR}${LINUXBASE_REL}
		@${MTREE_CMD} ${MTREE_LINUX_ARGS} ${FAKE_DESTDIR}${LINUXBASE_REL} > /dev/null
.	endif
.endif
.endif


.if !target(fake-install)
fake-install:
.	if target(pre-install)
		@cd ${.CURDIR} && exec ${MAKE} pre-install ${FAKE_SETUP}
.	endif
# 	This is where the old FreeBSD bsd.port.mk made the tmpplist, we'll do it
# 	here as well so that everyone is happy.
	@cd ${.CURDIR} && exec ${MAKE} generate-plist
.	if target(pre-su-install)
		@${ECHO_MSG} "===>   WARNING: pre-su-install is deprecated. Use pre-install instead."
		@cd ${.CURDIR} && exec ${MAKE} pre-su-install ${FAKE_SETUP}
.	endif
.	if target(do-install)
		@cd ${.CURDIR} && exec ${MAKE} do-install ${FAKE_SETUP}
.	else
#	Normal builds.
		@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
			${_MAKE_CMD} -f ${MAKEFILE} ${FAKE_MAKEARGS} ${FAKE_TARGET};
.		if defined(USE_IMAKE) && !defined(NO_INSTALL_MANPAGES)
			@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${FAKE_SETUP}\
				${_MAKE_CMD} -f ${MAKEFILE} ${FAKE_MAKEARGS} install.man
.		endif
.	endif
.	if target(post-install)
		@cd ${.CURDIR} && exec ${MAKE} post-install ${FAKE_SETUP}
.	endif
.endif


.if !target(fix-fake-symlinks) 
fix-fake-symlinks:
	-@cd ${FAKE_DESTDIR}${PREFIX}; \
	links=`${FIND} . -type l | ${GREP} -v -e 'share/nls/POSIX\|share/nls/en_US.US-ASCII`; \
	for link in $$links; do \
		if ! readlink $$link | grep ${FAKE_DESTDIR} >/dev/null; then \
			continue; \
		fi; \
		source=`readlink $$link | ${SED} -e 's|${FAKE_DESTDIR}||'`; \
		${RM} $$link; \
		${LN} -s $$source $$link; \
	done 
.	if defined(USE_LINUX) && ${PREFIX} != ${LINUXBASE_REL}
		@cd ${.CURDIR} && ${MAKE} PREFIX=${LINUXBASE_REL} ${.TARGET}
.	endif
.endif

#
# Package
#

.if !target(do-package)
do-package: ${TMPPLIST}
	@if ! ${MKDIR} -p ${PKGREPOSITORY}; then \
		${ECHO_MSG} "=> Can't create directory ${PKGREPOSITORY}."; \
		exit 1; \
	fi; 
	@__softMAKEFLAGS='${__softMAKEFLAGS:S/'/'\''/g}'; \
	_LATE_PKG_ARGS=""; \
	if [ -f ${PKGINSTALL} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -i ${PKGINSTALL}"; \
	fi; \
	if [ -f ${PKGDEINSTALL} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -k ${PKGDEINSTALL}"; \
	fi; \
	if [ -f ${PKGREQ} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -r ${PKGREQ}"; \
	fi; \
	if [ -f ${PKGMESSAGE} ]; then \
		_LATE_PKG_ARGS="$${_LATE_PKG_ARGS} -D ${PKGMESSAGE}"; \
	fi; \
	if ${PKG_CMD} -v ${PKG_ARGS} ${PKGFILE} >/dev/null; then \
		${ECHO_MSG} "Created ${PKGFILE}"; \
		cd ${.CURDIR} && eval ${MAKE} $${__softMAKEFLAGS} package-links; \
	else \
		cd ${.CURDIR} && eval ${MAKE} $${__softMAKEFLAGS} delete-package; \
		exit 1; \
	fi
.endif

# Some support rules for do-package

.if !target(package-links)
package-links: delete-package-links
	@for cat in ${CATEGORIES}; do \
		if [ ! -d ${PACKAGES}/$$cat ]; then \
			if ! ${MKDIR} ${PACKAGES}/$$cat; then \
				${ECHO_MSG} "=> Can't create directory ${PACKAGES}/$$cat."; \
				exit 1; \
			fi; \
		fi; \
		${ECHO_MSG} "Link to ${PACKAGES}/$$cat/${PKGNAME}${PKG_SUFX}"; \
		${LN} -sf ${PKGFILE} ${PACKAGES}/$$cat; \
	done
.if !defined(NO_LATEST_LINK)
	@if [ ! -d ${PKGLATESTREPOSITORY} ]; then \
		if ! ${MKDIR} ${PKGLATESTREPOSITORY}; then \
			${ECHO_MSG} "=> Can't create directory ${PKGLATESTREPOSITORY}."; \
			exit 1; \
		fi; \
	fi
	@${ECHO_MSG} "Link to ${PKGLATESTREPOSITORY}/${PKGNAME}${PKG_SUFX}"
	@${LN} -s ${PKGFILE} ${PKGLATESTFILE}
.endif
.endif

.if !target(delete-package-links)
delete-package-links:
	@for cat in ${CATEGORIES}; do \
		${RM} -f ${PACKAGES}/$$cat/${PKGNAME}${PKG_SUFX}; \
	done
.if !defined(NO_LATEST_LINK)
	@${RM} -f ${PKGLATESTFILE}
.endif
.endif

.if !target(delete-package)
delete-package: delete-package-links
	@${RM} -f ${PKGFILE}
.endif

.if !target(delete-package-links-list)
delete-package-links-list:
	@for cat in ${CATEGORIES}; do \
		${ECHO_CMD} ${RM} -f ${PACKAGES}/$$cat/${PKGNAME}${PKG_SUFX}; \
	done
.if !defined(NO_LATEST_LINK)
	@${ECHO_CMD} ${RM} -f ${PKGLATESTFILE}
.endif
.endif

.if !target(delete-package-list)
delete-package-list: delete-package-links-list
	@${ECHO_CMD} "[ -f ${PKGFILE} ] && (${ECHO_CMD} deleting ${PKGFILE}; ${RM} -f ${PKGFILE})"
.endif


#
# This is the "real" install.  Really.  Not kidding.
#
.if !target(install-package)
install-package:
.	if defined(DESTDIR) 
		@${CP} ${PKGFILE} ${DISTDIR}${PKGFILE}
.	endif
# $PKG_ADD calls chroot if DESTDIR is set.
	@${SETENV} PKG_PATH=${PKGREPOSITORY} ${PKG_ADD} ${PKGNAME}
.endif


#
# This is used by dependcies to install.  If ${PKGFILE} exists, we can just 
# install that.  Otherwise, we need to build and install like normal.
#
.if !target(cached-install)
cached-install:
.	if exists(${PKGFILE})
		@cd ${.CURDIR} && ${MAKE} ${_INSTALL_SEQ}
.	else
#		If the package was deleted, and clean wasn't run, we need to make sure
#		that the port doesn't think the package is there.
		@cd ${.CURDIR} && rm -f ${PACKAGE_COOKIE} ${INSTALL_COOKIE}
		@cd ${.CURDIR} && ${MAKE} install
.	endif		
.endif

#
# Utility targets follow
#
.if !target(check-umask)
check-umask:
	@if [ `${SH} -c umask` != 0022 ]; then \
		${ECHO_MSG} "===>  Warning: your umask is \"`${SH} -c umask`"\".; \
		${ECHO_MSG} "      If this is not desired, set it to an appropriate value"; \
		${ECHO_MSG} "      and install this port again by \`\`make reinstall''."; \
	fi
.endif


.if !target(security-check)
.if !defined(OLD_SECURITY_CHECK)

security-check:
# Scan PLIST for:
#   1.  setugid files
#   2.  accept()/recvfrom() which indicates network listening capability
#   3.  insecure functions (gets/mktemp/tempnam/[XXX])
#   4.  startup scripts, in conjunction with 2.
#   5.  world-writable files/dirs
#
	-@${RM} -f ${WRKDIR}/.PLIST.setuid ${WRKDIR}/.PLIST.writable ${WRKDIR}/.PLIST.objdump; \
	${AWK} -v prefix='${PREFIX}' ' \
		match($$0, /^@cwd /) { prefix = substr($$0, RSTART + RLENGTH); if (prefix == "/") prefix=""; next; } \
		/^@/ { next; } \
		/^\// { print; next; } \
		{ print prefix "/" $$0; } \
	' ${TMPPLIST} > ${WRKDIR}/.PLIST.flattened; \
	${TR} '\n' '\0' < ${WRKDIR}/.PLIST.flattened \
	| ${XARGS} -0 -J % ${FIND} % -prune ! -type l -type f \( -perm -4000 -o -perm -2000 \) \( -perm -0010 -o -perm -0001 \) 2> /dev/null > ${WRKDIR}/.PLIST.setuid; \
	${TR} '\n' '\0' < ${WRKDIR}/.PLIST.flattened \
	| ${XARGS} -0 -J % ${FIND} % -prune -perm -0002 \! -type l 2> /dev/null > ${WRKDIR}/.PLIST.writable; \
	${TR} '\n' '\0' < ${WRKDIR}/.PLIST.flattened \
	| ${XARGS} -0 -J % ${FIND} % -prune ! -type l -type f -print0 2> /dev/null \
	| ${XARGS} -0 -n 1 ${OBJDUMP} -R 2> /dev/null > ${WRKDIR}/.PLIST.objdump; \
	if \
		! ${AWK} -v audit="$${PORTS_AUDIT}" -v destdir="${DESTDIR}" -f ${PORTSDIR}/Tools/scripts/security-check.awk \
		  ${WRKDIR}/.PLIST.flattened ${WRKDIR}/.PLIST.objdump ${WRKDIR}/.PLIST.setuid ${WRKDIR}/.PLIST.writable; \
	then \
		www_site=$$(cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} www-site); \
	    if [ ! -z "$${www_site}" ]; then \
			${ECHO_MSG}; \
			${ECHO_MSG} "      For more information, and contact details about the security"; \
			${ECHO_MSG} "      status of this software, see the following webpage: "; \
			${ECHO_MSG} "$${www_site}"; \
		fi; \
	fi


.else # i.e. defined(OLD_SECURITY_CHECK)

security-check:
# Scan PLIST for:
#   1.  setugid files
#   2.  accept()/recvfrom() which indicates network listening capability
#   3.  insecure functions (gets/mktemp/tempnam/[XXX])
#   4.  startup scripts, in conjunction with 2.
#   5.  world-writable files/dirs
#
	-@${RM} -f ${WRKDIR}/.PLIST.setuid ${WRKDIR}/.PLIST.stupid \
		${WRKDIR}/.PLIST.network ${WRKDIR}/.PLIST.writable; \
	if [ -n "$$PORTS_AUDIT" ]; then \
		stupid_functions_regexp=' (gets|mktemp|tempnam|tmpnam|strcpy|strcat|sprintf)$$'; \
	else \
		stupid_functions_regexp=' (gets|mktemp|tempnam|tmpnam)$$'; \
	fi; \
	for i in `${GREP} -v '^@' ${TMPPLIST}`; do \
		if [ ! -L "${PREFIX}/$$i" -a -f "${PREFIX}/$$i" ]; then \
			${OBJDUMP} -R ${PREFIX}/$$i > \
				${WRKDIR}/.PLIST.objdump 2> /dev/null; \
			if [ -s ${WRKDIR}/.PLIST.objdump ] ; then \
				${EGREP} " $$stupid_functions_regexp" \
					${WRKDIR}/.PLIST.objdump | ${AWK} '{print " " $$3}' | ${TR} -d '\n' \
					> ${WRKDIR}/.PLIST.stupid; \
				if [ -n "`${EGREP} ' (accept|recvfrom)$$' ${WRKDIR}/.PLIST.objdump`" ] ; then \
					if [ -s ${WRKDIR}/.PLIST.stupid ]; then \
						${ECHO_MSG} -n "${PREFIX}/$$i (USES POSSIBLY INSECURE FUNCTIONS:" >> ${WRKDIR}/.PLIST.network; \
						${CAT} ${WRKDIR}/.PLIST.stupid >> ${WRKDIR}/.PLIST.network; \
						${ECHO_CMD} ")" >> ${WRKDIR}/.PLIST.network; \
					else \
						${ECHO_CMD} ${PREFIX}/$$i >> ${WRKDIR}/.PLIST.network; \
					fi; \
				fi; \
			fi; \
			if [ -n "`${FIND} ${PREFIX}/$$i -prune \( -perm -4000 -o -perm -2000 \) \( -perm -0010 -o -perm -0001 \) 2>/dev/null`" ]; then \
				if [ -s ${WRKDIR}/.PLIST.stupid ]; then \
					${ECHO_MSG} -n "${PREFIX}/$$i (USES POSSIBLY INSECURE FUNCTIONS:" >> ${WRKDIR}/.PLIST.setuid; \
					${CAT} ${WRKDIR}/.PLIST.stupid >> ${WRKDIR}/.PLIST.setuid; \
					${ECHO_CMD} ")" >> ${WRKDIR}/.PLIST.setuid; \
				else \
					${ECHO_CMD} ${PREFIX}/$$i >> ${WRKDIR}/.PLIST.setuid; \
				fi; \
			fi; \
		fi; \
		if [ ! -L "${PREFIX}/$$i" ]; then \
			if [ -n "`${FIND} ${PREFIX}/$$i -prune -perm -0002 \! -type l 2>/dev/null`" ]; then \
				 ${ECHO_CMD} ${PREFIX}/$$i >> ${WRKDIR}/.PLIST.writable; \
			fi; \
		fi; \
	done; \
	${GREP} '^etc/rc.d/' ${TMPPLIST} > ${WRKDIR}/.PLIST.startup; \
	if [ -s ${WRKDIR}/.PLIST.setuid -o -s ${WRKDIR}/.PLIST.network -o -s ${WRKDIR}/.PLIST.writable ]; then \
		if [ -n "$$PORTS_AUDIT" ]; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "===>  SECURITY REPORT (PARANOID MODE): "; \
			else \
				${ECHO_MSG} "===>  SECURITY REPORT FOR ${DESTDIR} (PARANOID MODE): "; \
			fi; \
		else \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "===>  SECURITY REPORT: "; \
			else \
				${ECHO_MSG} "===>  SECURITY REPORT FOR ${DESTDIR}: "; \
			fi; \
		fi; \
		if [ -s ${WRKDIR}/.PLIST.setuid ] ; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "      This port has installed the following binaries,"; \
			else \
				${ECHO_MSG} "      This port has installed the following binaries into ${DESTDIR},"; \
			fi; \
			${ECHO_MSG} "      which execute with increased privileges."; \
			${CAT} ${WRKDIR}/.PLIST.setuid; \
			${ECHO_MSG}; \
		fi; \
		if [ -s ${WRKDIR}/.PLIST.network ] ; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "      This port has installed the following files, which may act as network"; \
				${ECHO_MSG} "      servers and may therefore pose a remote security risk to the system."; \
			else \
				${ECHO_MSG} "      This port has installed the following files into ${DESTDIR}, which may"; \
				${ECHO_MSG} "      act as network servers and may therefore pose a remote security risk to"; \
				${ECHO_MSG} "      the system."; \
			fi; \
			${CAT} ${WRKDIR}/.PLIST.network; \
			${ECHO_MSG}; \
			if [ -s ${WRKDIR}/.PLIST.startup ] ; then \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "      This port has installed the following startup scripts,"; \
				else \
					${ECHO_MSG} "      This port has installed the following startup scripts into ${DESTDIR},"; \
				fi; \
				${ECHO_MSG} "      which may cause these network services to be started at boot time."; \
				${SED} s,^,${PREFIX}/, < ${WRKDIR}/.PLIST.startup; \
				${ECHO_MSG}; \
			fi; \
		fi; \
		if [ -s ${WRKDIR}/.PLIST.writable ] ; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "      This port has installed the following world-writable files/directories."; \
			else \
				${ECHO_MSG} "      This port has installed the following world-writable files/directories"; \
				${ECHO_MSG} "      into ${DESTDIR}."; \
			fi; \
			${CAT} ${WRKDIR}/.PLIST.writable; \
			${ECHO_MSG}; \
		fi; \
		${ECHO_MSG} "      If there are vulnerabilities in these programs there may be a security"; \
		${ECHO_MSG} "      risk to the system. The FreeBSD Project makes no guarantee about the"; \
		${ECHO_MSG} "      security of ports included in the Ports Collection."; \
		${ECHO_MSG} "      Please type 'make deinstall' to deinstall the port if this is a concern."; \
		www_site=$$(cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} www-site); \
	    if [ ! -z "$${www_site}" ]; then \
			${ECHO_MSG}; \
			${ECHO_MSG} "      For more information, and contact details about the security"; \
			${ECHO_MSG} "      status of this software, see the following webpage: "; \
			${ECHO_MSG} "$${www_site}"; \
		fi; \
	fi
.endif # !defined(OLD_SECURITY_CHECK)
.endif

################################################################
# Skeleton targets start here
#
# You shouldn't have to change these.  Either add the pre-* or
# post-* targets/scripts or redefine the do-* targets.  These
# targets don't do anything other than checking for cookies and
# call the necessary targets/scripts.
################################################################

# Please note that the order of the following targets is important, and
# should not be modified.

_SANITY_SEQ=	pre-everything check-makefile check-categories \
				check-makevars check-desktop-entries check-depends \
				check-deprecated check-vulnerable buildanyway-message \
				options-message

_FETCH_DEP=		check-sanity
_FETCH_SEQ=		fetch-depends pre-fetch pre-fetch-script \
				do-fetch post-fetch post-fetch-script

_EXTRACT_DEP=	fetch
_EXTRACT_SEQ=	extract-message checksum extract-depends pre-extract \
				pre-extract-script do-extract \
				post-extract post-extract-script 

_PATCH_DEP=		extract
_PATCH_SEQ=		patch-message check-license patch-depends patch-dos2unix \
				pre-patch pre-patch-script do-patch post-patch post-patch-script

_CONFIGURE_DEP=	patch
_CONFIGURE_SEQ=	build-depends lib-depends misc-depends configure-message \
				pre-configure pre-configure-script \
				run-autotools do-configure post-configure post-configure-script

_BUILD_DEP=		configure
_BUILD_SEQ=		build-message pre-build pre-build-script do-build \
				post-build post-build-script

_FAKE_DEP=		build
_FAKE_SEQ=		fake-message fake-dir apply-slist pre-fake fake-install \
				post-fake compress-man install-rc-script install-ldconfig-file \
				fix-fake-symlinks finish-tmpplist

.if defined(MPORT_MAINTAINER_MODE)
_FAKE_SEQ+=		check-fake
.endif

_PACKAGE_DEP=	fake
_PACKAGE_SEQ=	package-message pre-package pre-package-script \
				do-package post-package post-package-script 

_INSTALL_DEP=	package
# Not sure how we want to handle sudo/su.  Will figure out later - triv.
_INSTALL_SEQ=	install-message run-depends lib-depends install-package done-message


.if !target(check-sanity)
check-sanity: ${_SANITY_SEQ}
.endif

# XXX MCL might need to move in loop below?
.if !target(fetch)
fetch: ${_FETCH_DEP} ${_FETCH_SEQ}
.endif

# Main logic. The loop generates 6 main targets and using cookies
# ensures that those already completed are skipped.

.for target in extract patch configure build fake package install

.if !target(${target}) && defined(_OPTIONS_OK)
${target}: ${${target:U}_COOKIE}
.elif !target(${target})
${target}: config 
	@cd ${.CURDIR} && ${MAKE} CONFIG_DONE=1 ${__softMAKEFLAGS} ${${target:U}_COOKIE}
.elif target(${target}) && defined(IGNORE)
.endif

.if !exists(${${target:U}_COOKIE})

.if ${UID} != 0 && defined(_${target:U}_SUSEQ) && !defined(INSTALL_AS_USER)
.if defined(USE_SUBMAKE)
${${target:U}_COOKIE}: ${_${target:U}_DEP}
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} ${_${target:U}_SEQ}
.else
${${target:U}_COOKIE}: ${_${target:U}_DEP} ${_${target:U}_SEQ}
.endif 
	@${ECHO_MSG} "===>  Switching to root credentials for '${target}' target"
	@cd ${.CURDIR} && \
		${SU_CMD} "${MAKE} ${__softMAKEFLAGS} ${_${target:U}_SUSEQ}"
	@${ECHO_MSG} "===>  Returning to user credentials"
	@${TOUCH} ${TOUCH_FLAGS} ${.TARGET}
.elif defined(USE_SUBMAKE)
${${target:U}_COOKIE}: ${_${target:U}_DEP}
	@cd ${.CURDIR} && \
		${MAKE} ${__softMAKEFLAGS} ${_${target:U}_SEQ} ${_${target:U}_SUSEQ}
	@${TOUCH} ${TOUCH_FLAGS} ${.TARGET}
.else
${${target:U}_COOKIE}: ${_${target:U}_DEP} ${_${target:U}_SEQ} ${_${target:U}_SUSEQ}
	@${TOUCH} ${TOUCH_FLAGS} ${.TARGET}
.endif

.else
${${target:U}_COOKIE}::
	@if [ -e ${.TARGET} ]; then \
		${DO_NADA}; \
	else \
		cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} ${.TARGET}; \
	fi
.endif

.endfor

# Enforce order for -jN builds

.ORDER: ${_SANITY_SEQ}
.ORDER: ${_FETCH_DEP} ${_FETCH_SEQ}
.ORDER: ${_EXTRACT_DEP} ${_EXTRACT_SEQ}
.ORDER: ${_PATCH_DEP} ${_PATCH_SEQ}
.ORDER: ${_CONFIGURE_DEP} ${_CONFIGURE_SEQ}
.ORDER: ${_BUILD_DEP} ${_BUILD_SEQ}
.ORDER: ${_FAKE_DEP} ${_FAKE_SEQ}
.ORDER: ${_PACKAGE_DEP} ${_PACKAGE_SEQ}
.ORDER: ${_INSTALL_DEP} ${_INSTALL_SEQ}

extract-message:
	@${ECHO_MSG} "===>  Extracting for ${PKGNAME}"
patch-message:
	@${ECHO_MSG} "===>  Patching for ${PKGNAME}"
configure-message:
	@${ECHO_MSG} "===>  Configuring for ${PKGNAME}"
build-message:
	@${ECHO_MSG} "===>  Building for ${PKGNAME}"
fake-message:
	@${ECHO_MSG} "===>  Faking install for ${PKGNAME}"
install-message:
.if !defined(DESTDIR)
	@${ECHO_MSG} "===>  Installing ${PKGFILE}"
.else
	@${ECHO_MSG} "===>  Installing ${PKGFILE} into ${DESTDIR}"
.endif
package-message:
	@${ECHO_MSG} "===>  Building package for ${PKGNAME}"
done-message:
	@${ECHO_MSG} "===>  Done."


# Empty pre-* and post-* targets

.for stage in pre post
.for name in check-sanity fetch extract patch configure build fake package 

.if !target(${stage}-${name})
${stage}-${name}:
	@${DO_NADA}
.endif

.if !target(${stage}-${name}-script)
${stage}-${name}-script:
	@if [ -f ${SCRIPTDIR}/${.TARGET:S/-script$//} ]; then \
		cd ${.CURDIR} && ${SETENV} ${SCRIPTS_ENV} ${SH} \
			${SCRIPTDIR}/${.TARGET:S/-script$//}; \
	fi
.endif

.endfor
.endfor


.if !target(pretty-print-www-site)
pretty-print-www-site:
	@www_site=$$(cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} www-site); \
	if [ -n "$${www_site}" ]; then \
		${ECHO_MSG} -n " and/or visit the "; \
		${ECHO_MSG} -n "<a href=\"$${www_site}\">web site</a>"; \
		${ECHO_MSG} " for futher informations"; \
	fi
.endif

################################################################
# Some more targets supplied for users' convenience
################################################################

# Checkpatch
#
# Special target to verify patches

.if !target(checkpatch)
checkpatch:
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} PATCH_CHECK_ONLY=yes ${_PATCH_DEP} ${_PATCH_SEQ}
.endif

# Reinstall
#
# Special target to re-run install

.if !target(reinstall)
reinstall:
	@${RM} -f ${INSTALL_COOKIE} 
	@cd ${.CURDIR} && DEPENDS_TARGET="${DEPENDS_TARGET}" ${MAKE} install
.endif

# refake
#
# Clear the fake dir and cookie, and do it again.
.if !target(refake)
refake:
	@${RM} -rf ${FAKE_DESTDIR} ${FAKE_COOKIE} ${PACKAGE_COOKIE}
	@cd ${.CURDIR} && ${MAKE} fake	
.endif


# Deinstall
#
# Special target to remove installation

.if !target(deinstall)
deinstall:
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@${ECHO_MSG} "===>  Switching to root credentials for '${.TARGET}' target"
	@cd ${.CURDIR} && \
		${SU_CMD} "${MAKE} ${__softMAKEFLAGS} ${.TARGET}"
	@${ECHO_MSG} "===>  Returning to user credentials"
.else
.if !defined(DESTDIR)
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN}"
.else
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN} from ${DESTDIR}"
.endif
	@found_names=`${PKG_INFO} -q -O ${PKGORIGIN}`; \
	for p in $${found_names}; do \
			check_name=`${ECHO_CMD} $${p} | ${SED} -e 's/-[^-]*$$//'`; \
			if [ "$${check_name}" = "${PKGBASE}" ]; then \
					prfx=`${PKG_INFO} -q -p $${p} 2> /dev/null | ${SED} -ne '1s|^@cwd ||p'`; \
					if [ "x${PREFIX}" = "x$${prfx}" ]; then \
							if [ -z "${DESTDIR}" ] ; then \
									${ECHO_MSG} "===>   Deinstalling $${p}"; \
							else \
									${ECHO_MSG} "===>   Deinstalling $${p} from ${DESTDIR}"; \
							fi; \
							${PKG_DELETE} -f $${p}; \
					else \
							${ECHO_MSG} "===>   $${p} has a different PREFIX: $${prfx}, skipping"; \
					fi; \
			fi; \
	done; \
	if [ -z "$${found_names}" ]; then \
			if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGBASE} not installed, skipping"; \
			else \
					${ECHO_MSG} "===>   ${PKGBASE} not installed in ${DESTDIR}, skipping"; \
			fi; \
	fi
	@${RM} -f ${INSTALL_COOKIE}
.endif
.endif

# Deinstall-all
#
# Special target to remove installation of all ports of the same origin

.if !target(deinstall-all)
deinstall-all:
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@${ECHO_MSG} "===>  Switching to root credentials for '${.TARGET}' target"
	@cd ${.CURDIR} && \
		${SU_CMD} "${MAKE} ${__softMAKEFLAGS} ${.TARGET}"
	@${ECHO_MSG} "===>  Returning to user credentials"
.else
.if !defined(DESTDIR)
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN}"
.else
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN} from ${DESTDIR}"
.endif
	@deinstall_names=`${PKG_INFO} -q -O ${PKGORIGIN}`; \
	if [ -n "$${deinstall_names}" ]; then \
		for d in $${deinstall_names}; do \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "===>   Deinstalling $${d}"; \
			else \
				${ECHO_MSG} "===>   Deinstalling $${d} from ${DESTDIR}"; \
			fi; \
			${PKG_DELETE} -f $${d}; \
		done; \
	else \
		if [ -z "${DESTDIR}" ] ; then \
			${ECHO_MSG} "===>   ${PKGORIGIN} not installed, skipping"; \
		else \
			${ECHO_MSG} "===>   ${PKGORIGIN} not installed in ${DESTDIR}, skipping"; \
		fi; \
	fi; \
	${RM} -f ${INSTALL_COOKIE}
.endif
.endif

# Cleaning up

.if !target(do-clean)
do-clean:
	@if [ -d ${WRKDIR} ]; then \
		if [ -w ${WRKDIR} ]; then \
			${RM} -rf ${WRKDIR}; \
		else \
			${ECHO_MSG} "===>   ${WRKDIR} not writable, skipping"; \
		fi; \
	fi
.endif

.if !target(clean)
clean:
.if !defined(NOCLEANDEPENDS)
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} clean-depends
.endif
	@${ECHO_MSG} "===>  Cleaning for ${PKGNAME}"
.if target(pre-clean)
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} pre-clean
.endif
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} do-clean
.if target(post-clean)
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} post-clean
.endif
.endif

.if !target(pre-distclean)
pre-distclean:
	@${DO_NADA}
.endif

.if !target(distclean)
distclean: pre-distclean clean
	@cd ${.CURDIR} && ${MAKE} delete-distfiles RESTRICTED_FILES="${_DISTFILES} ${_PATCHFILES}"
.endif

.if !target(delete-distfiles)
delete-distfiles:
	@${ECHO_MSG} "===>  Deleting distfiles for ${PKGNAME}"
	@(if [ "X${RESTRICTED_FILES}" != "X" -a -d ${_DISTDIR} ]; then \
		cd ${_DISTDIR}; \
		for file in ${RESTRICTED_FILES}; do \
			${RM} -f $${file}; \
			dir=$${file%/*}; \
			if [ "$${dir}" != "$${file}" ]; then \
				${RMDIR} -p $${dir} >/dev/null 2>&1 || :; \
			fi; \
		done; \
	fi)
.if defined(DIST_SUBDIR)
	-@${RMDIR} ${_DISTDIR} >/dev/null 2>&1 || ${TRUE}
.endif
.endif

.if !target(delete-distfiles-list)
delete-distfiles-list:
	@${ECHO_CMD} "# ${PKGNAME}"
	@if [ "X${RESTRICTED_FILES}" != "X" ]; then \
		for file in ${RESTRICTED_FILES}; do \
			${ECHO_CMD} "[ -f ${_DISTDIR}/$$file ] && (${ECHO_CMD} deleting ${_DISTDIR}/$$file; ${RM} -f ${_DISTDIR}/$$file)"; \
			dir=$${file%/*}; \
			if [ "$${dir}" != "$${file}" ]; then \
				${ECHO_CMD} "(cd ${_DISTDIR} && ${RMDIR} -p $${dir} 2>/dev/null)"; \
			fi; \
		done; \
	fi
.if defined(DIST_SUBDIR)
	@${ECHO_CMD} "${RMDIR} ${_DISTDIR} 2>/dev/null || ${TRUE}"
.endif
.endif

# Prints out a list of files to fetch (useful to do a batch fetch)

.if !target(fetch-list)
fetch-list:
	@${MKDIR} ${_DISTDIR}
	@(cd ${_DISTDIR}; \
	 ${_MASTER_SITES_ENV} ; \
	 for _file in ${DISTFILES}; do \
		file=`${ECHO_CMD} $$_file | ${SED} -E -e 's/:[^:]+$$//'` ; \
		select=`${ECHO_CMD} $${_file#$${file}} | ${SED} -e 's/^://' -e 's/,/ /g'` ; \
		if [ ! -f $$file -a ! -f `${BASENAME} $$file` ]; then \
			if [ ! -z "$$select" ] ; then \
				__MASTER_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_MASTER_SITES_$${group}} ] ; then \
						eval ___MASTER_SITES_TMP=\$${_MASTER_SITES_$${group}} ; \
						__MASTER_SITES_TMP="$${__MASTER_SITES_TMP} $${___MASTER_SITES_TMP}" ; \
					fi \
				done; \
				___MASTER_SITES_TMP= ; \
				SORTED_MASTER_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__MASTER_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_MASTER_SITES_CMD_TMP="${SORTED_MASTER_SITES_DEFAULT_CMD}" ; \
			fi ; \
			for site in `eval $$SORTED_MASTER_SITES_CMD_TMP ${_RANDOMIZE_SITES}`; do \
				if [ ! -z "`${ECHO_CMD} ${NOFETCHFILES} | ${GREP} -w $${file}`" ]; then \
					if [ -z "`${ECHO_CMD} ${MASTER_SITE_OVERRIDE} | ${GREP} -w $${site}`" ]; then \
						continue; \
					fi; \
				fi; \
				DIR=${DIST_SUBDIR}; \
				CKSIZE=`${GREP} "^SIZE ($${DIR:+$$DIR/}$$file)" ${MD5_FILE} | ${AWK} '{print $$4}'`; \
				case $${file} in \
				*/*)	args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				${ECHO_CMD} -n ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} "${FETCH_AFTER_ARGS}" '|| ' ; \
			done; \
			${ECHO_CMD} "${ECHO_CMD} $${file} not fetched" ; \
		fi \
	done)
.if defined(PATCHFILES)
	@(cd ${_DISTDIR}; \
	 ${_PATCH_SITES_ENV} ; \
	 for _file in ${PATCHFILES}; do \
		file=`${ECHO_CMD} $$_file | ${SED} -E -e 's/:[^:]+$$//'` ; \
		select=`${ECHO_CMD} $${_file#$${file}} | ${SED} -e 's/^://' -e 's/,/ /g'` ; \
		if [ ! -f $$file -a ! -f `${BASENAME} $$file` ]; then \
			if [ ! -z "$$select" ] ; then \
				__PATCH_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_PATCH_SITES_$${group}} ] ; then \
						eval ___PATCH_SITES_TMP=\$${_PATCH_SITES_$${group}} ; \
						__PATCH_SITES_TMP="$${__PATCH_SITES_TMP} $${___PATCH_SITES_TMP}" ; \
					fi \
				done; \
				___PATCH_SITES_TMP= ; \
				SORTED_PATCH_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__PATCH_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_PATCH_SITES_CMD_TMP="${SORTED_PATCH_SITES_DEFAULT_CMD}" ; \
			fi ; \
			for site in `eval $$SORTED_PATCH_SITES_CMD_TMP ${_RANDOMIZE_SITES}`; do \
				DIR=${DIST_SUBDIR}; \
				CKSIZE=`${GREP} "^SIZE ($${DIR:+$$DIR/}$$file)" ${MD5_FILE} | ${AWK} '{print $$4}'`; \
				case $${file} in \
				*/*)	args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				${ECHO_CMD} -n ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} "${FETCH_AFTER_ARGS}" '|| ' ; \
			done; \
			${ECHO_CMD} "${ECHO_CMD} $${file} not fetched" ; \
		fi \
	 done)
.endif
.endif

# Generates patches.

update-patches:
	@toedit=`PATCH_WRKSRC=${PATCH_WRKSRC} \
		PATCHDIR=${PATCHDIR} \
		PATCH_LIST=${PATCHDIR}/patch-* \
		DIFF_ARGS=${DIFF_ARGS} \
		DISTORIG=${DISTORIG} \
		${SH} ${PORTSDIR}/Tools/scripts/update-patches`; \
	case $$toedit in "");; \
	*) ${ECHO_CMD} -n 'edit patches: '; read i; \
	cd ${PATCHDIR} && $${VISUAL:-$${EDIT:-/usr/bin/vi}} $$toedit;; esac

# Checksumming utilities

check-checksum-algorithms:
	@ \
	${checksum_init} \
	\
	for alg in ${CHECKSUM_ALGORITHMS:U}; do \
		eval alg_executable=\$$$$alg; \
		if [ -z "$$alg_executable" ]; then \
			${ECHO_CMD} "Checksum algorithm $$alg: Couldn't find the executable."; \
			${ECHO_CMD} "Set $$alg=/path/to/$$alg in /etc/make.conf and try again."; \
			exit 1; \
		fi; \
	done; \

checksum_init=\
	SHA256=${SHA256}; \
	MD5=${MD5};

.if !target(makesum)
makesum: check-checksum-algorithms
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} fetch NO_CHECKSUM=yes \
		DISABLE_SIZE=yes
	@if [ -f ${MD5_FILE} ]; then ${CAT} /dev/null > ${MD5_FILE}; fi
	@( \
		cd ${DISTDIR}; \
		\
		${checksum_init} \
		\
		for file in ${_CKSUMFILES}; do \
			for alg in ${CHECKSUM_ALGORITHMS:U}; do \
				eval alg_executable=\$$$$alg; \
				\
				if [ $$alg_executable != "NO" ]; then \
					$$alg_executable $$file >> ${MD5_FILE}; \
				fi; \
			done; \
			if [ -z "${NO_SIZE}" ]; then \
				${ECHO_CMD} "SIZE ($$file) = "`${LS} -ALln $$file | ${AWK} '{print $$5}'` >> ${MD5_FILE}; \
			fi; \
		done \
	)
	@for file in ${_IGNOREFILES}; do \
		for alg in ${CHECKSUM_ALGORITHMS:U}; do \
			${ECHO_CMD} "$$alg ($$file) = IGNORE" >> ${MD5_FILE}; \
		done; \
	done
.endif

.if !target(checksum)
checksum: fetch check-checksum-algorithms
	@ \
	\
	${checksum_init} \
	\
	if [ -f ${MD5_FILE} ]; then \
	(	cd ${DISTDIR}; OK=""; \
		for file in ${_CKSUMFILES}; do \
			pattern="`${ECHO_CMD} $$file | ${SED} -e 's/\./\\\\./g'`"; \
			\
			ignored="true"; \
			for alg in ${CHECKSUM_ALGORITHMS:U}; do \
				ignore="false"; \
				eval alg_executable=\$$$$alg; \
				\
				if [ $$alg_executable != "NO" ]; then \
					MKSUM=`$$alg_executable < $$file`; \
					CKSUM=`${GREP} "^$$alg ($$pattern)" ${MD5_FILE} | ${AWK} '{print $$4}'`; \
				else \
					ignore="true"; \
				fi; \
				\
				if [ $$ignore = "false" -a -z "$$CKSUM" ]; then \
					${ECHO_MSG} "=> No $$alg checksum recorded for $$file."; \
					ignore="true"; \
				fi; \
				\
				if [ "$$CKSUM" = "IGNORE" ]; then \
					${ECHO_MSG} "=> $$alg Checksum for $$file is set to IGNORE in distinfo file even though"; \
					${ECHO_MSG} "   the file is not in the "'$$'"{IGNOREFILES} list."; \
					ignore="true"; \
					OK=${FALSE}; \
				fi; \
				\
				if [ $$ignore = "false" ]; then \
					match="false"; \
					for chksum in $$CKSUM; do \
						if [ "$$chksum" = "$$MKSUM" ]; then \
							match="true"; \
							break; \
						fi; \
					done; \
					if [ $$match = "true" ]; then \
						${ECHO_MSG} "=> $$alg Checksum OK for $$file."; \
						ignored="false"; \
					else \
						${ECHO_MSG} "=> $$alg Checksum mismatch for $$file."; \
						refetchlist="$$refetchlist$$file "; \
						OK="$${OK:-retry}"; \
						ignored="false"; \
					fi; \
				fi; \
			done; \
			\
			if [ $$ignored = "true" ]; then \
				${ECHO_MSG} "=> No suitable checksum found for $$file."; \
				OK="${FALSE}"; \
			fi; \
			\
		done; \
		\
		for file in ${_IGNOREFILES}; do \
			pattern="`${ECHO_CMD} $$file | ${SED} -e 's/\./\\\\./g'`"; \
			\
			ignored="true"; \
			alreadymatched="false"; \
			for alg in ${CHECKSUM_ALGORITHMS:U}; do \
				ignore="false"; \
				eval alg_executable=\$$$$alg; \
				\
				if [ $$alg_executable != "NO" ]; then \
					CKSUM=`${GREP} "^$$alg ($$pattern)" ${MD5_FILE} | ${AWK} '{print $$4}'`; \
				else \
					ignore="true"; \
				fi; \
				\
				if [ $$ignore = "false" ]; then \
					if [ -z "$$CKSUM" ]; then \
						${ECHO_MSG} "=> No $$alg checksum for $$file recorded (expected IGNORE)"; \
						OK="$$alreadymatched"; \
					elif [ $$CKSUM != "IGNORE" ]; then \
						${ECHO_MSG} "=> $$alg Checksum for $$file is not set to IGNORE in distinfo file even though"; \
						${ECHO_MSG} "   the file is in the "'$$'"{IGNOREFILES} list."; \
						OK="false"; \
					else \
						ignored="false"; \
						alreadymatched="true"; \
					fi; \
				fi; \
			done; \
			\
			if ( [ $$ignored = "true" ]) ; then \
				${ECHO_MSG} "=> No suitable checksum found for $$file."; \
				OK="false"; \
			fi; \
			\
		done; \
		\
		if [ "$${OK:=true}" = "retry" ] && [ ${FETCH_REGET} -gt 0 ]; then \
			${ECHO_MSG} "===>  Refetch for ${FETCH_REGET} more times files: $$refetchlist"; \
			if ( cd ${.CURDIR} && \
			    ${MAKE} ${.MAKEFLAGS} FORCE_FETCH="$$refetchlist" FETCH_REGET="`${EXPR} ${FETCH_REGET} - 1`" fetch); then \
				  if ( cd ${.CURDIR} && \
			        ${MAKE} ${.MAKEFLAGS} FETCH_REGET="`${EXPR} ${FETCH_REGET} - 1`" checksum ); then \
				      OK="true"; \
				  fi; \
			fi; \
		fi ; \
		\
		if [ "$$OK" != "true" -a ${FETCH_REGET} -eq 0 ]; then \
			${ECHO_MSG} "===>  Giving up on fetching files: $$refetchlist"; \
			${ECHO_MSG} "Make sure the Makefile and distinfo file (${MD5_FILE})"; \
			${ECHO_MSG} "are up to date.  If you are absolutely sure you want to override this"; \
			${ECHO_MSG} "check, type \"make NO_CHECKSUM=yes [other args]\"."; \
			exit 1; \
		fi; \
		if [ "$$OK" != "true" ]; then \
			exit 1; \
		fi \
	); \
	elif [ -n "${_CKSUMFILES:M*}" ]; then \
		${ECHO_MSG} "=> No checksum file (${MD5_FILE})."; \
	fi
.endif

################################################################
# The special package-building targets
# You probably won't need to touch these
################################################################

# Nobody should want to override this unless PKGNAME is simply bogus.

.if !target(package-name)
package-name:
	@${ECHO_CMD} ${PKGNAME}
.endif

# Build a package but don't check the package cookie

.if !target(repackage)
repackage: pre-repackage package

pre-repackage:
	@${RM} -f ${PACKAGE_COOKIE}
.endif

# Build a package but don't check the cookie for installation, also don't
# install package cookie

.if !target(package-noinstall)
package-noinstall: 
	@${ECHO_MSG} "==> The 'package-noinstall' target is deprecated.  Use 'package' instead."
	@sleep 5
	@${MAKE} package
.endif

################################################################
# Dependency checking
################################################################

.if !target(depends)
depends: extract-depends patch-depends lib-depends misc-depends fetch-depends build-depends run-depends

.if defined(ALWAYS_BUILD_DEPENDS)
_DEPEND_ALWAYS=	1
.else
_DEPEND_ALWAYS=	0
.endif

_INSTALL_DEPENDS=	\
		if [ X${USE_PACKAGE_DEPENDS} != "X" ]; then \
			subpkgfile=`(cd $$dir; ${MAKE} $$depends_args -V PKGFILE)`; \
			if [ -r "$${subpkgfile}" -a "$$target" = "${DEPENDS_TARGET}" ]; then \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   Installing existing package $${subpkgfile}"; \
					${PKG_ADD} $${subpkgfile}; \
				else \
					${ECHO_MSG} "===>   Installing existing package $${subpkgfile} into ${DESTDIR}"; \
					${PKG_ADD} -C ${DESTDIR} $${subpkgfile}; \
				fi; \
			else \
			  (cd $$dir; ${MAKE} -DINSTALLS_DEPENDS $$target $$depends_args) ; \
			fi; \
		else \
			(cd $$dir; ${MAKE} -DINSTALLS_DEPENDS $$target $$depends_args) ; \
		fi; \
		if [ -z "${DESTDIR}" ] ; then \
			${ECHO_MSG} "===>   Returning to build of ${PKGNAME}"; \
		else \
			${ECHO_MSG} "===>   Returning to build of ${PKGNAME} for ${DESTDIR}"; \
		fi;

.for deptype in EXTRACT PATCH FETCH BUILD RUN
${deptype:L}-depends:
.if defined(${deptype}_DEPENDS)
.if !defined(NO_DEPENDS)
	@for i in `${ECHO_CMD} "${${deptype}_DEPENDS}"`; do \
		prog=`${ECHO_CMD} $$i | ${SED} -e 's/:.*//'`; \
		dir=`${ECHO_CMD} $$i | ${SED} -e 's/[^:]*://'`; \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			target=`${ECHO_CMD} $$dir | ${SED} -e 's/.*://'`; \
			dir=`${ECHO_CMD} $$dir | ${SED} -e 's/:.*//'`; \
		else \
			target="${DEPENDS_TARGET}"; \
			depends_args="${DEPENDS_ARGS}"; \
		fi; \
		if ${EXPR} "$$prog" : \\/ >/dev/null; then \
			if [ -e "$$prog" ]; then \
				if [ "$$prog" = "${NONEXISTENT}" ]; then \
					${ECHO_MSG} "Error: ${NONEXISTENT} exists.  Please remove it, and restart the build."; \
					${FALSE}; \
				else \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on file: $$prog - found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on file in ${DESTDIR}: $$prog - found"; \
					fi; \
					if [ ${_DEPEND_ALWAYS} = 1 ]; then \
						${ECHO_MSG} "       (but building it anyway)"; \
						notfound=1; \
					else \
						notfound=0; \
					fi; \
				fi; \
			else \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on file: $$prog - not found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on file in ${DESTDIR}: $$prog - not found"; \
				fi; \
				notfound=1; \
			fi; \
		else \
			case $${prog} in \
				*\>*|*\<*|*=*)	pkg=yes;; \
				*)		pkg="";; \
			esac; \
			if [ "$$pkg" != "" ]; then \
				if ${PKG_INFO} "$$prog" > /dev/null 2>&1 ; then \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package: $$prog - found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package in ${DESTDIR}: $$prog - found"; \
					fi; \
					if [ ${_DEPEND_ALWAYS} = 1 ]; then \
						${ECHO_MSG} "       (but building it anyway)"; \
						notfound=1; \
					else \
						notfound=0; \
					fi; \
				else \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package: $$prog - not found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package in ${DESTDIR}: $$prog - not found"; \
					fi; \
					notfound=1; \
				fi; \
				if [ $$notfound != 0 ]; then \
					inverse_dep=`${ECHO_CMD} $$prog | ${SED} \
						-e 's/<=/=gt=/; s/</=ge=/; s/>=/=lt=/; s/>/=le=/' \
						-e 's/=gt=/>/; s/=ge=/>=/; s/=lt=/</; s/=le=/<=/'`; \
					pkg_info=`${PKG_INFO} -E "$$inverse_dep" || ${TRUE}`; \
					if [ "$$pkg_info" != "" ]; then \
						${ECHO_MSG} "===>   Found $$pkg_info, but you need to upgrade to $$prog."; \
						exit 1; \
					fi; \
				fi; \
			elif ${WHICH} "$$prog" > /dev/null 2>&1 ; then \
				if [ -z "${PREFIX}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable: $$prog - found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable in ${DESTDIR}: $$prog - found"; \
				fi; \
				if [ ${_DEPEND_ALWAYS} = 1 ]; then \
					${ECHO_MSG} "       (but building it anyway)"; \
					notfound=1; \
				else \
					notfound=0; \
				fi; \
			else \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable: $$prog - not found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable in ${DESTDIR}: $$prog - not found"; \
				fi; \
				notfound=1; \
			fi; \
		fi; \
		if [ $$notfound != 0 ]; then \
			${ECHO_MSG} "===>    Verifying $$target for $$prog in $$dir"; \
			if [ ! -d "$$dir" ]; then \
				${ECHO_MSG} "     => No directory for $$prog.  Skipping.."; \
			else \
				${_INSTALL_DEPENDS} \
			fi; \
		fi; \
	done
.endif
.else
	@${DO_NADA}
.endif
.endfor

lib-depends:
.if defined(LIB_DEPENDS) && !defined(NO_DEPENDS)
	@for i in ${LIB_DEPENDS}; do \
		lib=$${i%%:*}; \
		case $$lib in \
			*.*.*)	pattern="`${ECHO_CMD} $$lib | ${SED} -e 's/\./\\\\./g'`" ;;\
			*.*)	pattern="$${lib%%.*}\.$${lib#*.}" ;;\
			*)	pattern="$$lib" ;;\
		esac; \
		dir=$${i#*:}; \
		target=$${i##*:}; \
		if ${TEST} $$dir = $$target; then \
			target="${DEPENDS_TARGET}"; \
			depends_args="${DEPENDS_ARGS}"; \
		else \
			dir=$${dir%%:*}; \
		fi; \
		if [ -z "${DESTDIR}" ] ; then \
			${ECHO_MSG} -n "===>   ${PKGNAME} depends on shared library: $$lib"; \
			if ${LDCONFIG} -r | ${GREP} -vwF -e "${PKGCOMPATDIR}" | ${GREP} -qwE -e "-l$$pattern"; then \
				${ECHO_MSG} " - found"; \
				if [ ${_DEPEND_ALWAYS} = 1 ]; then \
					${ECHO_MSG} "       (but building it anyway)"; \
					notfound=1; \
				else \
					notfound=0; \
				fi; \
			else \
				${ECHO_MSG} " - not found"; \
				notfound=1; \
			fi; \
		else \
			${ECHO_MSG} -n "===>   ${PKGNAME} depends on shared library in ${DESTDIR}: $$lib"; \
			if ${CHROOT} ${DESTDIR} ${LDCONFIG} -r | ${GREP} -vwF -e "${PKGCOMPATDIR}" | ${GREP} -qwE -e "-l$$pattern"; then \
				${ECHO_MSG} " - found"; \
				if [ ${_DEPEND_ALWAYS} = 1 ]; then \
					${ECHO_MSG} "       (but building it anyway)"; \
					notfound=1; \
				else \
					notfound=0; \
				fi; \
			else \
				${ECHO_MSG} " - not found"; \
				notfound=1; \
			fi; \
		fi; \
		if [ $$notfound != 0 ]; then \
			${ECHO_MSG} "===>    Verifying $$target for $$lib in $$dir"; \
			if [ ! -d "$$dir" ]; then \
				${ECHO_MSG} "     => No directory for $$lib.  Skipping.."; \
			else \
				${_INSTALL_DEPENDS} \
				if ! ${LDCONFIG} -r | ${GREP} -vwF -e "${PKGCOMPATDIR}" | ${GREP} -qwE -e "-l$$pattern"; then \
					${ECHO_MSG} "Error: shared library \"$$lib\" does not exist"; \
					${FALSE}; \
				fi; \
			fi; \
		fi; \
	done
.endif

misc-depends:
.if defined(DEPENDS)
.if !defined(NO_DEPENDS)
	@for dir in ${DEPENDS}; do \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			target=`${ECHO_CMD} $$dir | ${SED} -e 's/.*://'`; \
			dir=`${ECHO_CMD} $$dir | ${SED} -e 's/:.*//'`; \
		else \
			target="${DEPENDS_TARGET}"; \
			depends_args="${DEPENDS_ARGS}"; \
		fi; \
		${ECHO_MSG} "===>   ${PKGNAME} depends on: $$dir"; \
		${ECHO_MSG} "===>    Verifying $$target for $$dir"; \
		if [ ! -d $$dir ]; then \
			${ECHO_MSG} "     => No directory for $$dir.  Skipping.."; \
		else \
			(cd $$dir; ${MAKE} $$target $$depends_args) ; \
		fi \
	done
	@if [ -z "${DESTDIR}" ] ; then \
		${ECHO_MSG} "===>   Returning to build of ${PKGNAME}"; \
	else \
		${ECHO_MSG} "===>   Returning to build of ${PKGNAME} for ${DESTDIR}"; \
	fi
.endif
.else
	@${DO_NADA}
.endif

.endif

# Dependency lists: both build and runtime, recursive.  Print out directory names.

_UNIFIED_DEPENDS=${EXTRACT_DEPENDS} ${PATCH_DEPENDS} ${FETCH_DEPENDS} ${BUILD_DEPENDS} ${LIB_DEPENDS} ${RUN_DEPENDS}
_DEPEND_DIRS=	${_UNIFIED_DEPENDS:C,^[^:]*:([^:]*).*$,\1,} ${DEPENDS:C,:.*,,}

all-depends-list:
	@${ALL-DEPENDS-LIST}

ALL-DEPENDS-LIST= \
	L="${_DEPEND_DIRS}";						\
	checked="";							\
	while [ -n "$$L" ]; do						\
		l="";							\
		for d in $$L; do					\
			case $$checked in				\
			$$d\ *|*\ $$d\ *|*\ $$d)			\
				continue;;				\
			esac;						\
			checked="$$checked $$d";			\
			if [ ! -d $$d ]; then				\
				${ECHO_MSG} "${PKGNAME}: \"$$d\" non-existent -- dependency list incomplete" >&2; \
				continue;				\
			fi;						\
			${ECHO_CMD} $$d;				\
			if ! children=$$(cd $$d && ${MAKE} -V _DEPEND_DIRS); then\
				${ECHO_MSG} "${PKGNAME}: \"$$d\" erroneous -- dependency list incomplete" >&2; \
				continue;				\
			fi;						\
			for child in $$children; do			\
				case "$$checked $$l" in			\
				$$child\ *|*\ $$child\ *|*\ $$child)	\
					continue;;			\
				esac;					\
				l="$$l $$child";			\
			done;						\
		done;							\
		L=$$l;							\
	done

.if !target(clean-depends)
clean-depends:
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} NOCLEANDEPENDS=yes clean); \
	done
.endif

.if !target(deinstall-depends)
deinstall-depends:
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} deinstall); \
	done
.endif

.if !target(fetch-recursive)
fetch-recursive:
	@${ECHO_MSG} "===> Fetching all distfiles for ${PKGNAME} and dependencies"
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} fetch); \
	done
.endif

.if !target(fetch-recursive-list)
fetch-recursive-list:
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} fetch-list); \
	done
.endif

.if !target(fetch-required)
fetch-required: fetch
	@${ECHO_MSG} "===> Fetching all required distfiles for ${PKGNAME} and dependencies"
.for deptype in EXTRACT PATCH FETCH BUILD RUN
.if defined(${deptype}_DEPENDS)
.if !defined(NO_DEPENDS)
	@for i in ${${deptype}_DEPENDS}; do \
		prog=`${ECHO_CMD} $$i | ${CUT} -f 1 -d ':'`; \
		dir=`${ECHO_CMD} $$i | ${CUT} -f 2-999 -d ':'`; \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			dir=`${ECHO_CMD} $$dir | ${CUT} -f 1 -d ':'`; \
			if ${EXPR} "$$prog" : \\/ >/dev/null; then \
				if [ ! -e "$$prog" ]; then \
					(cd $$dir; ${MAKE} fetch); \
				fi; \
			fi; \
		else \
			(cd $$dir; \
			tmp=`${MAKE} -V PKGNAME`; \
			if [ ! -d ${PKG_DBDIR}/$${tmp} ]; then \
				${MAKE} fetch; \
			fi );  \
		fi; \
	done
.endif
.endif
.endfor
.endif

.if !target(fetch-required-list)
fetch-required-list: fetch-list
.for deptype in EXTRACT PATCH FETCH BUILD RUN
.if defined(${deptype}_DEPENDS)
.if !defined(NO_DEPENDS)
	@for i in ${${deptype}_DEPENDS}; do \
		prog=`${ECHO_CMD} $$i | ${CUT} -f 1 -d ':'`; \
		dir=`${ECHO_CMD} $$i | ${CUT} -f 2-999 -d ':'`; \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			dir=`${ECHO_CMD} $$dir | ${CUT} -f 1 -d ':'`; \
			if ${EXPR} "$$prog" : \\/ >/dev/null; then \
				if [ ! -e "$$prog" ]; then \
					(cd $$dir; ${MAKE} fetch-list); \
				fi; \
			fi; \
		else \
			(cd $$dir; \
			tmp=`${MAKE} -V PKGNAME`; \
			if [ ! -d ${PKG_DBDIR}/$${tmp} ]; then \
				${MAKE} fetch-list; \
			fi );  \
		fi; \
	done
.endif
.endif
.endfor
.endif

.if !target(checksum-recursive)
checksum-recursive:
	@${ECHO_MSG} "===> Fetching and checking checksums for ${PKGNAME} and dependencies"
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} checksum); \
	done
.endif

# Dependency lists: build and runtime.  Print out directory names.

build-depends-list:
.if defined(EXTRACT_DEPENDS) || defined(PATCH_DEPENDS) || defined(FETCH_DEPENDS) || defined(BUILD_DEPENDS) || defined(LIB_DEPENDS) || defined(DEPENDS)
	@${BUILD-DEPENDS-LIST}
.endif

BUILD-DEPENDS-LIST= \
	for dir in $$(${ECHO_CMD} "${EXTRACT_DEPENDS} ${PATCH_DEPENDS} ${FETCH_DEPENDS} ${BUILD_DEPENDS} ${LIB_DEPENDS}" | ${TR} '\040' '\012' | ${SED} -e 's/^[^:]*://' -e 's/:.*//' | ${SORT} -u) $$(${ECHO_CMD} ${DEPENDS} | ${TR} '\040' '\012' | ${SED} -e 's/:.*//' | ${SORT} -u); do \
		if [ -d $$dir ]; then \
			${ECHO_CMD} $$dir; \
		else \
			${ECHO_MSG} "${PKGNAME}: \"$$dir\" non-existent -- dependency list incomplete" >&2; \
		fi; \
	done | ${SORT} -u

run-depends-list:
.if defined(LIB_DEPENDS) || defined(RUN_DEPENDS) || defined(DEPENDS)
	@${RUN-DEPENDS-LIST}
.endif

RUN-DEPENDS-LIST= \
	for dir in $$(${ECHO_CMD} "${LIB_DEPENDS} ${RUN_DEPENDS}" | ${SED} -e 'y/ /\n/' | ${CUT} -f 2 -d ':' | ${SORT} -u) $$(${ECHO_CMD} ${DEPENDS} | ${SED} -e 'y/ /\n/' | ${CUT} -f 1 -d ':' | ${SORT} -u); do \
		if [ -d $$dir ]; then \
			${ECHO_CMD} $$dir; \
		else \
			${ECHO_MSG} "${PKGNAME}: \"$$dir\" non-existent -- dependency list incomplete" >&2; \
		fi; \
	done | ${SORT} -u

# Package (recursive runtime) dependency list.  Print out both directory names
# and package names.

package-depends-list:
.if defined(CHILD_DEPENDS) || defined(LIB_DEPENDS) || defined(RUN_DEPENDS) || defined(DEPENDS)
	@${PACKAGE-DEPENDS-LIST}
.endif

PACKAGE-DEPENDS-LIST?= \
	if [ "${CHILD_DEPENDS}" ]; then \
		installed=$$(${PKG_INFO} -qO ${PKGORIGIN} 2>/dev/null || \
			${TRUE}); \
		if [ "$$installed" ]; then \
			break; \
		fi; \
		if [ -z "$$installed" ]; then \
			installed="${PKGNAME}"; \
		fi; \
		for pkgname in $$installed; do \
			${ECHO_CMD} "$$pkgname ${.CURDIR} ${PKGORIGIN}"; \
		done; \
	fi; \
	checked="${PARENT_CHECKED}"; \
	for dir in $$(${ECHO_CMD} "${LIB_DEPENDS} ${RUN_DEPENDS}" | ${SED} -e 'y/ /\n/' | ${CUT} -f 2 -d ':') $$(${ECHO_CMD} ${DEPENDS} | ${SED} -e 'y/ /\n/' | ${CUT} -f 1 -d ':'); do \
		dir=$$(${REALPATH} $$dir); \
		if [ -d $$dir ]; then \
			if (${ECHO_CMD} $$checked | ${GREP} -qwv "$$dir"); then \
				childout=$$(cd $$dir; ${MAKE} CHILD_DEPENDS=yes PARENT_CHECKED="$$checked" package-depends-list); \
				set -- $$childout; \
				childdir=""; \
				while [ $$\# != 0 ]; do \
					childdir="$$childdir $$2"; \
					${ECHO_CMD} "$$1 $$2 $$3"; \
					shift 3; \
				done; \
				checked="$$dir $$childdir $$checked"; \
			fi; \
		else \
			${ECHO_MSG} "${PKGNAME}: \"$$dir\" non-existent -- dependency list incomplete" >&2; \
		fi; \
	done

# Print out package names.

package-depends:
	@${PACKAGE-DEPENDS-LIST} | ${AWK} '{print $$1":"$$3}'

# Build packages for port and dependencies

package-recursive: package
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} package); \
	done

# Show missing dependiencies
missing:
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		THISORIGIN=$$(${ECHO_CMD} $$dir | ${SED} 's,${PORTSDIR}/,,'); \
		installed=$$(${PKG_INFO} -qO $${THISORIGIN}); \
		if [ -z "$$installed" ]; then \
			${ECHO_CMD} $$THISORIGIN; \
		fi \
	done

################################################################
# Everything after here are internal targets and really
# shouldn't be touched by anybody but the release engineers.
################################################################

# This target generates an index entry suitable for aggregation into
# a large index.  Format is:
#
# distribution-name|port-path|installation-prefix|comment| \
#  description-file|maintainer|categories|extract-depends| \
#  patch-depends|fetch-depends|build-depends|run-depends|www site
#
# If this ever changes, portmgr should contact the portsnap maintainer
# first to avoid gratuitous breakage.

.if !target(describe)
describe:
	@${ECHO_CMD} -n "${PKGNAME}|${.CURDIR}|${PREFIX}|"
.if defined(COMMENT)
	@${ECHO_CMD} -n ${COMMENT:Q}
.else
	@${ECHO_CMD} -n '** No Description'
.endif
	@perl -e ' \
		if ( -f q{${DESCR}} ) { \
			print q{|${DESCR}}; \
		} else { \
			print q{|/dev/null}; \
		} \
		print q{|${MAINTAINER}|${CATEGORIES}|}; \
		@edirs = map((split /:/)[1], split(q{ }, q{${EXTRACT_DEPENDS}})); \
		@pdirs = map((split /:/)[1], split(q{ }, q{${PATCH_DEPENDS}})); \
		@fdirs = map((split /:/)[1], split(q{ }, q{${FETCH_DEPENDS}})); \
		@bdirs = map((split /:/)[1], split(q{ }, q{${BUILD_DEPENDS}})); \
		@rdirs = map((split /:/)[1], split(q{ }, q{${RUN_DEPENDS}})); \
		@ddirs = map((split /:/)[0], split(q{ }, q{${DEPENDS}})); \
		@ldirs = map((split /:/)[1], split(q{ }, q{${LIB_DEPENDS}})); \
		for my $$i (\@edirs, \@pdirs, \@fdirs, \@bdirs, \@rdirs, \@ddirs, \@ldirs) { \
			my @dirs = @$$i; \
			@$$i = (); \
			for (@dirs) { \
				if (-d $$_) { \
					push @$$i, $$_; \
				} else { \
					print STDERR qq{${PKGNAME}: \"$$_\" non-existent -- dependency list incomplete\n}; \
					exit(1); \
				} \
			} \
		} \
		for (@edirs, @ddirs) { \
			$$xe{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xe), q{|}; \
		for (@pdirs, @ddirs) { \
			$$xp{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xp), q{|}; \
		for (@fdirs, @ddirs) { \
			$$xf{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xf), q{|}; \
		for (@bdirs, @ddirs, @ldirs) { \
			$$xb{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xb), q{|}; \
		for (@rdirs, @ddirs, @ldirs) { \
			$$xr{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xr), q{|}; \
		if (open(DESCR, q{${DESCR}})) { \
			while (<DESCR>) { \
				if (/^WWW:\s+(\S+)/) { \
					print $$1; \
					last; \
				} \
			} \
		} \
		print qq{\n};'
.endif


#
# describe-yaml
#
# Prints the port's description in YAML markup.  YAML is very human readable, and 
# there are libraries in many languages for conversion to native data structures.
#
# This target requires perl.
.if !target(describe-yaml)
describe-yaml:
	@perl -MYAML -e ' \
		my %port = ( \
			name       => q(${UNIQUENAME}), \
			origin     => q(${PKGORIGIN}), \
			version    => q(${PKGVERSION}), \
			desciption => q(${COMMENT}), \
		); \
		$$port{extract_depends} = [ map((split /:/)[1], qw{${EXTRACT_DEPENDS}}) ]; \
		$$port{patch_depends}   = [ map((split /:/)[1], qw{${PATCH_DEPENDS}})   ]; \
		$$port{fetch_depends}   = [ map((split /:/)[1], qw{${FETCH_DEPENDS}})   ]; \
		$$port{build_depends}   = [ map((split /:/)[1], qw{${BUILD_DEPENDS}})   ]; \
		$$port{run_depends}     = [ map((split /:/)[1], qw{${RUN_DEPENDS}})     ]; \
		$$port{depends}         = [ map((split /:/)[0], qw{${DEPENDS}})         ]; \
		$$port{lib_depends}     = [ map((split /:/)[1], qw{${LIB_DEPENDS}})     ]; \
		print Dump(\%port); '
.endif

www-site:
.if exists(${DESCR})
	@${AWK} '$$1 ~ /^WWW:/ {print $$2}' ${DESCR} | ${HEAD} -1
.else
	@${ECHO_CMD}
.endif

.if !target(readmes)
readmes:	readme
.endif

.if !target(readme)
readme:
	@${RM} -f ${.CURDIR}/README.html
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} ${.CURDIR}/README.html
.endif

${.CURDIR}/README.html:
	@${ECHO_MSG} "===>   Creating README.html for ${PKGNAME}"
	@__softMAKEFLAGS='${__softMAKEFLAGS:S/'/'\''/g}'; \
	${SED} -e 's|%%PORT%%|'$$(${ECHO_CMD} ${.CURDIR} | \
							  ${SED} -e 's|.*/\([^/]*/[^/]*\)$$|\1|')'|g' \
			-e 's|%%PKG%%|${PKGNAME}|g' \
			-e 's|%%COMMENT%%|'"$$(${ECHO_CMD} ${COMMENT:Q})"'|' \
			-e '/%%COMMENT%%/d' \
			-e 's|%%DESCR%%|'"$$(${ECHO_CMD} ${DESCR} | \
								 ${SED} -e 's|${.CURDIR}/||')"'|' \
			-e 's|%%EMAIL%%|'"$$(${ECHO_CMD} "${MAINTAINER}" | \
								 ${SED} -e 's/([^)]*)//;s/.*<//;s/>.*//')"'|g' \
			-e 's|%%MAINTAINER%%|${MAINTAINER}|g' \
			-e 's|%%WEBSITE%%|'"$$(cd ${.CURDIR} && eval ${MAKE} \
					$${__softMAKEFLAGS} pretty-print-www-site)"'|' \
			-e 's|%%BUILD_DEPENDS%%|'"$$(cd ${.CURDIR} && eval ${MAKE} \
					$${__softMAKEFLAGS} pretty-print-build-depends-list)"'|' \
			-e 's|%%RUN_DEPENDS%%|'"$$(cd ${.CURDIR} && eval ${MAKE} \
					$${__softMAKEFLAGS} pretty-print-run-depends-list)"'|' \
			-e 's|%%TOP%%|'"$$(${ECHO_CMD} ${CATEGORIES} | \
							   ${SED} -e 's| .*||' -e 's|[^/]*|..|g')"'/..|' \
		${TEMPLATES}/README.port >> $@

# The following two targets require an up-to-date INDEX in ${PORTSDIR}

_PRETTY_PRINT_DEPENDS_LIST=\
	if [ ! -r ${INDEXDIR}/${INDEXFILE} ] ; then \
		${ECHO_MSG} "${.TARGET} requires an INDEX file (${INDEXFILE}). Please run make index or make fetchindex."; \
	else \
		target=${.TARGET:C/pretty-print-(.*)-depends-list/\1/} ; \
		if [ "$$target" = "build" ] ; then fldnum=8 ; else fldnum=9 ; fi ; \
		${ECHO_MSG} -n 'This port requires package(s) "' ; \
		${ECHO_MSG} -n `${AWK} -F\| "\\$$1 ~ /^${PKGNAME}/ {print \\$$$${fldnum};}" ${INDEXDIR}/${INDEXFILE}` ; \
		${ECHO_MSG} "\" to $$target."; \
	fi;


.if !target(pretty-print-build-depends-list)
pretty-print-build-depends-list:
.if defined(EXTRACT_DEPENDS) || defined(PATCH_DEPENDS) || \
	defined(FETCH_DEPENDS) || defined(BUILD_DEPENDS) || \
	defined(LIB_DEPENDS) || defined(DEPENDS)
	@${_PRETTY_PRINT_DEPENDS_LIST}
.endif
.endif

.if !target(pretty-print-run-depends-list)
pretty-print-run-depends-list:
.if defined(RUN_DEPENDS) || defined(LIB_DEPENDS) || \
	defined(DEPENDS)
	@${_PRETTY_PRINT_DEPENDS_LIST}
.endif
.endif

_SUB_LIST_TEMP=	${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/}
.if !target(apply-slist)
apply-slist:
.if defined(SUB_FILES)
.for file in ${SUB_FILES}
.if !exists(${FILESDIR}/${file}.in)
	@${ECHO_MSG} "** Missing ${FILESDIR}/${file}.in for ${PKGNAME}."; exit 1
.else
	@${SED} ${_SUB_LIST_TEMP} -e '/^@comment /d' ${FILESDIR}/${file}.in > ${WRKDIR}/${file}
.endif
.endfor
.for i in pkg-message pkg-install pkg-deinstall pkg-req
.if ${SUB_FILES:M${i}*}!=""
${i:S/-//:U}=	${WRKDIR}/${SUB_FILES:M${i}*}
.endif
.endfor
.endif
.endif

# Make tmp packaing list.  This is the top level target for the entire file.
make-tmpplist:  generate-plist finish-tmpplist
finish-tmpplist: add-plist-info add-plist-docs add-plist-post

# Generate packing list.  Also tests to make sure all required package
# files exist.
#
.if !target(generate-plist)
generate-plist:
	@${ECHO_MSG} "===>   Generating temporary packing list"
	@${MKDIR} `${DIRNAME} ${TMPPLIST}`
	@if [ ! -f ${DESCR} ]; then ${ECHO_MSG} "** Missing pkg-descr for ${PKGNAME}."; exit 1; fi
	@>${TMPPLIST}
	@for file in ${PLIST_FILES}; do \
		${ECHO_CMD} $${file} | ${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} >> ${TMPPLIST}; \
	done
	@for man in ${__MANPAGES}; do \
		${ECHO_CMD} $${man} >> ${TMPPLIST}; \
	done
.	for _PREFIX in ${PREFIX}
.		if ${_TMLINKS:M${_PREFIX}*}x != x
			@for i in ${_TMLINKS:M${_PREFIX}*:S|^${_PREFIX}/||}; do \
				${ECHO_CMD} "$$i" >> ${TMPPLIST}; \
			done
.		endif
.		if ${_TMLINKS:N${_PREFIX}*}x != x
			@${ECHO_CMD} @cwd / >> ${TMPPLIST}
			@for i in ${_TMLINKS:N${_PREFIX}*:S|^/||}; do \
				${ECHO_CMD} "$$i" >> ${TMPPLIST}; \
			done
			@${ECHO_CMD} '@cwd ${PREFIX}' >> ${TMPPLIST}
.		endif
		@for i in $$(${ECHO_CMD} ${__MANPAGES} ${_TMLINKS:M${_PREFIX}*:S|^${_PREFIX}/||} ' ' | ${SED} -E -e 's|man([1-9ln])/([^/ ]+) |cat\1/\2 |g'); do \
			${ECHO_CMD} "@unexec rm -f %D/$${i%.gz} %D/$${i%.gz}.gz" >> ${TMPPLIST}; \
		done
.	endfor
	@if [ -f ${PLIST} ]; then \
		${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} ${PLIST} >> ${TMPPLIST}; \
	fi
.	for reinplace in ${PLIST_REINPLACE}
.		if defined(PLIST_REINPLACE_${reinplace:U})
			@${SED} -i "" -e '${PLIST_REINPLACE_${reinplace:U}}' ${TMPPLIST}
.		endif
.	endfor
 
.	for dir in ${PLIST_DIRS}
		@${ECHO_CMD} ${dir} | ${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} | ${SED} -e 's,^,@dirrm ,' >> ${TMPPLIST}
.	endfor

.	if defined(USE_LDCONFIG)
.		if !defined(INSTALL_AS_USER)
			@${ECHO_CMD} "@exec ${LDCONFIG_PLIST_EXEC_CMD}"     >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG_PLIST_UNEXEC_CMD}" >> ${TMPPLIST}
.		else
			@${ECHO_CMD} "@exec ${LDCONFIG_PLIST_EXEC_CMD}" || ${TRUE}     >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG_PLIST_UNEXEC_CMD}" || ${TRUE} >> ${TMPPLIST}
.		endif
.	endif
.	if defined(USE_LDCONFIG32)
.		if !defined(INSTALL_AS_USER)
			@${ECHO_CMD} "@exec ${LDCONFIG} -32 -m ${USE_LDCONFIG32}" >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG} -32 -R" >> ${TMPPLIST}
.		else
			@${ECHO_CMD} "@exec ${LDCONFIG} -32 -m ${USE_LDCONFIG32} || ${TRUE}" >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG} -32 -R || ${TRUE}" >> ${TMPPLIST}
.		endif
.	endif
.	if !defined(NO_FILTER_SHLIBS)
		@${SED} -e 's,\(/lib.*\.so\.[0-9]*\)\.[0-9]*$$,\1,' ${TMPPLIST} > ${TMPPLIST}.tmp
		@${MV} -f ${TMPPLIST}.tmp ${TMPPLIST}
.	endif
# End of generate-plist
.endif 

${TMPPLIST}:
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} generate-plist

.if !target(add-plist-docs)
add-plist-docs:
.	if defined(PORTDOCS) && !defined(NOPORTDOCS)
		@if ${EGREP} -qe '^@cw?d' ${TMPPLIST} && \
			[ "`${SED} -En -e '/^@cw?d[ 	]*/s,,,p' ${TMPPLIST} | ${TAIL} -n 1`" != "${PREFIX}" ]; then \
			${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}; \
		fi
.		for x in ${PORTDOCS}
			@if ${ECHO_CMD} "${x}"| ${AWK} '$$1 ~ /(\*|\||\[|\]|\?|\{|\}|\$$)/ { exit 1};'; then \
				if [ ! -e ${FAKE_DESTDIR}${DOCSDIR}/${x} ]; then \
					${ECHO_CMD} ${DOCSDIR}/${x} | \
					${SED} -e 's,^${TARGETDIR}/,,' >> ${TMPPLIST}; \
				fi; \
			fi
.		endfor
		@${FIND} -P ${FAKE_DESTDIR}${PORTDOCS:S/^/${DOCSDIR}\//} ! -type d 2>/dev/null | \
			${SED} -ne 's,^${FAKE_DESTDIR}${TARGETDIR}/,,p' >> ${TMPPLIST}
		@${FIND} -P -d ${FAKE_DESTDIR}${PORTDOCS:S/^/${DOCSDIR}\//} -type d 2>/dev/null | \
			${SED} -ne 's,^${FAKE_DESTDIR}${TARGETDIR}/,@dirrm ,p' >> ${TMPPLIST}
		@${ECHO_CMD} "@dirrm ${DOCSDIR:S,^${TARGETDIR}/,,}" >> ${TMPPLIST}
.	else
		@${DO_NADA}
.	endif
.endif

.if !target(add-plist-info)
add-plist-info:
# Process GNU INFO files at package install/deinstall time
.	if defined(INFO)
.		for i in ${INFO}
			@${ECHO_CMD} "@unexec install-info --quiet --delete %D/${INFO_PATH}/$i.info %D/${INFO_PATH}/dir" \
				>> ${TMPPLIST}
			@${ECHO_CMD} ${INFO_PATH}/$i.info >> ${TMPPLIST}
			@${ECHO_CMD} "@exec install-info --quiet %D/${INFO_PATH}/$i.info %D/${INFO_PATH}/dir" \
				>> ${TMPPLIST}
			@if [ "`${DIRNAME} $i`" != "." ]; then \
				${ECHO_CMD} "@dirrmtry info/`${DIRNAME} $i`" >> ${TMPPLIST}; \
			fi
.		endfor

.		if (${PREFIX} != "/usr")
			@${ECHO_CMD} "@unexec if [ -f %D/${INFO_PATH}/dir ]; then if sed -e '1,/Menu:/d' %D/${INFO_PATH}/dir \
				 | grep -q '^[*] '; then true; else rm %D/${INFO_PATH}/dir; fi; fi" >> ${TMPPLIST}

.			if (${PREFIX} != ${LOCALBASE_REL} && ${PREFIX} != ${X11BASE_REL} && ${PREFIX} != ${LINUXBASE_REL})
				@${ECHO_CMD} "@dirrmtry rmdir info/" >> ${TMPPLIST}
.			endif

.		endif
.	endif
.endif

# If we're installing into a non-standard PREFIX, we need to remove that directory at
# deinstall-time
.if !target(add-plist-post)
add-plist-post:
.	if (${PREFIX} != ${LOCALBASE_REL} && ${PREFIX} != ${X11BASE_REL} && ${PREFIX} != ${LINUXBASE_REL} && ${PREFIX} != "/usr")
		@${ECHO_CMD} "@unexec rmdir %D 2> /dev/null || true" >> ${TMPPLIST}
.	else
		@${DO_NADA}
.	endif
.endif


.if !target(install-rc-script)
install-rc-script:
.	if defined(USE_RCORDER) || defined(USE_RC_SUBR) && ${USE_RC_SUBR:U} != "YES"
.		if defined(USE_RCORDER)
			@${ECHO_MSG} "===> Installing early rc.d startup script(s)"
			@${ECHO_CMD} "@cwd /" >> ${TMPPLIST}
			@${INSTALL} -d ${FAKE_DESTDIR}/etc/rc.d
			@for i in ${USE_RCORDER}; do \
				${INSTALL_SCRIPT} ${WRKDIR}/$${i} ${FAKE_DESTDIR}/etc/rc.d/$${i%.sh}; \
				${ECHO_CMD} "etc/rc.d/$${i%.sh}" >> ${TMPPLIST}; \
			done
			@${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}
.		endif
.		if defined(USE_RC_SUBR) && ${USE_RC_SUBR:U} != "YES"
			@${ECHO_MSG} "===> Installing rc.d startup script(s)"
			@${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}
			@for i in ${USE_RC_SUBR}; do \
				${INSTALL_SCRIPT} ${WRKDIR}/$${i} ${FAKE_DESTDIR}${TARGETDIR}/etc/rc.d/$${i%.sh}.sh; \
				${ECHO_CMD} "etc/rc.d/$${i%.sh}.sh" >> ${TMPPLIST}; \
			done
.		endif
.	else
		@${DO_NADA}
.	endif
.endif

#
# Install the ldconfig file if needed. 
#
.if !target(install-ldconfig-file)
install-ldconfig-file:
.	if defined(USE_LDCONFIG) 
.		if (${USE_LDCONFIG} != ${PREFIX}/lib && ${USE_LDCONFIG} != %D/lib)
			@${ECHO_MSG} "===>   Installing ldconfig configuration file."
			@${ECHO_CMD} ${USE_LDCONFIG:S/%D/${PREFIX}/g} | ${TR} ' ' '\n' \
				> ${FAKE_DESTDIR}${PREFIX}/${LDCONFIG_DIR}/${UNIQUENAME}
			@${ECHO_CMD} ${LDCONFIG_DIR}/${UNIQUENAME} >> ${TMPPLIST}
.		endif
.	elif defined(USE_LDCONFIG32)
		@${ECHO_CMD} ${USE_LDCONFIG32} | ${TR} ' ' '\n' \
			> ${FAKE_DESTDIR}${PREFIX}/${LDCONFIG32_DIR}/${UNIQUENAME}
		@${ECHO_CMD} ${LDCONFIG32_DIR}/${UNIQUENAME} >> ${TMPPLIST}
.	else
		@${DO_NADA}
.	endif
.endif



# Compress (or uncompress) and symlink manpages.
.if !target(compress-man)
compress-man:
.  if defined(_FAKEMAN) || defined(_MLINKS)
.    if ${MANCOMPRESSED:L} == yes && defined(NOMANCOMPRESS)
	@${ECHO_MSG} "===>   Uncompressing manual pages for ${PKGNAME}"
	@_manpages='${_FAKEMAN:S/'/'\''/g}' && [ "$${_manpages}" != "" ] && ( eval ${GUNZIP_CMD} $${_manpages} ) || ${TRUE}
.    elif ${MANCOMPRESSED:L} == no && !defined(NOMANCOMPRESS)
	@${ECHO_MSG} "===>   Compressing manual pages for ${PKGNAME}"
	@_manpages='${_FAKEMAN:S/'/'\''/g}' && [ "$${_manpages}" != "" ] && ( eval ${GZIP_CMD} $${_manpages} ) || ${TRUE}
.    endif
.    if defined(_MLINKS)
	@set -- ${_FAKE_MLINKS}; \
	while :; do \
		[ $$# -eq 0 ] && break || ${TRUE}; \
		${RM} -f $${2%.gz}; ${RM} -f $$2.gz; \
		${LN} -fs `${ECHO_CMD} $$1 $$2 | ${AWK} '{ \
					z=split($$1, a, /\//); x=split($$2, b, /\//); \
					while (a[i] == b[i]) i++; \
					for (q=i; q<x; q++) printf "../"; \
					for (; i<z; i++) printf a[i] "/"; printf a[z]; }'` $$2; \
		shift; shift; \
	done
.    endif
.  else
	@${DO_NADA}
.endif
.endif


GENPLIST?=	${.CURDIR}/gen-plist

# Try to make a plist.  This will probably need to be edited.
.if !target(makeplist)
makeplist: fake
	@${ECHO_MSG} "===>   Generating packing list"
	@if [ ! -f ${DESCR} ]; then ${ECHO_MSG} "** Missing pkg-descr for ${PKGNAME}."; exit 1; fi
	@${MKDIR} `${DIRNAME} ${GENPLIST}`
	@> ${GENPLIST}

.	if !defined(NO_MTREE)
		@cd ${FAKE_DESTDIR}${PREFIX}; directories=""; files=""; \
		new=`${MTREE_CMD} -Uf ${MTREE_FILE} | ${SED} -e 's/\s*extra$$//' | ${EGREP} -v "^man/|^share/nls/POSIX|^share/nls/en_US.US-ASCII"`; \
		for file in $$new; do \
			if [ ! -L $$file ] && [ -d $$file ]; then \
				tree=`${FIND} -d $$file -type f -or -type d -or -type l`; \
				for f in $$tree; do \
					if [ -d $$f ]; then \
						directories="$$directories $$f"; \
					else \
						files="$$files $$f"; \
					fi; \
				done; \
			else \
				files="$$files $$file"; \
			fi; \
		done; \
		for file in $$files; do \
			echo $$file >> ${GENPLIST}; \
		done; \
		for dir in $$directories; do \
			echo "@dirrmtry $$dir" >> ${GENPLIST}; \
		done;
.	else 
		@cd ${FAKE_DESTDIR}${PREFIX}; \
		${FIND} -d . ! -type d	| ${SED} -e 's:^\./::' >> ${GENPLIST}; \
		${FIND} -d . -type d ! -name . | ${SED} -e 's:^\./:@dirrmtry :' >> ${GENPLIST};
.	endif


.	if defined(USE_LINUX) && ${PREFIX} != ${LINUXBASE_REL}
		@${ECHO_CMD} '@cwd ${LINUXBASE_REL}' >> ${GENPLIST}
		@cd ${FAKE_DESTDIR}${LINUXBASE_REL}; directoriess=""; files=""; \
		new=`${MTREE_CMD} -Uf ${MTREE_LINUX_FILE} | ${SED} -e 's/\s*extra$$//'`; \
		for file in $$new; do \
			if [ -d $$file ]; then \
				tree=`${FIND} -d $$file -type f -or -type d`; \
				for f in $$tree; do \
					if [ -d $$f ]; then \
						directories="$$directories $$f"; \
					else \
						files="$$files $$f"; \
					fi; \
				done; \
			else \
				files="$$files $$file"; \
			fi; \
		done; \
		for file in $$files; do \
			echo $$file >> ${GENPLIST}; \
		done; \
		for dir in $$directories; do \
			echo "@dirrmtry $$dir" >> ${GENPLIST}; \
		done;
		@${ECHO_CMD} '@cwd ${PREFIX}' >> ${GENPLIST}
.	endif
.endif


#
# check to see how things went with a fake.
#
.if !target(check-fake)
check-fake: 
	@${PORTSDIR}/Tools/scripts/chkfake.pl ${TMPPLIST} ${FAKE_DESTDIR} ${PREFIX}
.endif
	

# Depend is generally meaningless for arbitrary ports, but if someone wants
# one they can override this.  This is just to catch people who've gotten into
# the habit of typing `make depend all install' as a matter of course.
#
.if !target(depend)
depend:
.endif

# Same goes for tags
.if !target(tags)
tags:
.endif

.if !defined(NOPRECIOUSSOFTMAKEVARS)
.for softvar in CKSUMFILES _MLINKS
.if defined(${softvar})
__softMAKEFLAGS+=      '${softvar}+=${${softvar}:S/'/'\''/g}'
.endif
.endfor
.endif

.if !defined(NOPRECIOUSMAKEVARS)
# These won't change, so we can pass them through the environment
.MAKEFLAGS: \
	ARCH="${ARCH:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	OPSYS="${OPSYS:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	OSREL="${OSREL:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	OSVERSION="${OSVERSION:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	PORTOBJFORMAT="${PORTOBJFORMAT:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	SYSTEMVERSION="${SYSTEMVERSION:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}"
.endif

.if !target(config)
config:
.if !defined(OPTIONS)
	@${ECHO_MSG} "===> No options to configure"
.else
.if ${OPTIONSFILE} != ${_OPTIONSFILE}
	@${ECHO_MSG} "===> Using wrong configuration file ${_OPTIONSFILE}"
	@exit 1
.endif
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@${ECHO_MSG} "===>  Switching to root credentials to create `${DIRNAME} ${_OPTIONSFILE}`"
	@(${SU_CMD} "${SH} -c \"${MKDIR} `${DIRNAME} ${_OPTIONSFILE}` 2> /dev/null\"") || \
		(${ECHO_MSG} "===> Cannot create `${DIRNAME} ${_OPTIONSFILE}`, check permissions"; exit 1)
	@${ECHO_MSG} "===>  Returning to user credentials"
.else
	@(${MKDIR} `${DIRNAME} ${_OPTIONSFILE}` 2> /dev/null) || \
		(${ECHO_MSG} "===> Cannot create `${DIRNAME} ${_OPTIONSFILE}`, check permissions"; exit 1)
.endif
	-@if [ -e ${_OPTIONSFILE} ]; then \
		. ${_OPTIONSFILE}; \
	fi; \
	set -- ${OPTIONS} XXX; \
	while [ $$# -gt 3 ]; do \
		OPTIONSLIST="$${OPTIONSLIST} $$1"; \
		defaultval=$$3; \
		withvar=WITH_$$1; \
		withoutvar=WITHOUT_$$1; \
		withval=$$(eval ${ECHO_CMD} $$\{$${withvar}\}); \
		withoutval=$$(eval ${ECHO_CMD} $$\{$${withoutvar}\}); \
		if [ ! -z "$${withval}" ]; then \
			val=on; \
		elif [ ! -z "$${withoutval}" ]; then \
			val=off; \
		else \
			val=$$3; \
		fi; \
		DEFOPTIONS="$${DEFOPTIONS} $$1 \"$$2\" $${val}"; \
		shift 3; \
	done; \
	TMPOPTIONSFILE=$$(mktemp -t portoptions); \
	trap "${RM} -f $${TMPOPTIONSFILE}; exit 1" 1 2 3 5 10 13 15; \
	${SH} -c "${DIALOG} --checklist \"Options for ${PKGNAME:C/-([^-]+)$/ \1/}\" 21 70 15 $${DEFOPTIONS} 2> $${TMPOPTIONSFILE}"; \
	status=$$?; \
	if [ $${status} -ne 0 ] ; then \
		${RM} -f $${TMPOPTIONSFILE}; \
		${ECHO_MSG} "===> Options unchanged"; \
		exit 0; \
	fi; \
	if [ ! -e ${TMPOPTIONSFILE} ]; then \
		${ECHO_MSG} "===> No user-specified options to save for ${PKGNAME}"; \
		exit 0; \
	fi; \
	SELOPTIONS=$$(${CAT} $${TMPOPTIONSFILE}); \
	${RM} -f $${TMPOPTIONSFILE}; \
	TMPOPTIONSFILE=$$(mktemp -t portoptions); \
	trap "${RM} -f $${TMPOPTIONSFILE}; exit 1" 1 2 3 5 10 13 15; \
	${ECHO_CMD} "# This file is auto-generated by 'make config'." > $${TMPOPTIONSFILE}; \
	${ECHO_CMD} "# No user-servicable parts inside!" >> $${TMPOPTIONSFILE}; \
	${ECHO_CMD} "# Options for ${PKGNAME}" >> $${TMPOPTIONSFILE}; \
	${ECHO_CMD} "_OPTIONS_READ=${PKGNAME}" >> $${TMPOPTIONSFILE}; \
	for i in $${OPTIONSLIST}; do \
		${ECHO_CMD} $${SELOPTIONS} | ${GREP} -qw $${i}; \
		if [ $$? -eq 0 ]; then \
			${ECHO_CMD} WITH_$${i}=true >> $${TMPOPTIONSFILE}; \
		else \
			${ECHO_CMD} WITHOUT_$${i}=true >> $${TMPOPTIONSFILE}; \
		fi; \
	done; \
	if [ `${ID} -u` != 0 -a "x${INSTALL_AS_USER}" = "x" ]; then \
		${ECHO_MSG} "===>  Switching to root credentials to write ${_OPTIONSFILE}"; \
		${SU_CMD} "${CAT} $${TMPOPTIONSFILE} > ${_OPTIONSFILE}"; \
		${ECHO_MSG} "===>  Returning to user credentials"; \
	else \
		${CAT} $${TMPOPTIONSFILE} > ${_OPTIONSFILE}; \
	fi; \
	${RM} -f $${TMPOPTIONSFILE}
.endif
.endif

.if !target(config-recursive)
config-recursive:
	@${ECHO_MSG} "===> Setting user-specified options for ${PKGNAME} and dependencies";
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} config-conditional); \
	done
.endif

.if !target(config-conditional)
config-conditional:
.if defined(OPTIONS) && !exists(${_OPTIONSFILE})
	cd ${.CURDIR} && ${MAKE} config;
.endif
.endif

.if !target(showconfig)
showconfig:
.if defined(OPTIONS)
	@${ECHO_MSG} "===> The following configuration options are available for ${PKGNAME}:"
	-@if [ -e ${_OPTIONSFILE} ]; then \
		. ${_OPTIONSFILE}; \
	fi; \
	set -- ${OPTIONS} XXX; \
	while [ $$# -gt 3 ]; do \
		defaultval=$$3; \
		withvar=WITH_$$1; \
		withoutvar=WITHOUT_$$1; \
		withval=$$(eval ${ECHO_CMD} $$\{$${withvar}\}); \
		withoutval=$$(eval ${ECHO_CMD} $$\{$${withoutvar}\}); \
		if [ ! -z "$${withval}" ]; then \
			val=on; \
		elif [ ! -z "$${withoutval}" ]; then \
			val=off; \
		else \
			val="$$3 (default)"; \
		fi; \
		${ECHO_MSG} "     $$1=$${val} \"$$2\""; \
		shift 3; \
	done
	@${ECHO_MSG} "===> Use 'make config' to modify these settings"
.endif
.endif

.if !target(rmconfig)
rmconfig:
.if defined(OPTIONS) && exists(${_OPTIONSFILE})
	-@${ECHO_MSG} "===> Removing user-configured options for ${PKGNAME}"; \
	if [ `${ID} -u` != 0 -a "x${INSTALL_AS_USER}" = "x" ]; then \
		${ECHO_MSG} "===> Switching to root credentials to remove ${_OPTIONSFILE} and `${DIRNAME} ${_OPTIONSFILE}`"; \
		${SU_CMD} "${RM} -f ${_OPTIONSFILE} ; \
			${RMDIR} `${DIRNAME} ${_OPTIONSFILE}`"; \
		${ECHO_MSG} "===> Returning to user credentials"; \
	else \
		${RM} -f ${_OPTIONSFILE}; \
		${RMDIR} `${DIRNAME} ${_OPTIONSFILE}`; \
	fi
.else
	@${ECHO_MSG} "===> No user-specified options configured for ${PKGNAME}"
.endif
.endif

.if !target(rmconfig-recursive)
rmconfig-recursive:
	@${ECHO_MSG} "===> Removing user-specified options for ${PKGNAME} and dependencies";
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} rmconfig); \
	done
.endif

desktop-categories:
	@categories=""; \
	for native_category in ${CATEGORIES}; do \
		c=""; \
		case $$native_category in \
			accessibility)	c="Accessibility Utility"		;; \
			archivers)		c="Archiving"					;; \
			astro)			c="Astronomy Science Education"	;; \
			audio)			c="Audio AudioVideo"			;; \
			benchmarks)		c="System"						;; \
			biology)		c="Biology Science Education"	;; \
			cad)			c="Engineering"					;; \
			databases)		c="Database"					;; \
			deskutils)		c="Utility"						;; \
			devel)			c="Development"					;; \
			dns)			c="Network"						;; \
			elisp)			c="Development"					;; \
			emulators)		c="Emulator"					;; \
			finance)		c="Finance Office"				;; \
			ftp)			c="FileTransfer Network"		;; \
			games)			c="Game"						;; \
			gnome)			c="GNOME GTK"					;; \
			graphics)		c="Graphics"					;; \
			hamradio)		c="HamRadio"					;; \
			haskell)		c="Development"					;; \
			ipv6)			c="Network"						;; \
			irc)			c="IRCClient Network"			;; \
			java)			c="Java Development"			;; \
			kde)			c="KDE QT"						;; \
			lang)			c="Development"					;; \
			lisp)			c="Development"					;; \
			mail)			c="Email Office Network"		;; \
			mbone)			c="Network AudioVideo"			;; \
			multimedia)		c="AudioVideo"					;; \
			net)			c="Network"						;; \
			net-im)			c="InstantMessaging Network"	;; \
			net-mgmt)		c="Network"						;; \
			net-p2p)		c="P2P Network"					;; \
			news)			c="News"						;; \
			pear)			c="WebDevelopment Development"	;; \
			perl5)			c="Development"					;; \
			python)			c="Development"					;; \
			ruby)			c="Development"					;; \
			rubygems)		c="Development"					;; \
			scheme)			c="Development"					;; \
			science)		c="Science Education"			;; \
			security)		c="Security System"				;; \
			shells)			c="Shell"						;; \
			sysutils)		c="System Utility"				;; \
			tcl*|tk*)		c="Development"					;; \
			www)			c="Network"						;; \
			x11-clocks)		c="Clock Utility"				;; \
			x11-fm)			c="FileManager"					;; \
			xfce)			c="GTK"							;; \
			zope)			c="WebDevelopment Development"	;; \
		esac; \
		if [ -n "$$c" ]; then \
			categories="$$categories $$c"; \
		fi; \
	done; \
	if [ -n "$$categories" ]; then \
		for c in Application $$categories; do ${ECHO_MSG} "$$c"; done \
			| ${SORT} -u | ${TR} '\n' ';'; \
		${ECHO_MSG}; \
	fi

VALID_DESKTOP_CATEGORIES+= Application Core Development Building Debugger IDE \
	GUIDesigner Profiling RevisionControl Translation Office Calendar \
	ContactManagement Database Dictionary Chart Email Finance FlowChart PDA \
	ProjectManagement Presentation Spreadsheet WordProcessor Graphics \
	2DGraphics VectorGraphics RasterGraphics 3DGraphics Scanning OCR \
	Photography Viewer Settings DesktopSettings HardwareSettings \
	PackageManager Network Dialup InstantMessaging IRCClient FileTransfer \
	HamRadio News P2P RemoteAccess Telephony WebBrowser WebDevelopment \
	AudioVideo Audio Midi Mixer Sequencer Tuner Video TV AudioVideoEditing \
	Player Recorder DiscBurning Game ActionGame AdventureGame ArcadeGame \
	BoardGame BlocksGame CardGame KidsGame LogicGame RolePlaying Simulation \
	SportsGame StrategyGame Education Art Construction Music Languages \
	Science Astronomy Biology Chemistry Geology Math MedicalSoftware Physics \
	Teaching Amusement Applet Archiving Electronics Emulator Engineering \
	FileManager Shell Screensaver TerminalEmulator TrayIcon System Filesystem \
	Monitor Security Utility Accessibility Calculator Clock TextEditor KDE \
	GNOME GTK Qt Motif Java ConsoleOnly AdvancedSettings

check-desktop-entries:
.if defined(DESKTOP_ENTRIES)
	@set -- ${DESKTOP_ENTRIES} XXX; \
	if [ `${EXPR} \( $$# - 1 \) % 6` -ne 0 ]; then \
		${ECHO_MSG} "${PKGNAME}: Makefile error: the DESKTOP_ENTRIES list must contain one or more groups of 6 elements"; \
		exit 1; \
	fi; \
	num=1; \
	while [ $$# -gt 6 ]; do \
		entry="#$$num"; \
		if [ -n "$$4" ]; then \
			entry="$$entry ($$4)"; \
		elif [ -n "$$1" ]; then \
			entry="$$entry ($$1)"; \
		fi; \
		if [ -z "$$1" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 1 (Name) is empty"; \
			exit 1; \
		fi; \
		if [ -z "$$4" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 4 (Exec) is empty"; \
			exit 1; \
		fi; \
		if [ -n "$$5" ]; then \
			for c in `${ECHO_CMD} "$$5" | ${TR} ';' ' '`; do \
				if ! ${ECHO_CMD} ${VALID_DESKTOP_CATEGORIES} | ${GREP} -wq $$c; then \
					${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: category $$c is not a valid desktop category"; \
					exit 1; \
				fi; \
			done; \
			if ! ${ECHO_CMD} "$$5" | ${GREP} -q ';$$'; then \
				${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 5 (Categories) does not end with a semicolon"; \
				exit 1; \
			fi; \
		else \
			if [ -z "`cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} desktop-categories`" ]; then \
				${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 5 (Categories) is empty and could not be deduced from the CATEGORIES variable"; \
				exit 1; \
			fi; \
		fi; \
		if [ -z "$$6" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 6 (StartupNotify) is empty"; \
			exit 1; \
		fi; \
		if [ "x$$6" != "xtrue" ] && [ "x$$6" != "xfalse" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 6 (StartupNotify) is not \"true\" or \"false\""; \
			exit 1; \
		fi; \
		shift 6; \
		num=`${EXPR} $$num + 1`; \
	done
.else
	@${DO_NADA}
.endif

.if !target(install-desktop-entries)
install-desktop-entries:
.if defined(DESKTOP_ENTRIES)
	@(${MKDIR} "${DESKTOPDIR}" 2> /dev/null) || \
		(${ECHO_MSG} "===> Cannot create ${DESKTOPDIR}, check permissions"; exit 1)
	@set -- ${DESKTOP_ENTRIES} XXX; \
	if [ -z "${_DESKTOPDIR_REL}" ]; then \
		${ECHO_CMD} "@cwd ${DESKTOPDIR}" >> ${TMPPLIST}; \
	fi; \
	while [ $$# -gt 6 ]; do \
		filename="$$4.desktop"; \
		pathname="${DESKTOPDIR}/$$filename"; \
		categories="$$5"; \
		if [ -z "$$categories" ]; then \
			categories="`cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} desktop-categories`"; \
		fi; \
		${ECHO_CMD} "${_DESKTOPDIR_REL}$$filename" >> ${TMPPLIST}; \
		${ECHO_CMD} "[Desktop Entry]" > $$pathname; \
		${ECHO_CMD} "Type=Application" >> $$pathname; \
		${ECHO_CMD} "Version=0.9.4" >> $$pathname; \
		${ECHO_CMD} "Encoding=UTF-8" >> $$pathname; \
		${ECHO_CMD} "Name=$$1" >> $$pathname; \
		if [ -n "$$2" ]; then \
			${ECHO_CMD} "Comment=$$2" >> $$pathname; \
		fi; \
		if [ -n "$$3" ]; then \
			${ECHO_CMD} "Icon=$$3" >> $$pathname; \
		fi; \
		${ECHO_CMD} "Exec=$$4" >> $$pathname; \
		${ECHO_CMD} "Categories=$$categories" >> $$pathname; \
		${ECHO_CMD} "StartupNotify=$$6" >> $$pathname; \
		shift 6; \
	done; \
	${ECHO_CMD} "@unexec rmdir ${DESKTOPDIR} 2>/dev/null || true" >> ${TMPPLIST}; \
	if [ -z "${_DESKTOPDIR_REL}" ]; then \
		${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}; \
	fi
.else
	@${DO_NADA}
.endif
.endif

.endif
# End of post-makefile section.
