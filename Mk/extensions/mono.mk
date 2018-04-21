# $MidnightBSD$
# $FreeBSD: head/Mk/Uses/mono.mk 411970 2016-03-27 01:23:25Z bapt $
#
# mono (c#) support
#
# Feature:	mono
# Usage:	USES=mono:ARGS
# Valid ARGS:	nuget
#

.if !defined(_INCLUDE_USES_MONO_MK)
_INCLUDE_USES_MONO_MK=	yes

.if !empty(mono_ARGS:Nnuget)
IGNORE=	USES=mono only supports an optional nuget argument
.endif

# Set the location of the .wapi directory so we write to a location we
# can always assume to be writable.
MONO_SHARED_DIR=	${WRKDIR}
CONFIGURE_ENV+=		MONO_SHARED_DIR="${MONO_SHARED_DIR}"
MAKE_ENV+=		MONO_SHARED_DIR="${MONO_SHARED_DIR}" TZ=UTC
BUILD_DEPENDS+=		mono:lang/mono
RUN_DEPENDS+=		mono:lang/mono

# Set the location that webaps served by XSP should use.
XSP_DOCROOT=		${PREFIX}/www/xsp

# gac utilities
GACUTIL=${LOCALBASE}/bin/gacutil /root ${PREFIX}/lib/ /gacdir ${PREFIX}/lib
GACUTIL_INSTALL=${GACUTIL} /i
GACUTIL_INSTALL_PACKAGE=${GACUTIL} /i /package 1.0 /package 2.0

.if ${mono_ARGS:Mnuget}
NUGET_PACKAGEDIR=	${WRKSRC}/packages
EXTRACT_CMD=		${LOCALBASE}/bin/bsdtar
EXTRACT_DEPENDS+=	bsdtar:archivers/libarchive

.  for depend in ${NUGET_DEPENDS}
id=		${depend:C/=.*$//}
version=	${depend:C/^.*=//}
group=		nuget_${id:S/.//g:S/-//g}
nupkg=		${id:tl}.${version}.nupkg
NUPKG_${group}:=	${nupkg}
DISTFILES_${group}:=	${nupkg}:${group}
MASTER_SITES_${group}:=	https://www.nuget.org/api/v2/package/${id}/${version}?dummy=/:${group}
NUGET_NUPKGS_${group}:=	${nupkg}:${depend}

NUGET_DISTFILES+=${NUPKG_nuget_${depend:C/=.*$//:S/.//g:S/-//g}}
DISTFILES+=	${DISTFILES_nuget_${depend:C/=.*$//:S/.//g:S/-//g}}
MASTER_SITES+=	${MASTER_SITES_nuget_${depend:C/=.*$//:S/.//g:S/-//g}}
NUGET_NUPKGS+=	${NUGET_NUPKGS_nuget_${depend:C/=.*$//:S/.//g:S/-//g}}
.  endfor

# Prevent the nuget packages from being extracted (and poluting ${WRKDIR}, however
# only bmake supports this.
.  if !defined(EXTRACT_ONLY) && defined(.PARSEDIR)
EXTRACT_ONLY=	${_DISTFILES:[0]:C/${NUGET_DISTFILES}//g}
.  endif

pre-extract: nuget-extract

_USES_extract+=	900:nuget-extract
nuget-extract:
.  for nupkg in ${NUGET_NUPKGS}
	@${MKDIR} ${NUGET_PACKAGEDIR}/${nupkg:C/^.*://:S/=/./}
	@${LN} -s ${NUGET_PACKAGEDIR}/${nupkg:C/^.*://:S/=/./} ${NUGET_PACKAGEDIR}/${nupkg:C/^.*://:C/=.*//}
	@${EXTRACT_CMD} -xf ${DISTDIR}/${nupkg:C/:.*$//} -C ${NUGET_PACKAGEDIR}/${nupkg:C/^.*://:S/=/./} \
		-s/%2B/\+/g -s/%2B/\+/g -s/%2B/\+/g \
		--exclude '\[Content_Types\].xml' \
		--exclude package/ \
		--exclude _rels/
.  endfor
.endif

makenuget: patch
	@${FIND} ${WRKSRC} -name packages.config | \
		${XARGS} ${SED} -nE 's|.*<package id="([^"]+)" version="([^"]+)"[^/]*/>.*|\1-\2|gp' | \
		${SORT} -u | \
		${SED} \
			-e '1s|^|NUGET_DEPENDS=	|' \
			-e '2,$$s|^|		|g' \
			-e '$$!s|$$| \\|g'

.endif

