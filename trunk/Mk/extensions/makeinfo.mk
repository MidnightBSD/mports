# $MidnightBSD$
# handle dependency on the makeinfo port
#
# Feature:	makeinfo
# Usage:	USES=makeinfo
# Valid ARGS:	build (default, implicit), run, both
#
# MAINTAINER: ports@MidnightBSD.org

.if !defined(_INCLUDE_USES_MAKEINFO_MK)
_INCLUDE_USES_MAKEINFO_MK=	yes

.if defined(makeinfo_ARGS)
IGNORE=	USES=makeinfo - expects no arguments
.endif

.if !exists(/usr/bin/makeinfo)
BUILD_DEPENDS+=	makeinfo:${PORTSDIR}/print/texinfo
.endif

.endif
